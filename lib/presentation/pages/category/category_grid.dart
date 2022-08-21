import 'package:comfy/application/category/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/category/category_bloc.dart';
import '../../../application/category/category_event.dart';
import '../detail/detail.dart';

class CategoryGrid extends StatefulWidget {
  int? category;
  String? item;
  CategoryGrid({Key? key, required this.category, required this.item})
      : super(key: key);

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    int? category_num;
    final detailBloc = BlocProvider.of<CategoryBloc>(context)
      ..add(CategoryLoadAllTabs(category: widget.category, item: widget.item));
    return BlocConsumer<CategoryBloc, CategorypageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        print(state);
        if (state is CategorypageLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        if (state is CategorypageLoadedState){

        return Container(
          child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (1 / 1.4),
        shrinkWrap: true,
        children: List.generate(state.oneType.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(DetailPage.routeName, arguments: state.oneType[index]!.id);
                //  Navigator.of(context)
                //   .pushNamed(ItemSize.routeName, arguments: widget.anylist[index].id);
                  
             
            },
            child: Container(
              width: 330,
              child: Card(
                // ignore: prefer_const_literals_to_create_immutables
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image(
                      image: NetworkImage("${state.oneType[index]!.imageUrl}"),
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                    Icon(Icons.favorite),
                      ],
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${state.oneType[index]!.regularPrice}",
                        // ignore: prefer_const_constructors
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        }),
      ),
        );}
        return RefreshIndicator(
            onRefresh: () async {
              detailBloc.add(LoadInitialCategorypageEvent(category: category_num!));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      Center(
                          child: Text("Drag Down to see changes",
                              style: TextStyle(fontSize: 16.0)))
                    ]),
              ),
            ),
          );
      },
      
    );
  }
}
