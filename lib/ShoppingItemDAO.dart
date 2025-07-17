import "package:floor/floor.dart";
import 'ShoppingItem.dart';
@dao
abstract class ShoppingItemDAO{

  //create a Query function to get our objects:
  @Query("Select * from ShoppingItem") // Entity is the Table Name
  Future< List<ShoppingItem> > getAllShoppingItems(); //No function body in this abstract class

  //@insert, @delete, @update
  @insert
  Future<void> addShoppingItem(ShoppingItem toBeInserted);

  @delete
  Future<void> deleteShoppingItem(ShoppingItem toBeDeleted);

  @update
  Future<void> updateShoppingItem(ShoppingItem toBeUpdated);
}



