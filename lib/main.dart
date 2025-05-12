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
      home: const MyHomePage(title: 'Lab 1 : Flutter Demo by Annabel Cheng'),
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
  var _counter = 0.0;
  var myFontSize = 30.0;
  bool? isChecked = false;

  void setNewValue(double value) {
    setState(() {
      _counter = value;
      myFontSize = _counter;
    });
  }

  void _incrementCounter() {
    setState(() {
      if(_counter < 99.0) {
         _counter++;
      }
    });
  }

  void buttonClicked(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:', style: TextStyle(fontSize:myFontSize, color:Colors.red)),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize:myFontSize),
            ),
            // Padding(
            //   padding: EdgeInsets.all(20.0),
            //   child: Image.asset("images/algonquin.jpg", width: 200, height:200),
            // ),
            Semantics(
                child: Image.asset("images/algonquin.jpg", width: 200, height:200),
                label:'This image is a image of Algonquin College.'),
            ElevatedButton(
                onPressed: buttonClicked,
                child:Image.asset("images/algonquin.jpg", width: 200, height:200),
            ),
            //20250512-02 replaced by image
            //ElevatedButton( onPressed: buttonClicked, child:  Text("Click me")  ),
            //20250512-01 replaced by button
            //Slider(value:_counter, max:100.0, onChanged: setNewValue, min:0.0)
            Checkbox(value: isChecked, onChanged: (newValue) {
               setState(() {
                   isChecked = newValue; //store the new value
               });

            } ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
