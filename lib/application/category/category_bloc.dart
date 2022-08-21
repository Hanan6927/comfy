import 'package:comfy/application/category/category_event.dart';
import 'package:comfy/application/category/category_state.dart';
import 'package:comfy/repository/category/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/featured.dart';

class CategoryBloc extends Bloc<CategorypageEvent, CategorypageState> {
  final CategoryRepository repository;
  CategoryBloc({required this.repository}) : super(CategorypageLoadingState()){
    on<LoadInitialCategorypageEvent>((event, emit) async{
      List<Featured?> allByType;
      List<Featured?> allByTypeAndCategory;

      emit(CategorypageLoadingState());
      allByType = await repository.getAllByCategory(event.category);

      // allByType = await repository.getAllByCategoryAndItem(event.category, event.item);
      emit(CategorypageLoadedState(oneType: allByType));
    });
     on<CategoryLoadAllTabs>((event, emit) async{
      List<Featured?>? allByType;

      emit(CategorypageLoadingState());
      allByType = await repository.getAllByCategoryAndItem(event.category, event.item);
      emit(CategoryAllTabsLoaded(oneType: allByType));
    });
  }
}

