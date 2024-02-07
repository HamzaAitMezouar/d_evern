import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search/data/datasource/fetch_data.dart';

import '../../models/item_model.dart';

part 'objects_event.dart';
part 'objects_state.dart';

class ObjectsBloc extends Bloc<ObjectsEvent, ObjectsState> {
  ObjectsBloc() : super(ObjectsLoadedState(items: const [])) {
    on<GetObjectsEvent>(
      (event, emit) async {
        emit(ObjectsLoadingState());
        try {
          DataSourceServiceEmp dataSourceServiceEmp = DataSourceServiceEmp();
          List<ItemModel> items = await dataSourceServiceEmp.getObjects();

          emit(ObjectsLoadedState(items: items));
        } catch (e) {
          List<ItemModel> items =
              objectsData.map((e) => ItemModel.fromJson(e)).toList();
          emit(ObjectsLoadedState(items: items));
        }
      },
    );
  }
}
