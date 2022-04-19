import 'package:comfy/application/home/homepage_bloc.dart';
import 'package:comfy/application/home/homepage_state.dart';
import 'package:comfy/presentation/pages/category/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/homepage_event.dart';
import '../../core/constants.dart';
import 'horizontal_list.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
  final homepageBloc = BlocProvider.of<HomepageBloc>(context);
     
    return BlocConsumer<HomepageBloc, HomepageState>(builder: (context, homepageState){
      if (homepageState is HomepageLoadingState){
         return const Center(
            child: CircularProgressIndicator(),
          );
      }
       
      if (homepageState is HomepageLoadedState){
        var featured = homepageState.featured;
        var newest = homepageState.newest;

        return RefreshIndicator(onRefresh: () async {
              homepageBloc.add(LoadIntialHomeEvent());
            },
            child: ListView(
        shrinkWrap: true,
        children: [
          // ignore: prefer_const_constructors
          Image(
            image: const AssetImage("assets/images/b1.jpg"),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              Expanded(child: category(Color.fromARGB(255, 190, 33, 119), Icons.boy_outlined, "Men")),
              Expanded(child: category(Color.fromARGB(255, 104, 154, 196), Icons.girl, "Women")),
              Expanded(child: category(Colors.orange, Icons.child_care, "Kid"))
            ],),
          ),
          Lists.lists("Newest Arrival", context),
          HorizontalList(anylist: newest,),
          Lists.lists("Featured Products", context),
          HorizontalList(anylist: featured,),
        ],
      ),);
      }
       return RefreshIndicator(
          onRefresh: () async {
            homepageBloc.add(LoadIntialHomeEvent());
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const Center(
                        child: Text("Drag Down to see changes",
                            style: TextStyle(fontSize: 16.0)))
                  ]),
            ),
          ),
        );
    }, listener: (ctx,stat){});
    
  }

  Widget category(Color color, IconData icon, String text){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(CategoryPage.routeName, arguments: text);
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 65,
                width: 65,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                ),
              ),
              Icon(icon, color: Colors.white,size: 30,)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(text, style: TextStyle(color: color),),
          )        
        ],
      ),
    );
  }
}