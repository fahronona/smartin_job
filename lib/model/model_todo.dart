class ModelTodo {
  int id = 0;
  String title = "";
  bool completed = false;

  ModelTodo({this.id = 0, this.title = "", this.completed = false});

  ModelTodo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    completed = json["completed"];
  }
}
