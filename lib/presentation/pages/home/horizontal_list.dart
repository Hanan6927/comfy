import 'package:comfy/models/featured.dart';
import 'package:comfy/presentation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/homepage_bloc.dart';

class HorizontalList extends StatefulWidget {
  List<dynamic> anylist;

  HorizontalList({Key? key, required this.anylist}) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 230,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.anylist.length,
          itemBuilder: (context, index) {
            print(widget.anylist[index].name);
            return Container(
              width: 200,
              child: Card(
                // ignore: prefer_const_literals_to_create_immutables
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(children: [
                    Image(
                      image: NetworkImage("${url+widget.anylist[index].imageUrl}"),
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                         Expanded(child: Text("${widget.anylist[index].name}")),
                         Expanded(
                           child: Column(
                             // ignore: prefer_const_literals_to_create_immutables
                             children: [
                                // ignore: prefer_const_constructors
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Text("${widget.anylist[index].regularPrice}", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),),
                                ),
                            // ignore: prefer_const_constructors
                            Text("${widget.anylist[index].price}" , style: TextStyle(color: Colors.red),)
                             ],
                           ),
                         )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            );
          }),
    );
  }
}
