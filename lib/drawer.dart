import 'package:flutter/material.dart';
import 'package:search/views/drawer_item.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List item = [
      {"icon": Icons.home, "label": "Accueil"},
      {"icon": Icons.search, "label": "Recherche"},
      {"icon": Icons.note, "label": "Remarques"},
      {"icon": Icons.person, "label": "Profile"},
      {"icon": Icons.history, "label": "Historique"}
    ];
    Size size = MediaQuery.sizeOf(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: size.height * 0.15,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Text(
                        'T',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Louem ipsum",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Louem ipsum agma",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.settings,
                    size: 30,
                    color: Color.fromARGB(255, 95, 95, 95),
                  ),
                )
              ],
            ),
          ),
          for (int i = 0; i < 5; i++)
            DrawerItemWidget(icon: item[i]["icon"], label: item[i]["label"])
        ],
      ),
    );
  }
}
