part of 'affaires_bloc.dart';

@immutable
sealed class AffairesState {}

final class AffairesInitial extends AffairesState {}

final class AffairesLoadingState extends AffairesState {}

// ignore: must_be_immutable
final class AffairesLoadedState extends AffairesState {
  final List<ItemModel> items;
  final List<ItemModel>? sorteditems;
  bool? isList = true;
  AffairesLoadedState({required this.items, this.sorteditems, this.isList});
}

final class AffairesFailedtate extends AffairesState {}
