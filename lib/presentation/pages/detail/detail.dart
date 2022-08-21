import 'package:comfy/presentation/pages/detail/detail_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const String routeName = '/detail';
  const DetailPage({ Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: DetailWidget(id: args,),
      floatingActionButton: SizedBox(
        width: 150,
          child: FloatingActionButton(onPressed: () => {},
          shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.zero
     ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Order Now", style: TextStyle(fontSize: 18),),
          ),
                          backgroundColor: Colors.black,
                        ),
        ),
      
                
      
    );
  }
}