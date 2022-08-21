// ignore_for_file: prefer_const_constructors

import 'package:comfy/application/category/category_bloc.dart';
import 'package:comfy/application/category/category_event.dart';
import 'package:comfy/application/category/category_state.dart';
import 'package:comfy/data_provider/category/category_provider.dart';
import 'package:comfy/models/featured.dart';
import 'package:comfy/presentation/core/constants.dart';
import 'package:comfy/presentation/pages/category/category_grid.dart';
import 'package:comfy/presentation/pages/detail/image_slider.dart';
import 'package:comfy/presentation/pages/type/grid_lists.dart';
import 'package:comfy/presentation/pages/view_all/view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../home/horizontal_list.dart';

class CategoryPageWidget extends StatefulWidget {
  String txt;
  CategoryPageWidget({Key? key, required this.txt}) : super(key: key);

  @override
  State<CategoryPageWidget> createState() => __CategoryPageWidgetState();
}

List<Widget> woman_types = [
  Tab(
      child: Text(
    "Dress",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Jumpsuit",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Two Pieces",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Blazer",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Top",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Skirt",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Human Hair",
    style: normalStyle,
  )),
];
List<Widget> both_woman_and_man = [
  Tab(
      child: Text(
    "Suit",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Pajamas",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Accesory",
    style: normalStyle,
  )),
];

List<Widget> all_type = [
  Tab(
      child: Text(
    "All",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Bag",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Shorts",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "T_Shirt",
    style: normalStyle,
  )),
  Tab(
      child: Text(
    "Trouser",
    style: normalStyle,
  )),
];

List<Widget> kid_type = [
  Tab(
      child: Text(
    "Toys",
    style: normalStyle,
  )),
];
late List<Widget> list;
late List<Widget> types;

class __CategoryPageWidgetState extends State<CategoryPageWidget> {
  int? category_num;
  String? item_num;
  List<Featured?>? products;
  @override
  Widget build(BuildContext context) {
    if (widget.txt == "Men") {
      category_num = 2;
      list = all_type + both_woman_and_man;
    } else if (widget.txt == "Women") {
      category_num = 1;
      list = all_type + both_woman_and_man + woman_types;
    } else {
      category_num = 3;
      list = all_type + kid_type;
    }
    final detailBloc = BlocProvider.of<CategoryBloc>(context)
      ..add(LoadInitialCategorypageEvent(category: category_num!));
    final index = DefaultTabController.of(context)!.index;
    print(index);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text(
          '${widget.txt}',
          style: normalStyle,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        bottom: TabBar(
            onTap: ((value) async {
              print(value);
              if (value == 0) {
                detailBloc
                    .add(LoadInitialCategorypageEvent(category: category_num!));
              } else {
                late String name;
                switch (value) {
                  case 1:
                    name = 'bag';
                    break;
                  case 2:
                    name = 'shorts';
                    break;
                  case 3:
                    name = 't_shirt';
                    break;
                  case 4:
                    name = 'trouser';
                    break;
                  case 5:
                    name = 'suit';
                    break;
                  case 6:
                    name = 'pajams';
                    break;
                  case 7:
                    name = 'accesory';
                    break;
                  default:
                }
                if (category_num == 1) {
                  switch (value) {
                    case 8:
                      name = 'dress';
                      break;
                    case 9:
                      name = 'jumpsuit';
                      break;
                    case 10:
                      name = 'two_pieces';
                      break;
                    case 11:
                      name = 'blazer';
                      break;
                    case 12:
                      name = 'top';
                      break;
                    case 13:
                      name = 'skirt';
                      break;
                    case 14:
                      name = 'human_hair';
                      break;
                    default:
                  }
                  if (category_num == 3) {
                    switch (value) {
                      case 5:
                        name = 'toys';
                        break;
                      default:
                    }
                  }
                }
                detailBloc.add(
                    CategoryLoadAllTabs(category: category_num!, item: name));
              }

              //   CategoryProvider provider = CategoryProvider(httpClient: http.Client());
              // products = await provider.getAllByCategoryAndItem(category_num, value);
              // print(products![0]!.itemType);
            }),
            isScrollable: true,
            tabs: list),
      ),
      body: BlocConsumer<CategoryBloc, CategorypageState>(
          listener: (context, state) {
        // TODO: implement listener
      }, builder: (context, state) {
        print(state);
        if (state is CategorypageLoadingState) {
          return CustomShimmer();
        }
        if (state is CategorypageLoadedState) {
          if (widget.txt == "Men") {
            types = [
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType)
            ];
          } else if (widget.txt == "Women") {
            types = [
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
            ];
          } else {
            types = [
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
            ];
          }
          return TabBarView(
            physics: NeverScrollableScrollPhysics(),
            // ignore: prefer_const_literals_to_create_immutables
            children: types,
          );
        }
        if (state is CategoryAllTabsLoaded) {
          if (widget.txt == "Men") {
            types = [
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType)
            ];
          } else if (widget.txt == "Women") {
            types = [
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
            ];
          } else {
            types = [
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
              Gridlists(anylist: state.oneType),
            ];
          }
          var product = state.oneType;
          return TabBarView(
            physics: NeverScrollableScrollPhysics(),
            // ignore: prefer_const_literals_to_create_immutables
            children: types,
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            detailBloc
                .add(LoadInitialCategorypageEvent(category: category_num!));
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
      }),
    );
  }
}
