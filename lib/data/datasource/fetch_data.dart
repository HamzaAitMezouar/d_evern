import 'dart:developer';

import 'package:search/models/item_model.dart';
import 'package:dio/dio.dart';
import 'package:search/utils/constants.dart';

abstract class DataSourceService {
  Future<List<ItemModel>> getAffaire();
  Future<List<ItemModel>> getObjects();
  Future<List<ItemModel>> getPieceJointe();
}

class DataSourceServiceEmp extends DataSourceService {
  Dio dio = Dio(BaseOptions(
      sendTimeout: const Duration(seconds: 3),
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3)));
  @override
  Future<List<ItemModel>> getAffaire() async {
    try {
      List<ItemModel> affaires = [];
      final res = await dio.get(affairesUrl);
      if (res.statusCode == 200) {
        for (var item in res.data) {
          affaires.add(ItemModel.fromJson(item));
        }
      }

      return affaires;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<ItemModel>> getObjects() async {
    try {
      List<ItemModel> objects = [];
      final res = await dio.get(objectssUrl);
      if (res.statusCode == 200) {
        for (var item in res.data) {
          objects.add(ItemModel.fromJson(item));
        }
      }

      return objects;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<ItemModel>> getPieceJointe() async {
    try {
      List<ItemModel> affaires = [];
      final res = await dio.get(pieceJointesUrl);
      if (res.statusCode == 200) {
        for (var item in res.data) {
          affaires.add(ItemModel.fromJson(item));
        }
      }

      return affaires;
    } catch (e) {
      throw Exception();
    }
  }
}
