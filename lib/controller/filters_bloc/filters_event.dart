part of 'filters_bloc.dart';

@immutable
abstract class FiltersEvent {}

final class FiltersDatabaseEvent extends FiltersEvent {
  final int db;

  FiltersDatabaseEvent({
    required this.db,
  });
}

final class AddFilterEvent extends FiltersEvent {
  final String? filter1;
  final int db;
  final String? filter2;
  final String? filter3;
  AddFilterEvent({this.filter1, this.filter2, this.filter3, required this.db});
}
