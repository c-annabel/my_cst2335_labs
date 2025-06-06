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
      home: const MyHomePage(title: 'Lab 2 : Flutter Demo by Annabel Cheng'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _controller1,
                decoration: InputDecoration(
                    hintText:"Login",
                    border: OutlineInputBorder(),
                    labelText: "Login name"
                )
            ),
            TextField(controller: _controller2,
                obscureText:true,
                decoration: InputDecoration(
                    hintText:"Password",
                    border: OutlineInputBorder(),
                    labelText: "Password"
                )
            ),
            ElevatedButton(
                onPressed: () {
                  // get the string that was typed in the password field
                   password = _controller2.text;// <--- lambda function
                   setState(() {
                       if (password == 'QWERTY123') {
                         imageSource = "images/idea.png";
                       }
                       else {
                         imageSource = "images/stop.png";
                       }
                   });
                }, // onPressed
                child:Text("Login", style: TextStyle(fontSize:myFontSize, color:Colors.lightBlue)),
            ),
            Semantics (
                label:imageSource,
                child: Image.asset(imageSource, width: 200, height:200)
            ),
          ],
        ),
      ),
    );
  }
}
