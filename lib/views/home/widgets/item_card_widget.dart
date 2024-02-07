import 'package:flutter/material.dart';

import '../../../models/item_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class CardItem extends StatefulWidget {
  final ItemModel item;
  const CardItem({super.key, required this.item});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ItemDetails(item: widget.item)));
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              height: size.height * 0.25,
              width: size.width * 0.38,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(255, 181, 181, 181))),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Text(
                            widget.item.title.toString(),
                            style: const TextStyle(
                                fontFamily: "SF",
                                fontSize: 15,
                                letterSpacing: 0.5,
                                color: Color.fromARGB(255, 56, 56, 56),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(),
                          // child: Container(
                          //   decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //     image: NetworkImage(
                          //       widget.item.image,
                          //     ),
                          //     fit: BoxFit.cover,
                          //   )),
                          // ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.timer_sharp,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    " ${timeago.format(widget.item.date)}",
                                    style: const TextStyle(
                                        fontFamily: "SF",
                                        color:
                                            Color.fromARGB(255, 119, 119, 119),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
