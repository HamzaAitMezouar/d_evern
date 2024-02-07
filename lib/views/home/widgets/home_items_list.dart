
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:search/models/item_model.dart';
import 'package:search/views/home/widgets/filtered_items.dart';
import 'package:search/views/home/widgets/item_card_widget.dart';

class HomeItemsList extends StatefulWidget {
  final String title;
  final List<ItemModel> items;
  final List<String> filters;
  const HomeItemsList(
      {super.key,
      required this.title,
      required this.items,
      required this.filters});

  @override
  State<HomeItemsList> createState() => _HomeItemsListState();
}

class _HomeItemsListState extends State<HomeItemsList> {
  String selectedAffaires = 'Recentes';
  String selecteObject = 'Personnes';
  String selectedpj = 'Recentes';
  bool listTitle(String selected) {
    bool returned = false;

    if (widget.title == "Affaires".toUpperCase()) {
      if (selected == selectedAffaires) returned = true;
    } else if (widget.title == "Objects".toUpperCase()) {
      if (selected == selecteObject) returned = true;
    }
    if (widget.title == "Piéce jointes".toUpperCase()) {
      if (selected == selectedpj) returned = true;
    }
    return returned;
  }

  clickNavBar(String clicked) {
    if (widget.title == "Affaires".toUpperCase()) {
      selectedAffaires = clicked;
    } else if (widget.title == "Objects".toUpperCase()) {
      selecteObject = clicked;
    }
    if (widget.title == "Piéce jointes".toUpperCase()) {
      selectedpj = clicked;
    }
    setState(() {});
  }

  List<ItemModel> filteredList() {
    List<ItemModel> returnedList = [];
    if (widget.title == "Affaires".toUpperCase()) {
      for (ItemModel it in widget.items) {
        if (it.type.toLowerCase().contains(selectedAffaires.toLowerCase())) {
          returnedList.add(it);
        }
      }
    } else if (widget.title == "Objects".toUpperCase()) {
      for (ItemModel it in widget.items) {
        if (it.type.toLowerCase().contains(selecteObject.toLowerCase())) {
          returnedList.add(it);
        }
      }
    }
    if (widget.title == "Piéce jointes".toUpperCase()) {
      for (ItemModel it in widget.items) {
        if (it.type.toLowerCase().contains(selectedpj.toLowerCase())) {
          returnedList.add(it);
        }
      }
    }
    return returnedList;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
        color: Colors.white,
        height: size.height * 0.4,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: FiltteredItemsList(
                              filter: widget.title,
                              items: widget.items,
                            ),
                            type: PageTransitionType.theme,
                            alignment: Alignment.center));
                  },
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                height: 30,
                width: size.width,
                child: Row(children: [
                  for (int i = 0; i < widget.filters.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          clickNavBar(widget.filters[i]);
                        },
                        child: Text(
                          widget.filters[i],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: listTitle(widget.filters[i])
                                  ? const Color.fromARGB(255, 2, 104, 187)
                                  : const Color.fromARGB(255, 19, 18, 18)),
                        ),
                      ),
                    )
                ]),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      filteredList().length < 10 ? filteredList().length : 10,
                  itemBuilder: (context, index) {
                    ItemModel item = filteredList()[index];
                    return CardItem(
                      item: item,
                    );
                  }),
            )),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
