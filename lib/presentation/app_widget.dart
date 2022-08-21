import 'package:comfy/application/category/category_bloc.dart';
import 'package:comfy/application/detail/detail_bloc.dart';
import 'package:comfy/application/favourite/favourite_bloc.dart';
import 'package:comfy/application/home/homepage_bloc.dart';
import 'package:comfy/application/home/homepage_event.dart';
import 'package:comfy/application/type/type_bloc.dart';
import 'package:comfy/application/type/type_event.dart';
import 'package:comfy/data_provider/category/category_provider.dart';
import 'package:comfy/data_provider/detail/detail_provider.dart';
import 'package:comfy/data_provider/home/homepage_provider.dart';
import 'package:comfy/data_provider/type/type_provider.dart';
import 'package:comfy/presentation/pages/category/category.dart';
import 'package:comfy/presentation/pages/category/category_widget.dart';
import 'package:comfy/presentation/pages/detail/detail.dart';
import 'package:comfy/presentation/pages/detail/item_size.dart';
import 'package:comfy/presentation/pages/home/home_widget.dart';
import 'package:comfy/presentation/pages/signin/signin.dart';
import 'package:comfy/presentation/pages/signup/signup.dart';
import 'package:comfy/presentation/pages/type/type.dart';
import 'package:comfy/presentation/pages/type/type_widget.dart';
import 'package:comfy/presentation/pages/view_all/view_all.dart';
import 'package:comfy/repository/category/category_repository.dart';
import 'package:comfy/repository/detail/detail_repository.dart';
import 'package:comfy/repository/home/homepage_repository.dart';
import 'package:comfy/repository/type/typepage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final categorypageRepository = CategoryRepository(categoryProvider: CategoryProvider(httpClient: http.Client()));

    final detailpageRepository = DetailpageRepository(detailPageProvider: DetailPageProvider(httpClient: http.Client()));

    final typepageRepository = TypepageRepository(
      typepageProvider: TypeProvider(httpClient: http.Client()));
    final homepageRepository = HomepageRepository(
        homepageProvider: HomepageProvider(httpClient: http.Client()));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomepageBloc(repository: homepageRepository)
            ..add(LoadIntialHomeEvent()),
        ),
        BlocProvider<TypepageBloc>(
          create: (_) => TypepageBloc(repository: typepageRepository)
        ),
        BlocProvider<DetailBloc>(
          create: (_) => DetailBloc(repository: detailpageRepository)
        ),
        BlocProvider<CategoryBloc>(
          create: (_) => CategoryBloc(repository: categorypageRepository)
        ),
        BlocProvider<FavouriteBloc>(
          create: (_) => FavouriteBloc(repository: categorypageRepository)
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        initialRoute: SignUpPage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          CategoryPage.routeName: (context) => const CategoryPage(),
          ViewAll.routeName: (context) => const ViewAll(),
          Typepage.routeName:(context) => const Typepage(),
          DetailPage.routeName:(context) => const DetailPage(),
          SignUpPage.routeName:(context) => SignUpPage(),
          SignInPage.routeName:(context) => SignInPage()
        },
      ),
    );
  }
}
