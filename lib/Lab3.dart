import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab 3 : Flutter Demo by Annabel Cheng'),
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
  var myFontSize = 30.0;
  late TextEditingController _controller1; // this is to read what is typed
  late TextEditingController _controller2; // this is to read what is typed
  late String password; // nothing yet, but not null
  var imageSource = "images/question-mark.png";

  void buttonClicked(){
  }

  @override
  void initState() { // similar to onloaded= (in html)
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
      drawer:Drawer(child:Text("Hi there")),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), actions: [
            OutlinedButton(onPressed: () { }, child:Text("Button 1")),
            OutlinedButton(onPressed: (){ }, child: Text("Button 2"))]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
              }, // onPressed
              child:Text("Button 1"),
            ),
            ElevatedButton(
              onPressed: () {
              }, // onPressed
              child:Text("Button 2"),
            ),
            ElevatedButton(
              onPressed: () {
              }, // onPressed
              child:Text("Button 3"),
            ),
            ElevatedButton(
              onPressed: () {
              }, // onPressed
              child:Text("Button 4"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem( icon: Icon(Icons.camera), label: 'Camera'  ),
        BottomNavigationBarItem( icon: Icon(Icons.add_call), label: 'Phone' ),
      ],
        onTap:(btnIndex){  }  )
    );
  }
}
