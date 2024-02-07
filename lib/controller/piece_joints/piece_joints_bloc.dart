import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/datasource/fetch_data.dart';
import '../../models/item_model.dart';

part 'piece_joints_event.dart';
part 'piece_joints_state.dart';

class PieceJointeBloc extends Bloc<PieceJointesEvent, PieceJointeState> {
  PieceJointeBloc() : super(PieceJointeLoadedState(items: const [])) {
    on<GetPieceJointesEvent>(
      (event, emit) async {
        emit(PieceJointeLoadingState());
        try {
          DataSourceServiceEmp dataSourceServiceEmp = DataSourceServiceEmp();
          List<ItemModel> items = await dataSourceServiceEmp.getPieceJointe();

          emit(PieceJointeLoadedState(items: items));
        } catch (e) {
          List<ItemModel> items =
              affairesData.map((e) => ItemModel.fromJson(e)).toList();
          emit(PieceJointeLoadedState(items: items));
        }
      },
    );
  }
}
