import 'package:flutter/material.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class DataRepository {
  static String loginName = "";
  static int age = 0; // optional
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab 5 : Flutter Demo by Annabel Cheng'),
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
  late String loginName;
  late String password; // nothing yet, but not null
  final EncryptedSharedPreferences _prefs = EncryptedSharedPreferences();

  //show AlertDialog asking to save login info
  void buttonClicked(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Save Login Info"),
          content: Text("Do you want to save your login name and password?"),
          actions: [
            TextButton(
              child: Text("No"),
              // Adding async in order to use await
              onPressed: () async {
                Navigator.of(context).pop(); // close dialog

                // Clear any saved data
                await _prefs.clear();

                setState(() {
                  // clear the saved data
                  loginName = "";
                  password = "";
                });
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () async {
                Navigator.of(context).pop(); // close dialog

                //Save to EncryptedSharedReference
                await _prefs.setString('loginName', _controller1.text);
                await _prefs.setString('password', _controller2.text);

                print("DEBUG: Saved loginName=${_controller1.text}, password=${_controller2.text}");

                setState(() {
                  // save the login name and password
                  loginName = _controller1.text;
                  password = _controller2.text;
                  //
                });
                // Save loginName in DataRepository

                DataRepository.loginName = loginName;

                // Now check password (example: correct password is "6789")
                if (password == "6789") {
                  Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  ).then((value) {

                      if (value == true) {
                        Future.delayed(Duration(milliseconds: 100), () {
                          scaffoldMessengerKey.currentState?.showSnackBar(
                            SnackBar(content: Text(
                                "Welcome Back: ${DataRepository.loginName}")),
                          );
                        });
                      }
                    }
                  );
                } else {
                  // Wrong password
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Incorrect password")),
                  );
                }
               },
          ),
          ],
        );
      },
    );
  }


  @override
  void initState() { // similar to onloaded= (in html)
    super.initState();
    _controller1 = TextEditingController(); //making _controller
    _controller2 = TextEditingController(); //making _controller

    loginName = "";
    password = "";

    loadSavedData(); //load the saved login info
  }

  void loadSavedData() async {
    try {
      String savedLogin = await _prefs.getString('loginName');
      String savedPassword = await _prefs.getString('password');

      if (savedLogin.isNotEmpty && savedPassword.isNotEmpty) {
        setState(() {
          _controller1.text = savedLogin;
          _controller2.text = savedPassword;
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Previous login name and password loaded.")),
          );
        });
      } else {
        print("DEBUG: No saved data found.");
      }
    }

    catch (e) {
      print("DEBUG: Exception occurred when loading saved data: $e");
    }
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
            SizedBox(height: 10),  // Add spacing between first and second TextField
            TextField(controller: _controller2,
                obscureText:true,
                decoration: InputDecoration(
                    hintText:"Password",
                    border: OutlineInputBorder(),
                    labelText: "Password"
                )
            ),
            SizedBox(height: 30),  // Add spacing between second TextField and Button
            ElevatedButton(
              onPressed: buttonClicked, // onPressed
              child:Text("Login", style: TextStyle(fontSize:myFontSize, color:Colors.lightBlue)),
            ),

          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome back: ${DataRepository.loginName}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email Address'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true); // Return true to trigger SnackBar
                  },
                  child: Text("Go Back"),
                ),
          ],
        ),
      ),
     ),
   );
  }
}


