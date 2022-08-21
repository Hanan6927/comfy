import 'package:comfy/models/clothes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../pages/view_all/view_all.dart';

String url = "https://comfy-api.herokuapp.com";

TextStyle normalStyle = TextStyle(fontSize: 18, color: Colors.black);

class Lists {
  static Widget lists(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: normalStyle,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ViewAll.routeName, arguments: text);
            },
            child: const Text(
              "View All",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class CustomShimmer extends StatefulWidget {
  const CustomShimmer({Key? key}) : super(key: key);

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 224, 224, 224),
      highlightColor: Color.fromARGB(255, 245, 245, 245),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (1 / 1.5),
        shrinkWrap: true,
        children: List.generate(2, (index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 330,
              child: Card(
                // ignore: prefer_const_literals_to_create_immutables
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Comfy",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
