import '../../models/featured.dart';

abstract class CategorypageState {}

class CategorypageLoadingState extends CategorypageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FailedCategoryPageState extends CategorypageState {
  String errorMessage;

  FailedCategoryPageState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class CategorypageLoadedState extends CategorypageState{
  List<Featured?> oneType;

  CategorypageLoadedState({required this.oneType});

  @override
  // TODO: implement props
  List<Object?> get props => [oneType];

}

class CategoryAllTabsLoaded extends CategorypageState{
  List<Featured?>? oneType;

  CategoryAllTabsLoaded({required this.oneType});

  @override
  // TODO: implement props
  List<Object?> get props => [oneType];
}
