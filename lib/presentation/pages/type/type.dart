import 'package:comfy/application/type/type_bloc.dart';
import 'package:comfy/application/type/type_event.dart';
import 'package:comfy/application/type/type_state.dart';
import 'package:comfy/presentation/core/constants.dart';
import 'package:comfy/presentation/pages/home/horizontal_list.dart';
import 'package:comfy/presentation/pages/type/grid_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypePageWidget extends StatefulWidget {
  List list;

  TypePageWidget({ Key? key , required this.list}) : super(key: key);

  @override
  State<TypePageWidget> createState() => _TypePageWidgetState();
}

class _TypePageWidgetState extends State<TypePageWidget> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final typepageBloc = BlocProvider.of<TypepageBloc>(context)..add(LoadIntialTypeEvent(category: this.widget.list[0], type: this.widget.list[1]));
    return BlocConsumer<TypepageBloc,TypepageState>(builder: (context, typepageState){
      if (typepageState is TypepageLoadingState){
        return const CustomShimmer();
      }
      if (typepageState is TypepageLoadedState){
        var byType = typepageState.oneType;

        return RefreshIndicator(onRefresh: () async{
          typepageBloc.add(LoadIntialTypeEvent(category: this.widget.list[0], type: this.widget.list[1]));
        },
        child: Gridlists(anylist: byType),
        );
      }
      return RefreshIndicator(
          onRefresh: () async {
            typepageBloc.add(LoadIntialTypeEvent(category: this.widget.list[0], type: this.widget.list[1]));
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
    
    listener: (context,state){});
  }
}