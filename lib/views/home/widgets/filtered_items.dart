import 'package:flutter/material.dart';
import 'package:search/models/item_model.dart';
import 'package:search/views/home/widgets/item_card_widget.dart';

class FiltteredItemsList extends StatelessWidget {
  final String filter;
  final List<ItemModel> items;
  const FiltteredItemsList(
      {super.key, required this.filter, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(
          filter,
          style: const TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      
               Expanded(
                  child: Align(
                alignment: Alignment.center,
                child: GridView.builder(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return CardItem(item: items[index]);
                    }),)
        
            
          )
        ],
      ),
    );
  }
}
