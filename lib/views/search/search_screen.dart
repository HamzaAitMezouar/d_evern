import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:search/controller/filters_bloc/filters_bloc.dart';
import 'package:search/utils/lists.dart';
import 'package:search/views/home/home_screen.dart';
import 'package:search/views/search/search_delegate.dart';

import '../../drawer.dart';
import 'bottom_sheet.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is! FilterDatabaseState) {
          return Material(
            child: Container(),
          );
        }
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                          key.currentState!.openDrawer();
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
            key: key,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: TextField(
                onTap: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                decoration: const InputDecoration(
                    hintText: 'Rechercher...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 18)),
                onChanged: (query) {
                  // Update search query
                },
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const HomeScreen(),
                            type: PageTransitionType.leftToRight));
                  },
                  icon: const Icon(Icons.arrow_back)),
              actions: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => const FilterBottomSheet());
                    },
                    icon: const Icon(FontAwesomeIcons.database))
              ],
              foregroundColor: Colors.black,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            drawer: const CustomDrawerWidget(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        ...firstFilterList.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilterChip(
                                selectedColor: Colors.blue.withOpacity(0.5),
                                selected: state.filter1!
                                    .contains(e["name"].toString()),
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    e["icon"] == null
                                        ? Container()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Icon(e["icon"]),
                                          ),
                                    Text(e["name"].toString()),
                                  ],
                                ),
                                onSelected: (v) {
                                  BlocProvider.of<FiltersBloc>(context).add(
                                      AddFilterEvent(
                                          db: state.db,
                                          filter1: e["name"].toString()));
                                }),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 50,
                      thickness: 1.9,
                    ),
                    state.db == 1
                        ? Column(
                            children: [
                              Wrap(
                                children: [
                                  ...secondFilterList.map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FilterChip(
                                          selectedColor:
                                              Colors.blue.withOpacity(0.5),
                                          selected: state.filter2!
                                              .contains(e["name"].toString()),
                                          label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              e["icon"] == null
                                                  ? Container()
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10.0),
                                                      child: Icon(e["icon"]),
                                                    ),
                                              Text(e["name"].toString()),
                                            ],
                                          ),
                                          onSelected: (v) {
                                            BlocProvider.of<FiltersBloc>(
                                                    context)
                                                .add(AddFilterEvent(
                                                    db: state.db,
                                                    filter2:
                                                        e["name"].toString()));
                                          }),
                                    ),
                                  ),
                                  const Divider(
                                    height: 50,
                                    thickness: 1.9,
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    Wrap(
                      children: [
                        ...thirdFilterList.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: FilterChip(
                                selectedColor: Colors.blue.withOpacity(0.5),
                                selected: state.filter3!
                                    .contains(e["name"].toString()),
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    e["icon"] == null
                                        ? Container()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Icon(e["icon"]),
                                          ),
                                    Text(e["name"].toString()),
                                  ],
                                ),
                                onSelected: (v) {
                                  BlocProvider.of<FiltersBloc>(context).add(
                                      AddFilterEvent(
                                          db: state.db,
                                          filter3: e["name"].toString()));
                                }),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 50,
                      thickness: 1.9,
                    ),
                    Wrap(
                      children: [
                        ...forthFilterList.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilterChip(
                                selectedColor: Colors.blue.withOpacity(0.5),
                                selected: state.filter3!
                                    .contains(e["name"].toString()),
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    e["icon"] == null
                                        ? Container()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Icon(e["icon"]),
                                          ),
                                    Text(e["name"].toString()),
                                  ],
                                ),
                                onSelected: (v) {
                                  BlocProvider.of<FiltersBloc>(context).add(
                                      AddFilterEvent(
                                          db: state.db,
                                          filter3: e["name"].toString()));
                                }),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
