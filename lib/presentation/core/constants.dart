import 'package:comfy/models/clothes.dart';
import 'package:flutter/material.dart';

import '../pages/view_all/view_all.dart';

String url = "https://384c-196-191-52-113.ngrok.io";

TextStyle normalStyle = TextStyle(fontSize: 18, color: Colors.black);

class Lists{
  static Widget lists(String text, BuildContext context){
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
                      Navigator.of(context).pushNamed(ViewAll.routeName, arguments: text);
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.grey),
                    ),)
              ],
            ),
          );
  }
}