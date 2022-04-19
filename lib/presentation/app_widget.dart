import 'package:comfy/application/home/homepage_bloc.dart';
import 'package:comfy/application/home/homepage_event.dart';
import 'package:comfy/data_provider/home/homepage_provider.dart';
import 'package:comfy/presentation/pages/category/category_widget.dart';
import 'package:comfy/presentation/pages/home/home_widget.dart';
import 'package:comfy/presentation/pages/view_all/view_all.dart';
import 'package:comfy/repository/home/homepage_repository.dart';
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
    final homepageRepository = HomepageRepository(
        homepageProvider: HomepageProvider(httpClient: http.Client()));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomepageBloc(repository: homepageRepository)
            ..add(LoadIntialHomeEvent()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          CategoryPage.routeName: (context) => const CategoryPage(),
          ViewAll.routeName: (context) => const ViewAll()
        },
      ),
    );
  }
}
