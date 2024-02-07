// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  String title;
  String image;
  String description;
  DateTime date;
  String type;
  ItemModel({
    required this.title,
    required this.date,
    required this.type,
    required this.image,
    required this.description,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        title: json["title"],
        image: json["image"],
        date: DateTime.parse(json["date"]),
        type: json["type"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "description": description,
      };
}

var affairesData = [
  {
    "title": "lorem ipsum in",
    "type": "Pourait m'interesser",
    "date": "2023-08-27T11:35:09.846779",
    "image": "https://geographical.co.uk/wp-content/uploads/cctv.jpg",
    "description": "Lurem Upsom 1",
  },
  {
    "title": "Item 2 Autre",
    "type": "Autres",
    "date": "2023-08-27T11:35:09.846779",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWtQzOg6oUHjtcidrtrACHA2oI1Rim_gK95uTwVPfFuowu9_5YNQY9Zv2Qg6pTfnMT1NM&usqp=CAU",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "lerum ipdal",
    "type": "Recentes",
    "date": "2023-08-28T11:35:09.846779",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbprmY__LAvrHEdTsVNpxfa9sj3KtRgGZw7z3ZVMoBXuyle9vT3nkjrmNJ2OXisIVf_vM&usqp=CAU",
    "description": "Lurem Upsom3"
  },
  {
    "title": "Item 4 recentes",
    "type": "Recentes",
    "date": "2023-08-29T11:35:09.846779",
    "image":
        "https://img.freepik.com/premium-photo/viewing-shanghai-overpass-ornamental-telescope_91566-1040.jpg",
    "description": "Lurem Upsom 1"
  },
  {
    "title": "Item 5 ",
    "date": "2023-08-30T10:35:09.846779",
    "type": "Pourait m'interesser",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgwP8Ck1EzhM5k0EJpf7adKLTPsRbNQRQ01zY0calCpfvnoNaxS4_SBUHoPIQWxFSSMGY&usqp=CAU",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "Item 6 ",
    "date": "2023-08-30T11:35:09.846779",
    "type": "Pourait m'interesser",
    "image": "https://geographical.co.uk/wp-content/uploads/cctv.jpg",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "Item 7 ",
    "date": "2023-08-30T12:35:09.846779",
    "type": "Pourait m'interesser",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWtQzOg6oUHjtcidrtrACHA2oI1Rim_gK95uTwVPfFuowu9_5YNQY9Zv2Qg6pTfnMT1NM&usqp=CAU",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "lorem ipsum in",
    "type": "Pourait m'interesser",
    "date": "2023-08-27T11:35:09.846779",
    "image": "https://geographical.co.uk/wp-content/uploads/cctv.jpg",
    "description": "Lurem Upsom 1",
  },
  {
    "title": "Item 2 Autre",
    "type": "Autres",
    "date": "2023-08-27T11:35:09.846779",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWtQzOg6oUHjtcidrtrACHA2oI1Rim_gK95uTwVPfFuowu9_5YNQY9Zv2Qg6pTfnMT1NM&usqp=CAU",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "lerum ipdal",
    "type": "Recentes",
    "date": "2023-08-28T11:35:09.846779",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbprmY__LAvrHEdTsVNpxfa9sj3KtRgGZw7z3ZVMoBXuyle9vT3nkjrmNJ2OXisIVf_vM&usqp=CAU",
    "description": "Lurem Upsom3"
  },
  {
    "title": "Item 4 recentes",
    "type": "Recentes",
    "date": "2023-08-29T11:35:09.846779",
    "image":
        "https://img.freepik.com/premium-photo/viewing-shanghai-overpass-ornamental-telescope_91566-1040.jpg",
    "description": "Lurem Upsom 1"
  },
  {
    "title": "Item 5 ",
    "date": "2023-08-30T10:35:09.846779",
    "type": "Pourait m'interesser",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgwP8Ck1EzhM5k0EJpf7adKLTPsRbNQRQ01zY0calCpfvnoNaxS4_SBUHoPIQWxFSSMGY&usqp=CAU",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "Item 6 ",
    "date": "2023-08-30T11:35:09.846779",
    "type": "Pourait m'interesser",
    "image": "https://geographical.co.uk/wp-content/uploads/cctv.jpg",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "Item 7 ",
    "date": "2023-08-30T12:35:09.846779",
    "type": "Pourait m'interesser",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWtQzOg6oUHjtcidrtrACHA2oI1Rim_gK95uTwVPfFuowu9_5YNQY9Zv2Qg6pTfnMT1NM&usqp=CAU",
    "description": "Lurem Upsom 2"
  }
];

var objectsData = [
  {
    "title": "Item 4 Personnes",
    "type": "Personnes",
    "date": "2023-08-29T11:35:09.846779",
    "image":
        "https://img.freepik.com/premium-photo/viewing-shanghai-overpass-ornamental-telescope_91566-1040.jpg",
    "description": "Lurem Upsom 1"
  },
  {
    "title": "Item 5 Personnes",
    "date": "2023-08-30T10:35:09.846779",
    "type": "Personnes",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgwP8Ck1EzhM5k0EJpf7adKLTPsRbNQRQ01zY0calCpfvnoNaxS4_SBUHoPIQWxFSSMGY&usqp=CAU",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "Item 6 Armes",
    "date": "2023-08-30T11:35:09.846779",
    "type": "Armes",
    "image": "https://geographical.co.uk/wp-content/uploads/cctv.jpg",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "Item 7 Evenement ",
    "date": "2023-08-30T12:35:09.846779",
    "type": "Evenement",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWtQzOg6oUHjtcidrtrACHA2oI1Rim_gK95uTwVPfFuowu9_5YNQY9Zv2Qg6pTfnMT1NM&usqp=CAU",
    "description": "Lurem Upsom Evenement"
  },
  {
    "title": "Item 4 Personnes",
    "type": "Personnes",
    "date": "2023-08-29T11:35:09.846779",
    "image":
        "https://img.freepik.com/premium-photo/viewing-shanghai-overpass-ornamental-telescope_91566-1040.jpg",
    "description": "Lurem Upsom 1"
  },
  {
    "title": "Item 5 Personnes",
    "date": "2023-09-01T10:35:09.846779",
    "type": "Personnes",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgwP8Ck1EzhM5k0EJpf7adKLTPsRbNQRQ01zY0calCpfvnoNaxS4_SBUHoPIQWxFSSMGY&usqp=CAU",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "Item 6 Armes",
    "date": "2023-08-31T11:35:09.846779",
    "type": "Armes",
    "image": "https://geographical.co.uk/wp-content/uploads/cctv.jpg",
    "description": "Lurem Upsom 2"
  },
  {
    "title": "Item 7 Evenement ",
    "date": "2023-09-03T12:35:09.846779",
    "type": "Evenement",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWtQzOg6oUHjtcidrtrACHA2oI1Rim_gK95uTwVPfFuowu9_5YNQY9Zv2Qg6pTfnMT1NM&usqp=CAU",
    "description": "Lurem Upsom Evenement"
  }
];
