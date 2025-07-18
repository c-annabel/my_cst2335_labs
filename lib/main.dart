import 'package:flutter/material.dart';
import 'database/tododatabase.dart';
import 'entity/todo.dart';
import 'details.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorToDoDatabase
        .databaseBuilder('todo_database.db').build();
  runApp(MyApp(database));
}

class MyApp extends StatelessWidget {
  final ToDoDatabase database;

  const MyApp(this.database, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Lab 9: Flutter Demo by Annabel Cheng', database: database),
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
  ToDo? selectedItem;

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

  void addItem() async {
    final name = _controller1.text.trim();
    final quantity = _controller2.text.trim();

    if (name.isNotEmpty && quantity.isNotEmpty) {
      final todo = ToDo(name: name, quantity: quantity);
      await widget.database.todoDao.insertToDo(todo);
      _controller1.clear();
      _controller2.clear();
      loadItemsFromDb();
    }
  }

  void deleteItem(ToDo item) async {
    await widget.database.todoDao.deleteToDo(item);
    setState(() {
      selectedItem = null;
    });
    loadItemsFromDb();
  }

  void closeDetails() {
    setState(() {
      selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 720;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: TextStyle(color: Colors.white)), backgroundColor: Colors.deepPurple),
      body: isWideScreen ? Row(
        children: [
          Expanded(child: buildList()),
          VerticalDivider(),
          if (selectedItem != null)
            Expanded(
              child: DetailsPage(
                item: selectedItem!,
                onDelete: () => deleteItem(selectedItem!),
                onClose: closeDetails,
              ),
            ),
        ],
      ) : selectedItem == null ? buildList() : DetailsPage(
        item: selectedItem!,
        onDelete: () => deleteItem(selectedItem!),
        onClose: closeDetails,
      ),
    );
  }

  Widget buildList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controller1,
                decoration: InputDecoration(labelText: "Item name"),
              ),
              TextField(
                controller: _controller2,
                decoration: InputDecoration(labelText: "Quantity"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: addItem,
                child: Text("Add Item", style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${item.name}   ==> "),
                    Text("Quantity: ${item.quantity}"),
                  ],
                ),
                onTap: () {
                  setState(() {
                    selectedItem = item;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
