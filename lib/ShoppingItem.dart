import 'package:floor/floor.dart';

@entity //Tells Floor to create a Table called ShoppingItem
class ShoppingItem {

  ShoppingItem( this.id, this.name); // id here, name here, constructor

  static int ID = 1; //belongs to the class to hand out numbers

  @primaryKey // tells Floor this is the unique key
    final int id;

    String name;
}