import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab 6 : Flutter Demo by Annabel Cheng'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myFontSize = 15.0;
  late TextEditingController _controller1; // this is to read what is typed
  late TextEditingController _controller2; // this is to read what is typed
  late String itemName;
  late int itemQuantity; // nothing yet, but not null

  void buttonClicked(){
  }

  @override
  void initState() { // similar to onLoaded= (in html)
    super.initState();
    _controller1 = TextEditingController(); //making _controller
    _controller2 = TextEditingController(); //making _controller
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose(); //free the memory of what was typed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
                    obscureText:true,
                    decoration: InputDecoration(
                        hintText:"Type the quantity here",
                        border: OutlineInputBorder(),
                       // labelText: "Quantity number"
                    )
              ),
            ),
            SizedBox(width: 8),

            ElevatedButton(
              onPressed: (){},
              child:Text("Add", style: TextStyle(fontSize:myFontSize, color:Colors.purple)),
            ),
          ],
        ),



      ),
    );
  }
}
