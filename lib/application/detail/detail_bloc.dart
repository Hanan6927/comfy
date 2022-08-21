import 'package:comfy/application/detail/detail_event.dart';
import 'package:comfy/application/detail/detail_state.dart';
import 'package:comfy/application/type/type_event.dart';
import 'package:comfy/application/type/type_state.dart';
import 'package:comfy/models/featured.dart';
import 'package:comfy/repository/detail/detail_repository.dart';
import 'package:comfy/repository/type/typepage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/images.dart';

class DetailBloc extends Bloc<DetailEvent,DetailState> {
  final DetailpageRepository repository;

  DetailBloc({required this.repository}) :super(DetailpageLoadingState()){
    on<LoadDetailPageEvent>((event, emit) async{
      List list;

      emit(DetailpageLoadingState());
      list = await repository.getDetail(event.id);
      print(list[2]);
      emit(DetailpageLoadedState(product: list[0], images: list[1], items: list[2]));
    });

    on<DropdownItemChanges>((event, emit) => {
      emit(DropdownTypeChanged(value: event.value))
    });

  }
}