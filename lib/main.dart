import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/controller/affaires/bloc/affaires_bloc.dart';
import 'package:search/controller/filters_bloc/filters_bloc.dart';
import 'package:search/controller/objects_bloc/objects_bloc.dart';
import 'package:search/controller/piece_joints/piece_joints_bloc.dart';
import 'package:search/views/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MainApp());
}

SharedPreferences? sharedPreferences;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AffairesBloc(),
          ),
          BlocProvider(
            create: (context) => FiltersBloc(),
          ),
          BlocProvider(
            create: (context) => ObjectsBloc(),
          ),
          BlocProvider(
            create: (context) => PieceJointeBloc(),
          ),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: CustomTabBarView1()));
  }
}
