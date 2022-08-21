import '../../models/featured.dart';

abstract class FavouriteState {}


class FavouriteLoadedState extends FavouriteState{
  bool? favourite;

  FavouriteLoadedState({required this.favourite});

  @override
  // TODO: implement props
  List<Object?> get props => [favourite];

}

class FavouriteLoading extends FavouriteState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

