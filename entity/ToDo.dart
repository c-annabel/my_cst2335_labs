import 'package:floor/floor.dart';

@entity
class ToDo {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String quantity;

  ToDo({this.id, required this.name, required this.quantity});
}