import 'dart:async';
import 'package:floor/floor.dart';
import '../entity/todo.dart';
import '../dao/tododao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'tododatabase.g.dart';

@Database(version: 1, entities: [ToDo])
abstract class ToDoDatabase extends FloorDatabase {
  ToDoDao get todoDao;}