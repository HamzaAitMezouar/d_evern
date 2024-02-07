import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc()
      : super(FilterDatabaseState(
          db: 2,
          filter1: const [],
          filter2: const [],
          filter3: const [],
        )) {
    on<FiltersDatabaseEvent>((event, emit) {
      emit(FilterDatabaseState(
        db: event.db,
        filter1: const [],
        filter2: const [],
        filter3: const [],
      ));
    });
    on<AddFilterEvent>((event, emit) {
      if (state is FilterDatabaseState) {
        final currentState = state as FilterDatabaseState;
        List<String> filter1 = List<String>.from(currentState.filter1 ?? []);
        List<String> filter2 = List<String>.from(currentState.filter2 ?? []);
        List<String> filter3 = List<String>.from(currentState.filter3 ?? []);
        log(filter1.length.toString());
        if (filter1.contains(event.filter1)) {
          filter1.remove(event.filter1);
        } else {
          filter1.add(event.filter1.toString());
        }
        if (filter2.contains(event.filter2)) {
          filter2.remove(event.filter2);
        } else {
          filter2.add(event.filter2.toString());
        }
        if (filter3.contains(event.filter3)) {
          filter3.remove(event.filter3);
        } else {
          filter3.add(event.filter3.toString());
        }
        emit(FilterDatabaseState(
            db: event.db,
            filter1: filter1,
            filter2: filter2,
            filter3: filter3));
      }
    });
  }
}
