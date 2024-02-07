part of 'objects_bloc.dart';

@immutable
sealed class ObjectsEvent {}

class GetObjectsEvent extends ObjectsEvent {}
