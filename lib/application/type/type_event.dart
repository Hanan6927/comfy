abstract class TypepageEvent {}

class LoadIntialTypeEvent extends TypepageEvent{
  int category;
  String type;

  LoadIntialTypeEvent({required this.category, required this.type});
}

