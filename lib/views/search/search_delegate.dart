import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/controller/affaires/bloc/affaires_bloc.dart';
import 'package:search/controller/filters_bloc/filters_bloc.dart';
import 'package:search/views/home/widgets/item_card_widget.dart';
import 'package:timeago/timeago.dart' as ta;

import '../../models/item_model.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(Icons.close)),
      BlocBuilder<AffairesBloc, AffairesState>(
        builder: (context, state) {
          if (state is! AffairesLoadedState) return Container();
          return IconButton(
              splashColor: Colors.transparent,
              splashRadius: 1,
              onPressed: () {
                BlocProvider.of<AffairesBloc>(context).add(ChangeViewEvent(
                  isList: !state.isList!,
                  sortedtems: state.sorteditems ?? [],
                  items: state.items,
                ));
              },
              icon: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3)),
                  child: Icon(
                      state.isList! ? Icons.grid_view_outlined : Icons.menu)));
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ItemModel> items = [];
    return BlocBuilder<AffairesBloc, AffairesState>(
      builder: (context, state) {
        if (state is AffairesLoadedState) {
          for (ItemModel item in state.sorteditems ?? []) {
            if (item.title.toLowerCase().contains(query.toLowerCase())) {
              items.add(item);
            }
          }

          return items != []
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Transform.rotate(
                            angle: 1.58,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.sync_alt))),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_alt_sharp)),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                padding: const EdgeInsets.all(5),
                                height: 70,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                      items[index].image,
                                    ))),
                              ),
                              title: Text(items[index].title),
                              trailing: Text(ta.format(items[index].date)),
                            );
                          }),
                    ),
                  ],
                )
              : Container(
                  height: 300,
                  color: Colors.red,
                );
        }
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<AffairesBloc, AffairesState>(
      builder: (context, state) {
        List<ItemModel> items = [];
        if (state is AffairesLoadedState) {
          for (ItemModel item in state.sorteditems ?? []) {
            log(query);
            if (item.title.toLowerCase().contains(query.toLowerCase())) {
              items.add(item);
            }
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.rotate(
                      angle: 1.58,
                      child: IconButton(
                          onPressed: () {
                            BlocProvider.of<AffairesBloc>(context).add(
                              SortAffairesEvent(
                                  sortedtems: items,
                                  items: state.items,
                                  isList: state.isList ?? true),
                            );
                          },
                          icon: const Icon(Icons.sync_alt))),
                  BlocBuilder<FiltersBloc, FiltersState>(
                    builder: (context, filterstate) {
                      if (filterstate is! FilterDatabaseState) {
                        return Container();
                      }
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AffairesBloc>(context).add(
                            FilterAffairesEvent(
                                sortedtems: items,
                                filter1: filterstate.filter1 ?? [],
                                items: state.items,
                                isList: state.isList ?? true),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(Icons.filter_alt_sharp),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: state.isList ?? true
                    ? ListView.builder(
                        itemCount: query.isEmpty ? 0 : items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(5),
                              height: 70,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                    items[index].image,
                                  ))),
                            ),
                            title: Text(items[index].title),
                            trailing: Text(ta.format(items[index].date)),
                          );
                        })
                    : Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: GridView.builder(
                            itemCount: query.isEmpty ? 0 : items.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return CardItem(item: items[index]);
                            }),
                      ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
