import 'package:comfy/models/featured.dart';

abstract class CategorypageEvent {}

class LoadInitialCategorypageEvent extends CategorypageEvent {
  int category;
  int? item;
  LoadInitialCategorypageEvent({required this.category, this.item});
}

class CategoryLoadAllTabs extends CategorypageEvent {
  int? category;
  String? item;
  CategoryLoadAllTabs({required this.category, required this.item});
}