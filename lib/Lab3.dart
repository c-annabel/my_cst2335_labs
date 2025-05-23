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
                      padding: EdgeInsets.fromLTRB(36.0, 46.0, 36.0, 28.0),
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
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                      child:
                        Text(
                          "Not sure about exactly which recipe you're looking for? "
                          "Do a search, or dive into our most popular categories.",
                          style: TextStyle(fontSize: 15.0,
                                           fontWeight: FontWeight.bold,)
                        ),
                    ),

                    //----MAIN CATEGORIES START---------------------------------------------------//

                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 6.0, 8.0, 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                               Expanded(
                                 child: Center(
                                   child:
                                   Text(
                                       "BY MEAT",
                                       textAlign: TextAlign.center,
                                       style: TextStyle(fontSize: 20.0,
                                         fontWeight: FontWeight.bold,)
                                   ),
                                 )
                               )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('images/beef.jpg'),
                                      radius:45,
                                    ),
                                    Text(
                                        "BEEF",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(2.0, 2.0), // horizontal and vertical shadow
                                              blurRadius: 4.0,          // softening effect
                                              color: Colors.black87 // shadow color
                                            ),
                                          ],
                                        ),
                                    ),
                                  ],
                              ),

                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/chicken.jpg'),
                                    radius:45,
                                  ),
                                  Text(
                                    "CHICKEN",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            offset: Offset(2.0, 2.0), // horizontal and vertical shadow
                                            blurRadius: 4.0,          // softening effect
                                            color: Colors.black87 // shadow color
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/pork.jpg'),
                                    radius:45,
                                  ),
                                  Text(
                                    "PORK",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            offset: Offset(2.0, 2.0), // horizontal and vertical shadow
                                            blurRadius: 4.0,          // softening effect
                                            color: Colors.black87 // shadow color
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/seafood.jpg'),
                                    radius:45,
                                  ),
                                  Text(
                                    "SEAFOOD",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            offset: Offset(2.0, 2.0), // horizontal and vertical shadow
                                            blurRadius: 4.0,          // softening effect
                                            color: Colors.black87 // shadow color
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child:
                                    Text(
                                        "BY COURSE",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0,
                                          fontWeight: FontWeight.bold,)
                                    ),
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text('Row 2, Item 1'),
                              Spacer(),
                              Text('Row 2, Item 2'),
                              Spacer(),
                              Text('Row 2, Item 3'),
                              Spacer(),
                              Text('Row 2, Item 4'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child:
                                    Text(
                                        "BY DESSERT",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0,
                                          fontWeight: FontWeight.bold,)
                                    ),
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text('Row 3, Item 1'),
                              Spacer(),
                              Text('Row 3, Item 2'),
                              Spacer(),
                              Text('Row 3, Item 3'),
                              Spacer(),
                              Text('Row 3, Item 4'),
                            ],
                          ),
                        ],
                      ),
                    )


                    //-----MAIN CATEGORIES END---------------------------------------------------//
                ],
             ),

        ),
    );
  } // end of Widget
} // end of class MyHomePageState
