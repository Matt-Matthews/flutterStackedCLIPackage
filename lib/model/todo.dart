class Todo {
  final int id;
  final String title;
  // final String createdAt;
  // final String? updatedAt;

  Todo(
      {required this.id,
      required this.title,});

  factory Todo.fromSqliteDatabase(Map<String, dynamic> map) => Todo(
    id: map['id']?.toInt() ?? 0, 
    title: map['title'] ?? ''); 
}
