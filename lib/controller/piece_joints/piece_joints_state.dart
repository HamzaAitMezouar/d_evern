part of 'piece_joints_bloc.dart';

@immutable
sealed class PieceJointeState {}

final class PieceJointeInitial extends PieceJointeState {}

final class PieceJointeLoadingState extends PieceJointeState {}

// ignore: must_be_immutable
final class PieceJointeLoadedState extends PieceJointeState {
  final List<ItemModel> items;

  PieceJointeLoadedState({
    required this.items,
  });
}

final class PieceJointeFailedtate extends PieceJointeState {}
