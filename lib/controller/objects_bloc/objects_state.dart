part of 'objects_bloc.dart';

@immutable
sealed class ObjectsState {}

final class ObjectsInitial extends ObjectsState {}

final class ObjectsLoadingState extends ObjectsState {}

final class ObjectsLoadedState extends ObjectsState {
  final List<ItemModel> items;
  ObjectsLoadedState({required this.items});
}

final class ObjectsFailedtate extends ObjectsState {}
