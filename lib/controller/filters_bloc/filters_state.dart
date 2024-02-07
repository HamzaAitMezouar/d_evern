part of 'filters_bloc.dart';

@immutable
sealed class FiltersState {}

final class FiltersInitial extends FiltersState {}

final class FilterDatabaseState extends FiltersState {
  final int db;
  final List<String>? filter1;
  final List<String>? filter2;
  final List<String>? filter3;
  FilterDatabaseState(
      {required this.db, this.filter1, this.filter2, this.filter3});
}
