import 'package:comfy/application/detail/detail_bloc.dart';
import 'package:comfy/application/detail/detail_event.dart';
import 'package:comfy/application/detail/detail_state.dart';
import 'package:comfy/presentation/core/constants.dart';
import 'package:comfy/presentation/pages/detail/image_slider.dart';
import 'package:comfy/presentation/pages/detail/item_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../type/grid_lists.dart';

class DetailWidget extends StatefulWidget {
  int id;
  DetailWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    final detailBloc = BlocProvider.of<DetailBloc>(context)
      ..add(LoadDetailPageEvent(id: widget.id));
    return BlocConsumer<DetailBloc, DetailState>(
        builder: (context, detailpageState) {
          if (detailpageState is DetailpageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (detailpageState is DetailpageLoadedState) {
            var product = detailpageState.product;

            return RefreshIndicator(
              onRefresh: () async {
                detailBloc.add(LoadDetailPageEvent(id: widget.id));
              },
              child: ListView(shrinkWrap: true, children: [
                ImageSlider(
                  list: detailpageState.images,
                  src: product.imageUrl!,
                ),
                ItemSize(
                  list: detailpageState.items,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Price",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${product.price}",
                                  style: TextStyle(fontSize: 30),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  "Description",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${product.description}",
                                  style: TextStyle(fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  "Brand",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${product.brand}",
                                  style: TextStyle(fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                
              ]),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              detailBloc.add(LoadDetailPageEvent(id: widget.id));
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
        listener: (context, state) {});
  }
}
