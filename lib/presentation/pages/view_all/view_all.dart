import 'package:comfy/presentation/core/constants.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatefulWidget {
  static const String routeName = '/view_all';
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
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
      body: Container(),
    );
  }
}
