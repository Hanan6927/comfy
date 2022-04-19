import 'package:comfy/presentation/core/constants.dart';
import 'package:comfy/presentation/pages/view_all/view_all.dart';
import 'package:flutter/material.dart';

import '../home/horizontal_list.dart';

class CategoryPage extends StatefulWidget {
  static const String routeName = '/category';
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args,
          style: normalStyle,
        ),
      ),
      body: ListView(
        children: [
          Lists.lists("Newest Arrival", context),
          // HorizontalList(anylist: ,),
          Lists.lists("Featured Products", context),
          // HorizontalList(),
        ],
      ),
    );
  }

}
