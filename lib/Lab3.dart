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
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
          // margin: EdgeInsets.all(2.0), // optional spacing from screen edge
          decoration: BoxDecoration(
          border: Border.all(color: Colors.green[900]!, width: 6),
          borderRadius: BorderRadius.circular(58),
          ),

          child:

             Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                    // 1. Header
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

                    // 2. Description
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 00, 10.0, 0.0),
                      child:
                      Text(
                          "Not sure about exactly which recipe you're looking for? "
                          "Do a search, or dive into our most popular categories.",
                          style: TextStyle(fontSize: 15.0,
                                           fontWeight: FontWeight.bold,)
                      ),
                    ),

                    //----MAIN CATEGORIES START---------------------------------------------------//

                    // 3. BY MEAT title
                    Center(
                      child:
                        Text(
                            "BY MEAT",
                            style: TextStyle(fontSize: 20.0,
                              fontWeight: FontWeight.bold,)
                        ),
                    ),

                    // 4. MEAT Categories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage('images/beef.jpg'),
                                radius:47,
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
                              radius:47,
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
                              radius:47,
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
                              radius:47,
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
                      ], // end of children
                    ),

                    // 5. BY COURSE title
                    Center(
                      child:
                      Text(
                          "BY COURSE",
                          style: TextStyle(fontSize: 20.0,
                            fontWeight: FontWeight.bold,)
                      ),
                    ),

                    // 6. COURSE Categories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          clipBehavior: Clip.none, // allows positioning outside the bounds
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/maindishes.jpg'),
                              radius: 47,
                            ),
                            Positioned(
                              bottom: -25, // adjust as needed
                              child: Text(
                                "Main Dishes",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ], // children
                        ),

                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          clipBehavior: Clip.none, // allows positioning outside the bounds
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/salad.jpg'),
                              radius: 47,
                            ),
                            Positioned(
                              bottom: -25, // adjust as needed
                              child: Text(
                                "Salad Recipes",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ], // children
                        ),


                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          clipBehavior: Clip.none, // allows positioning outside the bounds
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/sidedishes.jpg'),
                              radius: 47,
                            ),
                            Positioned(
                              bottom: -25, // adjust as needed
                              child: Text(
                                "Side Dishes",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ], // children
                        ),

                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          clipBehavior: Clip.none, // allows positioning outside the bounds
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/crockpot.jpg'),
                              radius: 47,
                            ),
                            Positioned(
                              bottom: -25, // adjust as needed
                              child: Text(
                                "Crockpot",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ], // children
                        ),
                      ], // end of children
                    ),

                  // 7. BY DESSERT title
                  Center(
                    child:
                    Text(
                        "BY DESSERT",
                        style: TextStyle(fontSize: 20.0,
                          fontWeight: FontWeight.bold,)
                    ),
                  ),

                  // 8. DESSERT Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        clipBehavior: Clip.none, // allows positioning outside the bounds
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/icecream.jpg'),
                            radius: 47,
                          ),
                          Positioned(
                            bottom: -25, // adjust as needed
                            child: Text(
                              "Ice Cream",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ], // children
                      ),

                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        clipBehavior: Clip.none, // allows positioning outside the bounds
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/brownies.jpg'),
                            radius: 47,
                          ),
                          Positioned(
                            bottom: -25, // adjust as needed
                            child: Text(
                              "Brownies",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ], // children
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        clipBehavior: Clip.none, // allows positioning outside the bounds
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/pies.jpg'),
                            radius: 47,
                          ),
                          Positioned(
                            bottom: -25, // adjust as needed
                            child: Text(
                              "Pies",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ], // children
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        clipBehavior: Clip.none, // allows positioning outside the bounds
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/cookies.jpg'),
                            radius: 47,
                          ),
                          Positioned(
                            bottom: -25, // adjust as needed
                            child: Text(
                              "Cookies",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ], // children
                      ),


                    ], // end of children
                  ),

                              // Example of using Column to display.
                              // Column(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //       CircleAvatar(
                              //         backgroundImage: AssetImage('images/maindishes.jpg'),
                              //         radius: 45,
                              //       ),
                              //       SizedBox(height: 8), // spacing between image and text
                              //       Text(
                              //         "Main Dishes",
                              //         style: TextStyle(
                              //           fontSize: 13.0,
                              //           fontWeight: FontWeight.bold,
                              //           color: Colors.black,
                              //         ),
                              //       ),
                              //   ],
                              // ),

                ], // end of children

                    //-----MAIN CATEGORIES END---------------------------------------------------//

             ),
        ),
    );
  } // end of Widget
} // end of class MyHomePageState
