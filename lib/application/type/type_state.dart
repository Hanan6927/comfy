import '../../models/featured.dart';

abstract class TypepageState {}

class TypepageLoadingState extends TypepageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FailedTypePageState extends TypepageState {
  String errorMessage;

  FailedTypePageState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class TypepageLoadedState extends TypepageState{
  List<Featured?> oneType;

  TypepageLoadedState({required this.oneType});

  @override
  // TODO: implement props
  List<Object?> get props => [oneType];

}
