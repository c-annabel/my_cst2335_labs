import 'package:flutter/material.dart';
import 'database/tododatabase.dart';
import 'entity/todo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorToDoDatabase
  .databaseBuilder('todo_database.db').build();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final ToDoDatabase database;

  const MyApp(this.database, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab 7 : Flutter Demo by Annabel Cheng', database: database),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;
  final ToDoDatabase database;

  const MyHomePage({super.key, required this.title, required this.database});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myFontSize = 15.0;
  late TextEditingController _controller1; // this is to read what is typed
  late TextEditingController _controller2; // this is to read what is typed

  List<ToDo> items = []; // [{name: 'Tomato', quantity: 2}]

  @override
  void initState() { // similar to onLoaded= (in html)
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();//making _controller
    loadItemsFromDb();
  }

  Future<void> loadItemsFromDb() async {
    final list = await widget.database.todoDao.findAllToDos();
    setState(() {
      items = list;
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose(); //free the memory of what was typed
  }

  void addItem() {
    String name    = _controller1.text.trim();
    String qtyText = _controller2.text.trim();

    if (name.isNotEmpty && qtyText.isNotEmpty) {
      int? quantity = int.tryParse(qtyText);

      if (quantity != null) {
        setState(() {
          items.add({"name": name, "quantity": quantity});
        });
        _controller1.clear();
        _controller2.clear();
      }
    }
  }

  void confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete item?"),
          content: Text("Do you want to remove \"${items[index]['name']}\" from the list?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  items.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller1,
                    decoration: InputDecoration(
                      hintText:"Type the item here",
                      border: OutlineInputBorder(),
                      //labelText: "Item name"
                    ),
                  ),
                ),
                SizedBox(width: 8),

                Expanded(
                  child: TextField(
                      controller: _controller2,
                      decoration: InputDecoration(
                        hintText:"Type the quantity here",
                        border: OutlineInputBorder(),
                        // labelText: "Quantity number"
                      )
                  ),
                ),
                SizedBox(width: 8),

                ElevatedButton(
                  onPressed: addItem,
                  child:Text("Add", style: TextStyle(fontSize:myFontSize, color:Colors.deepPurple)),
                ),
              ],
            ),

            // ListView
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onLongPress: () => confirmDelete(index),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 1}: ${item['name']}  quantity: ${item['quantity']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],),
      ),
    );
  }
}
