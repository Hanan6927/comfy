import 'package:comfy/data_provider/home/homepage_provider.dart';
import 'package:comfy/models/featured.dart';
import 'package:comfy/models/newest.dart';

class HomepageRepository {
  final HomepageProvider homepageProvider;

  HomepageRepository({required this.homepageProvider});

  Future<List<Featured?>> getFeatured() async {
    return homepageProvider.getFeatured();
  }

  Future<List<Newest>> getNewest() async {
    return homepageProvider.getNewest();
  }
  
}