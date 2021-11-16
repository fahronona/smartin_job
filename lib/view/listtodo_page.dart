import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartin_job/component/card_list.dart';
import 'package:smartin_job/component/form_component.dart';
import 'package:smartin_job/model/model_todo.dart';
import 'package:smartin_job/service/api_service.dart';

class ListTodoPage extends StatefulWidget {
  const ListTodoPage({Key? key}) : super(key: key);

  @override
  _ListTodoPageState createState() => _ListTodoPageState();
}

class _ListTodoPageState extends State<ListTodoPage> {
  TextEditingController searchController = TextEditingController();
  List<ModelTodo> data = [];
  List<ModelTodo> dataSearch = [];

  filterSearchListBantuan(String query) {
    query = query.toLowerCase();
    if (query.isNotEmpty) {
      dataSearch = [];
      setState(() {});
      for (var item in data) {
        if (item.title != null &&
            item.title.toString().toLowerCase().contains(query)) {
          dataSearch.add(item);
          setState(() {});
        }
      }
    } else {
      dataSearch = [];
      for (var i in data) {
        dataSearch.add(i);
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    GetDataApi().getData().then((value) {
      data = value;
      dataSearch = value;
      setState(() {});
      // print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List todo"),
      ),
      body: ListView(
        children: [
          formSearch("Cari data", searchController, TextInputType.text,
              (value) {
            filterSearchListBantuan(value);
          }),
          dataSearch.isEmpty
              ? const Padding(
                  padding: EdgeInsets.only(top: 300),
                  child: Center(child: CircularProgressIndicator()),
                )
              : Container(),
          ...dataSearch.map((e) {
            return cardList(e.title, e.completed);
          })
        ],
      ),
    );
  }
}
