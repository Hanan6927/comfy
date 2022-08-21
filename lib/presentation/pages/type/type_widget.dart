import 'package:comfy/presentation/pages/type/type.dart';
import 'package:flutter/material.dart';

class Typepage extends StatefulWidget {
  static const String routeName = '/type';
  const Typepage({ Key? key }) : super(key: key);

  @override
  State<Typepage> createState() => _TypepageState();
}

class _TypepageState extends State<Typepage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    // ignore: prefer_const_constructors
    return Scaffold(
      body: TypePageWidget(list: args),
    );
  }
}