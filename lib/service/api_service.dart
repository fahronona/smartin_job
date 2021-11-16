// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:smartin_job/model/model_todo.dart';

class GetDataApi {
  final Dio dio = Dio();
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  Future getData() async {
    try {
      List<ModelTodo> dataTodo = [];
      Response response = await dio.get(url);
      for (var i in (response.data as List)) {
        dataTodo.add(ModelTodo.fromJson(i));
      }
      return dataTodo;
    } catch (e) {
      return [];
    }
  }
}
