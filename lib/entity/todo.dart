import 'package:floor/floor.dart';

@Entity(tableName: 'ToDo')
class ToDo {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String quantity;

  ToDo({this.id, required this.name, required this.quantity});
}