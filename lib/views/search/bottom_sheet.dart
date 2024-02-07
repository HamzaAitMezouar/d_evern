import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/controller/filters_bloc/filters_bloc.dart';
import 'package:search/utils/lists.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      height: 220,
      child: Column(
        children: [
          Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Options",
                style: TextStyle(color: Colors.grey),
              )),
          BlocBuilder<FiltersBloc, FiltersState>(
            builder: (context, state) {
              if (state is! FilterDatabaseState) return Container();
              return Expanded(
                child: ListView.builder(
                  itemCount: databasesList.length,
                  itemBuilder: (context, i) => Row(
                    children: [
                      Checkbox.adaptive(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          value: state.db == i ? true : false,
                          onChanged: (v) {
                            //   sharedPreferences!.setInt("filter", i);
                            BlocProvider.of<FiltersBloc>(context)
                                .add(FiltersDatabaseEvent(db: i));
                            log(i.toString());
                            //     setState(() {});
                          }),
                      Text(databasesList[i]),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
