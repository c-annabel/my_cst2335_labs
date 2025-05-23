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
      title: 'Lab3 : Flutter Demo',
      theme: ThemeData(
      ),
      home: const MyHomePage(title: 'BROWSE  CATEGORIES'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
        Container(
          // margin: EdgeInsets.all(2.0), // optional spacing from screen edge
          decoration: BoxDecoration(
          border: Border.all(color: Colors.green[900]!, width: 6),
          ),

          child:
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(36.0),
                    color: Colors.green[900],
                    width: double.infinity,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.white,
                             fontWeight: FontWeight.bold, letterSpacing: 2.0,),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 6.0, 8.0, 10.0),
                    child:
                      Text(
                        "Not sure about exactly which recipe you're looking for? "
                        "Do a search, or dive into our most popular categories.",
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0,
                                         fontWeight: FontWeight.bold,)
                      ),
                  ),

                ],
             ),

        ),
    );
  } // end of Widget
} // end of class MyHomePageState
