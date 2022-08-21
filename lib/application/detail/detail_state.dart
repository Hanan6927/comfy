import 'package:comfy/models/item_type.dart';

import '../../models/featured.dart';
import '../../models/images.dart';

abstract class DetailState {}

class DetailpageLoadingState extends DetailState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FailedDetailPageState extends DetailState {
  String errorMessage;

  FailedDetailPageState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class DetailpageLoadedState extends DetailState{
  Featured product;
  List<Images> images;
  List<ItemType> items;

  DetailpageLoadedState({required this.product, required this.images, required this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [product, images, items];

}

class DropdownTypeChanged extends DetailState {
  String? value;
  DropdownTypeChanged({required this.value});
}
