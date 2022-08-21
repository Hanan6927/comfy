import 'package:comfy/application/favourite/favourite_bloc.dart';
import 'package:comfy/application/favourite/favourite_event.dart';
import 'package:comfy/application/favourite/favourite_state.dart';
import 'package:comfy/models/featured.dart';
import 'package:comfy/presentation/core/constants.dart';
import 'package:comfy/presentation/pages/detail/detail.dart';
import 'package:comfy/presentation/pages/detail/item_size.dart';
import 'package:comfy/presentation/pages/type/type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Gridlists extends StatefulWidget {
  List<Featured?>? anylist;
  Gridlists({Key? key, required this.anylist}) : super(key: key);

  @override
  State<Gridlists> createState() => _GridlistsState();
}

class _GridlistsState extends State<Gridlists> {
  @override
  Widget build(BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavouriteBloc>(context)..add(LoadFavouriteEvent());
    return Container(
      child: widget.anylist == null
          ? Text(
              "There is no available product",
              style: normalStyle,
            )
          : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (1 / 1.5),
              shrinkWrap: true,
              children: List.generate(widget.anylist!.length, (index) {
                return Container(
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
                            GestureDetector(
                              onTap: () {
                                print("Clicled");
                                Navigator.of(context).pushNamed("/detail",
                                    arguments: widget.anylist![index]!.id);
                                //  Navigator.of(context)
                                //   .pushNamed(ItemSize.routeName, arguments: widget.anylist[index].id);
                              },
                              child: Image(
                                image: NetworkImage(
                                    "${widget.anylist![index]!.imageUrl}"),
                                fit: BoxFit.cover,
                                height: 250,
                              ),
                            ),
                            BlocBuilder<FavouriteBloc, FavouriteState>(
                              builder: (context, state) {
                                if (state is FavouriteLoadedState) {
                                  return IconButton(
                                    icon: state == true
                                        ? Icon(Icons.favorite)
                                        : Icon(Icons.favorite_border_outlined),
                                    onPressed: () {
                                      print("object loaded");
                                      favoriteBloc.add(FavouriteIconClicked(
                                          user_id: 1,
                                          product_id:
                                              widget.anylist![index]!.id!));
                                    },
                                  );
                                }
                                return IconButton(
                                  icon: Icon(Icons.favorite),
                                  onPressed: () {
                                    print("object");
                                    favoriteBloc.add(FavouriteIconClicked(
                                        user_id: 1,
                                        product_id:
                                            widget.anylist![index]!.id!));
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.anylist![index]!.regularPrice}",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
