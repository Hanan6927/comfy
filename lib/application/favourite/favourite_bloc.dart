import 'package:comfy/application/category/category_event.dart';
import 'package:comfy/application/category/category_state.dart';
import 'package:comfy/application/favourite/favourite_event.dart';
import 'package:comfy/application/favourite/favourite_state.dart';
import 'package:comfy/repository/category/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/featured.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final CategoryRepository repository;
  FavouriteBloc({required this.repository}) : super(FavouriteLoading()){
    on<FavouriteIconClicked>((event, emit) async{
      bool? favourite;
      favourite = await repository.isFavourite(event.user_id, event.product_id);
      print(favourite);

      // allByType = await repository.getAllByCategoryAndItem(event.category, event.item);
      emit(FavouriteLoadedState(favourite: favourite));
    });
    on<LoadFavouriteEvent>((event, emit) async{
      bool? favourite;
      emit(FavouriteLoading());
    });
  }
}

