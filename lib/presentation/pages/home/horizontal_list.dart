import 'package:comfy/models/featured.dart';
import 'package:comfy/presentation/core/constants.dart';
import 'package:comfy/presentation/pages/type/type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/homepage_bloc.dart';
import '../type/type_widget.dart';

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
      height: 370,
      child: GridView.count(crossAxisCount: 2,
      childAspectRatio: (1 / 1.4),
      shrinkWrap: true,
      children: List.generate(widget.anylist.length, (index) {
        return GestureDetector(
          onTap: (){
            List list = [];
            list.add(widget.anylist[index].prodCategory);
            list.add(widget.anylist[index].itemType);
            print(list[0]);
            Navigator.of(context).pushNamed(Typepage.routeName, arguments: list);
          print(widget.anylist[index].itemType);
          print(widget.anylist[index].prodCategory);
          },
          child: Container(
                width: 200,
                child: Card(
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Column(children: [
                      Image(
                        image: NetworkImage("${widget.anylist[index].imageUrl}"),
                        fit: BoxFit.cover,
                        height: 185,
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
              ),
        );
      }),),
    );
  }
}
