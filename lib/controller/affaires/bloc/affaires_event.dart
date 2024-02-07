part of 'affaires_bloc.dart';

@immutable
sealed class AffairesEvent {}

class GetAffairesEvent extends AffairesEvent {}

class SortAffairesEvent extends AffairesEvent {
  final List<ItemModel> items;
  final bool isList;
  final List<ItemModel> sortedtems;
  SortAffairesEvent(
      {required this.items, required this.isList, required this.sortedtems});
}

class ChangeViewEvent extends AffairesEvent {
  final List<ItemModel> items;
  final List<ItemModel> sortedtems;
  final bool isList;
  ChangeViewEvent(
      {required this.items, required this.isList, required this.sortedtems});
}

class FilterAffairesEvent extends AffairesEvent {
  final List<ItemModel> items;
  final List<ItemModel> sortedtems;
  final bool isList;
  final List<String> filter1;
  FilterAffairesEvent(
      {required this.items,
      required this.isList,
      required this.filter1,
      required this.sortedtems});
}
