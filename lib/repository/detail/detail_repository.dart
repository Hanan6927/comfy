import 'package:comfy/data_provider/detail/detail_provider.dart';
import 'package:comfy/models/featured.dart';

class DetailpageRepository {
  final DetailPageProvider detailPageProvider;

  DetailpageRepository({required this.detailPageProvider});
  Future<List> getDetail(int id) async {
    return detailPageProvider.getDetail(id);
  }
}