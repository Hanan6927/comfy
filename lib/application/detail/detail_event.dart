abstract class DetailEvent {}

class LoadDetailPageEvent extends DetailEvent {
  int id;

  LoadDetailPageEvent({required this.id});
}

class DropdownItemChanges extends DetailEvent {
  String? value;
  DropdownItemChanges({required this.value});
}