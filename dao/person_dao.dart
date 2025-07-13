import 'package:floor/floor.dart';
import '../entity/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person?> findPersonById(int id);

  @delete
  Future<void> delete(Person p);

  @insert
  Future<void> insertPerson(Person person);
}