import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/add_affaire/add_screen.dart';
import 'package:search/controller/piece_joints/piece_joints_bloc.dart';
import 'package:search/drawer.dart';
import 'package:search/utils/lists.dart';
import 'package:search/views/home/widgets/home_items_list.dart';
import 'package:search/views/search/search_screen.dart';

import '../../controller/affaires/bloc/affaires_bloc.dart';
import '../../controller/objects_bloc/objects_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<AffairesBloc>(context).add(GetAffairesEvent());

    BlocProvider.of<ObjectsBloc>(context).add(GetObjectsEvent());
    BlocProvider.of<PieceJointeBloc>(context).add(GetPieceJointesEvent());
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    _key.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  icon: const Icon(Icons.search)),
            )
          ],
        ),
      ),
      //e
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        child: const Icon(Icons.add),
      ),
      drawer: const CustomDrawerWidget(),
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Badge(child: Icon(Icons.notifications)),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 190,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    "https://www.lookupstrata.com.au/wp-content/uploads/cctv-camera-privacy.jpg",
                  ),
                  fit: BoxFit.fitWidth,
                )),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5, left: 20),
                      child: Text(
                        "Good evening !",
                        style: TextStyle(
                            fontFamily: "SF",
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30, left: 20),
                      child: Text(
                        "Tuesday, August 22, 2023",
                        style: TextStyle(
                            fontFamily: "SF",
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              BlocBuilder<AffairesBloc, AffairesState>(
                builder: (context, state) {
                  if (state is AffairesLoadingState) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 0.4,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is AffairesLoadedState) {
                    return HomeItemsList(
                      title: "Affaires".toUpperCase(),
                      filters: affairesFilterList,
                      items: state.items,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ObjectsBloc, ObjectsState>(
                builder: (context, state) {
                  if (state is ObjectsLoadingState) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 0.4,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is ObjectsLoadedState) {
                    return HomeItemsList(
                      filters: objectsFilterList,
                      title: "Objects".toUpperCase(),
                      items: state.items,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<PieceJointeBloc, PieceJointeState>(
                builder: (context, state) {
                  if (state is PieceJointeLoadingState) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 0.4,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is PieceJointeLoadedState) {
                    return HomeItemsList(
                      filters: piecejointesFilterList,
                      title: "Piéce jointes".toUpperCase(),
                      items: state.items,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
