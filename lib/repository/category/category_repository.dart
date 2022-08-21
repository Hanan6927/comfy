import 'package:comfy/data_provider/category/category_provider.dart';

import '../../models/featured.dart';

class CategoryRepository {
  final CategoryProvider categoryProvider;

  CategoryRepository({required this.categoryProvider});

  Future<List<Featured?>?> getAllByCategoryAndItem(int? category,String? item) async {
    return categoryProvider.getAllByCategoryAndItem(category, item);
  }

  Future<List<Featured?>> getAllByCategory(int category) async {
    return categoryProvider.getAllByCategory(category);
  }

  Future<bool?> isFavourite(int user_id, int product_id) async {
      return categoryProvider.isFavourite(user_id, product_id);
  }

}