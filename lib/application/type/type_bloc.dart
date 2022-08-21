import 'package:comfy/application/type/type_event.dart';
import 'package:comfy/application/type/type_state.dart';
import 'package:comfy/models/featured.dart';
import 'package:comfy/repository/type/typepage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypepageBloc extends Bloc<TypepageEvent,TypepageState> {
  final TypepageRepository repository;

  TypepageBloc({required this.repository}) :super(TypepageLoadingState()){
    on<LoadIntialTypeEvent>((event, emit) async{
      List<Featured?> allByType;

      emit(TypepageLoadingState());
      allByType = await repository.getBytType(event.category, event.type);
      emit(TypepageLoadedState(oneType: allByType));
    });

  }
}