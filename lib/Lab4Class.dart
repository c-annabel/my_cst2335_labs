import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';



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
      home: const MyHomePage(title: 'Lab 4 : Flutter Demo by Annabel Cheng'),
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

  void loadLoginName() async {
    final prefs = await SharedPreferences.getInstance();
    String? loginName = prefs.getString("LoginName");

    print("Loaded LoginName: $loginName");

    setState(() {
      _controller1.text = loginName ?? '';
    });
  }

  //The Other Method:
  // void loadLoginName() {
  //   SharedPreferences.getInstance().then((result) {
  //     var loginName = result.getString("LoginName");
  //     if (loginName != null) {
  //       setState(() {
  //         _controller1.text = loginName;
  //       });
  //     }
  //   });
  // }

  void clearLoginName() {
    SharedPreferences.getInstance().then((sharedPrefs) {
      sharedPrefs.remove("LoginName");
      print("LoginName removed.");
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose(); //free the memory of what was typed
  }

  // Load and obtain the shared preferences for this app.
  void functionName() async {
    final prefs = await SharedPreferences.getInstance();
  }

  void buttonPressed() {
    SharedPreferences.getInstance().then((sharedPrefs) {
      // Save the login name that user typed
      sharedPrefs.setString("LoginName", _controller1.text);

      // Example: also save password if you want (NOT recommended for real apps!)
      sharedPrefs.setString("Password", _controller2.text);

      print("LoginName saved: ${_controller1.text}");
    });
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

                  // Save login name to SharedPreferences
                  buttonPressed();

                  // get the string that was typed in the password field
                   password = _controller2.text;// <--- lambda function
                   setState(() {
                       if (password == 'QWERTY123') {
                         imageSource = "images/idea.png";
                       }
                       else {
                         imageSource = "images/stop.png";

                         // Show AlertDialog here:
                         showDialog(
                           context: context,
                           builder: (BuildContext context) {
                             return AlertDialog(
                               title: Text('Login Failed'),
                               content: Text('Invalid Password! Please try again.'),
                               actions: <Widget>[
                                 TextButton(
                                   child: Text('OK'),
                                   onPressed: () {
                                     Navigator.of(context).pop(); // Close the dialog
                                   },
                                 ),
                               ],
                             );
                           },
                         );

                         // const snackBar = SnackBar(content: Text('Invalid Password!'));
                         final snackBar = SnackBar(
                           content: Text('Invalid Password!'),
                           action: SnackBarAction(
                             label: 'Hide',
                             onPressed: () {
                               // You can leave this empty or add behavior
                               // For example: print('Snackbar hidden');
                             },
                           ),
                         );
                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                       }
                   }


                   );
                }, // onPressed
                child:Text("Login", style: TextStyle(fontSize:myFontSize, color:Colors.lightBlue)),
            ),

            ElevatedButton(
              onPressed: () {
                loadLoginName();
              },
              child: Text("Load Login Name")
            ),

            ElevatedButton(
              onPressed: () {
                clearLoginName();
              },
              child: Text("Clear Login Name"),
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
