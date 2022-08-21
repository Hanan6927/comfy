import 'package:comfy/models/featured.dart';
import 'package:comfy/models/newest.dart';
import 'package:comfy/repository/home/homepage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homepage_event.dart';
import 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState>{
  final HomepageRepository repository;
  HomepageBloc({required this.repository}) : super(HomepageLoadingState()){
    on<LoadIntialHomeEvent>((event, emit) async {
      List<Featured?> featured;
    List<Newest> newest;
    List<Featured?> all;
     emit( HomepageLoadingState());
        print("then here");
        // featured = await repository.getFeatured();
        // print(featured);
        // newest = await repository.getNewest();
        all = await repository.getAll();
        print("newessst");
        emit( HomepageLoadedState(featured: [], newest: [], all: all));
    });
  }


  // Stream<HomepageState> loaded(Emitter<HomepageState> emit) async*{
  //   List<Featured?> featured;
  //   List<Newest> newest;
  //    emit( HomepageLoadingState());
  //       print("then here");
  //       featured = await repository.getFeatured();
  //       print(featured);
  //       newest = await repository.getNewest();
  //       emit( HomepageLoadedState(featured: featured, newest: newest));
  // }
  // Stream<HomepageState> mapEventToState(HomepageEvent event) async*{
  //   List<Featured> featured;
  //   List<Newest> newest;

  //   try{
  //     if (event is  LoadIntialHomeEvent){
  //       print("object");
  //       yield HomepageLoadingState();
  //       print("then here");
  //       featured = await repository.getFeatured();
  //       newest = await repository.getNewest();

  //       yield HomepageLoadedState(featured: featured, newest: newest);

        
  //     }
  //   }
  //  catch(e){
  //    yield FailedHomePageState(e.toString());
  //  } 
  // }

}