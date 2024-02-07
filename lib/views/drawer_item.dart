import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:search/views/home/home_screen.dart';
import 'package:search/views/search/search_screen.dart';

class DrawerItemWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  const DrawerItemWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == "Recherche") {
          Navigator.push(
              context,
              PageTransition(
                  child: const SearchScreen(),
                  type: PageTransitionType.fade,
                  alignment: Alignment.centerLeft));
        } else {
          Navigator.push(
              context,
              PageTransition(
                  child: const HomeScreen(),
                  type: PageTransitionType.fade,
                  alignment: Alignment.centerLeft));
        }
      },
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
      ),
    );
  }
}
