import 'package:flutter/material.dart';
import 'package:search/models/item_model.dart';
import 'package:timeago/timeago.dart' as tm;

class ItemDetails extends StatelessWidget {
  final ItemModel item;
  const ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.5)),
          child: const BackButton(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: size.height * 0.6,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage(item.image), fit: BoxFit.cover)),
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    tm.format(item.date),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 48, 48, 48)),
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}
