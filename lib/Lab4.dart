import 'package:flutter/material.dart';
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

    loadEncryptedLogin();
  }

  void loadEncryptedLogin() {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    prefs.getString("LoginName").then((String? loginName) {
      prefs.getString("Password").then((String? passwordValue) {
        if (loginName != null && passwordValue != null) {
          setState(() {
            _controller1.text = loginName;
            _controller2.text = passwordValue;
          });

          // Show SnackBar to say data was loaded
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Previous login loaded!")),
            );
          });
        }
      });
    });
  }

  void saveEncryptedLogin() {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    prefs.setString("LoginName", _controller1.text).then((bool success) {
      prefs.setString("Password", _controller2.text).then((bool success2) {
        print("Encrypted login saved.");
      });
    });
  }

  void clearEncryptedLogin() {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    prefs.remove("LoginName").then((bool success) {
      prefs.remove("Password").then((bool success2) {
        print("Encrypted login cleared.");
      });
    });
  }

  void showSaveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Save Login?"),
          content: Text("Would you like to save your username and password?"),
          actions: [
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                saveEncryptedLogin();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("No"),
              onPressed: () {
                clearEncryptedLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                       // Show dialog asking to save login info
                       showSaveDialog();
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
