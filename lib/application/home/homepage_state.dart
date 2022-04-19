import 'package:comfy/models/featured.dart';
import 'package:comfy/models/newest.dart';

abstract class HomepageState {}

class HomepageLoadingState extends HomepageState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FailedHomePageState extends HomepageState {
  String errorMessage;

  FailedHomePageState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class HomepageLoadedState extends HomepageState{
  List<Featured?> featured;
  List<Newest> newest;

  HomepageLoadedState({required this.featured, required this.newest});

  @override
  // TODO: implement props
  List<Object?> get props => [featured, newest];

}