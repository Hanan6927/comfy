import 'package:comfy/models/featured.dart';

abstract class FavouriteEvent {}

class FavouriteIconClicked extends FavouriteEvent {
  int user_id;
  int product_id;
  FavouriteIconClicked({required this.user_id,required this.product_id});
}

class LoadFavouriteEvent extends FavouriteEvent{
  
}

