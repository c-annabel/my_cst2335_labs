import 'dart:async';
import 'package:floor/floor.dart';
import '../entity/ToDo.dart';
import '../dao/ToDoDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'todo_database.g.dart';

@Database(version: 1, entities: [ToDo])
abstract class ToDoDatabase extends FloorDatabase {
  ToDoDao get todoDao;