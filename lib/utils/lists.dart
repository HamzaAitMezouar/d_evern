import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<String> affairesFilterList = ["Recentes", "Pourait m'interesser"];
final List<String> objectsFilterList = [
  "Personnes",
  "Armes",
  "Evenement",
  "Autres"
];
final List<String> piecejointesFilterList = ["Recentes", "Autres"];

final List<String> databasesList = ["National", "International", "Tout"];

final List firstFilterList = [
  {"name": "Personnes", "icon": Icons.person},
  {"name": "Lorem ipsum", "icon": null},
  {"name": "Armes", "icon": null},
  {"name": "Animeux", "icon": FontAwesomeIcons.dog},
  {"name": "Evenement", "icon": Icons.event_note_rounded},
  {"name": "Autres", "icon": Icons.more_horiz}
];
final List secondFilterList = [
  {"name": "Nomines", "icon": null},
  {"name": "SLTD", "icon": null},
  {"name": "SMV", "icon": Icons.military_tech},
  {"name": "TDAWN", "icon": null}
];
final List thirdFilterList = [
  {"name": "Photos", "icon": Icons.photo},
  {"name": "Rapport", "icon": Icons.text_snippet},
  {"name": "CINB", "icon": null},
  {"name": "Acte de naissance", "icon": Icons.file_copy_sharp},
];
final List forthFilterList = [
  {"name": "Gendarmerie", "icon": null},
  {"name": "Police", "icon": Icons.local_police},
  {"name": "Douane", "icon": null},
];
