import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'ShoppingItem.dart';
import 'ShoppingItemDAO.dart';

part 'ShoppingItemDatabase.g.dart'; //will be code generated

@Database(version:1, entities: [ShoppingItem] ) //entities are array of ShoppingItem
abstract class ShoppingItemDatabase extends FloorDatabase{
  // create a function returning a DAO object
    ShoppingItemDAO get getDao; //get generates this function as a getter
}

