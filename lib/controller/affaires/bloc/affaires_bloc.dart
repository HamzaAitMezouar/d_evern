import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/models/item_model.dart';

import '../../../data/datasource/fetch_data.dart';

part 'affaires_event.dart';
part 'affaires_state.dart';

class AffairesBloc extends Bloc<AffairesEvent, AffairesState> {
  AffairesBloc()
      : super(AffairesLoadedState(
            items: const [], isList: true, sorteditems: const [])) {
    on<GetAffairesEvent>(
      (event, emit) async {
        emit(AffairesLoadingState());

        try {
          DataSourceServiceEmp dataSourceServiceEmp = DataSourceServiceEmp();
          List<ItemModel> items = await dataSourceServiceEmp.getAffaire();
          emit(AffairesLoadedState(
              items: items, isList: true, sorteditems: items));
        } catch (e) {
          List<ItemModel> items =
              affairesData.map((e) => ItemModel.fromJson(e)).toList();
          emit(AffairesLoadedState(
              items: items, isList: true, sorteditems: items));
        }
      },
    );
    on<SortAffairesEvent>(
      (event, emit) async {
        if (isSorted(event.sortedtems)) {
          log("2");
          emit(AffairesLoadedState(
              items: event.items,
              sorteditems: [
                ...affairesData.map((e) => ItemModel.fromJson(e)).toList(),
              ],
              isList: event.isList));
        } else {
          log("1");
          List<ItemModel> temp = List.from(event.items);
          temp.sort((a, b) => b.date.compareTo(a.date));

          emit(AffairesLoadedState(
              items: event.items, sorteditems: temp, isList: event.isList));
        }
      },
    );
    on<ChangeViewEvent>((event, emit) async {
      emit(AffairesLoadedState(
          items: event.items,
          isList: event.isList,
          sorteditems: event.sortedtems));
    });

    on<FilterAffairesEvent>((event, emit) async {
      if (event.filter1.isEmpty) {
        emit(AffairesLoadedState(
            items: event.items,
            isList: event.isList,
            sorteditems: event.items));
      } else {
        List<ItemModel> tempList = [];
        for (ItemModel item in event.items) {
          if (event.filter1.contains(item.type)) {
            tempList.add(item);
          }
        }

        emit(AffairesLoadedState(
            items: event.items, isList: event.isList, sorteditems: tempList));
      }
    });
  }
  bool isSorted(List<ItemModel> items) {
    for (int i = 0; i < items.length - 1; i++) {
      if (items[i].date.compareTo(items[i + 1].date) < 0) {
        return false;
      }
    }
    return true;
  }
}
