import 'package:comfy/presentation/pages/category/category_widget.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  
  static const String routeName = '/category';
  const CategoryPage({ Key? key }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    
    final args = ModalRoute.of(context)!.settings.arguments as String;
    print(args);
    int number;
    if (args == 'Men'){
      number = 8;
    }
    else if (args == 'Women'){
      number = 15;
    }
    else{
      number = 6;
    }
    return DefaultTabController(length: number, child: CategoryPageWidget(txt: args,),);
  }
}