import 'package:flutter/material.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class DataRepository {
  static String loginName = "";
  static int age = 0; // optional

  static String firstName = "";
  static String lastName = "";
  static String phoneNumber = "";
  static String emailAddress = "";

  static final EncryptedSharedPreferences _prefs = EncryptedSharedPreferences();

  static Future<void> loadData() async {
    try {
      loginName = await _prefs.getString('loginName');
      firstName = await _prefs.getString('firstName');
      lastName = await _prefs.getString('lastName');
      phoneNumber = await _prefs.getString('phoneNumber');
      emailAddress = await _prefs.getString('emailAddress');
    } catch (e) {
      print("Error loading Profile data: $e");
    }
  }

  static Future<void> saveData() async {
    try {
      await _prefs.setString('loginName', loginName);
      await _prefs.setString('firstName', firstName);
      await _prefs.setString('lastName', lastName);
      await _prefs.setString('phoneNumber', phoneNumber);
      await _prefs.setString('emailAddress', emailAddress);
    } catch (e) {
      print("Error saving Profile data: $e");
    }
  }

}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: { '/': (context) => const  MyHomePage(title: 'Lab 5 : Flutter Demo by Annabel Cheng'),
        '/second': (context) => const ProfilePage(welcomeMessage:'profile'),
      },
      initialRoute: '/',
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
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


                //Save to EncryptedSharedReference
                await _prefs.setString('loginName', _controller1.text);
                await _prefs.setString('password', _controller2.text);

                // print("DEBUG: Saved loginName=${_controller1.text}, password=${_controller2.text}");

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
                  Navigator.pushNamed(context, '/second');


                } else {
                 Navigator.pop(context);
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
  void initState() { // similar to onLoaded= (in html)
    super.initState();

    // Load repository data ONCE at app start:
    DataRepository.loadData();

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

class ProfilePage extends StatefulWidget {
  final String welcomeMessage;
  const ProfilePage({super.key, required this.welcomeMessage});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  bool _snackBarShown = false;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with Repository data:
    _firstNameController = TextEditingController(text: DataRepository.firstName);
    _lastNameController = TextEditingController(text: DataRepository.lastName);
    _phoneController = TextEditingController(text: DataRepository.phoneNumber);
    _emailController = TextEditingController(text: DataRepository.emailAddress);

    // Add listeners to save data:
    _firstNameController.addListener(() {
      DataRepository.firstName = _firstNameController.text;
      DataRepository.saveData();
    });
    _lastNameController.addListener(() {
      DataRepository.lastName = _lastNameController.text;
      DataRepository.saveData();
    });
    _phoneController.addListener(() {
      DataRepository.phoneNumber = _phoneController.text;
      DataRepository.saveData();
    });
    _emailController.addListener(() {
      DataRepository.emailAddress = _emailController.text;
      DataRepository.saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show SnackBar when ProfilePage is opened

    if (!_snackBarShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(widget.welcomeMessage),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(top: 100, left: 16, right: 16),
            duration: Duration(seconds: 10),
          ),
        );
        _snackBarShown = true;
      });
    }


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
                SizedBox(height: 15),

                TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                      labelText: 'First Name', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      labelText: 'Last Name', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(                         //can also use Expanded
                      child: TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(labelText: 'Phone Number',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(width: 2), // spacing
                    IconButton(
                      onPressed: () async {
                        final Uri telUri = Uri(
                            scheme: 'tel', path: _phoneController.text);
                        if (await canLaunchUrl(telUri)) {
                          await launchUrl(telUri);
                        } else {
                          scaffoldMessengerKey.currentState?.showSnackBar(
                            SnackBar(content: Text(
                                "Cannot launch phone dialer")),
                          );
                        }
                      },
                      icon: Icon(Icons.phone),
                      tooltip: 'Call',
                    ),
                    SizedBox(width: 2,),
                    IconButton(
                      onPressed: () async {
                        final Uri smsUri = Uri(
                            scheme: 'sms', path: _phoneController.text);
                        if (await canLaunchUrl(smsUri)) {
                          await launchUrl(smsUri);
                        } else {
                          scaffoldMessengerKey.currentState?.showSnackBar(
                            SnackBar(content: Text("Cannot launch SMS app")),
                          );
                        }
                      },
                      icon: Icon(Icons.sms),
                      tooltip: 'SMS',
                    ),
                  ],
                ),
                // TextField(
                //   controller: _phoneController,
                //   decoration: InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
                // ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email Address',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(width: 2), // spacing
                    IconButton(
                      onPressed: () async {
                        final Uri mailUri = Uri(
                            scheme: 'mailto', path: _emailController.text);
                        if (await canLaunchUrl(mailUri)) {
                          await launchUrl(mailUri);
                        } else {
                          scaffoldMessengerKey.currentState?.showSnackBar(
                            SnackBar(content: Text("Cannot launch Email app")),
                          );
                        }
                      },
                      icon: Icon(Icons.mail),
                      tooltip: 'Mail',
                    ),
                  ],
                ),
                // TextField(
                //   controller: _emailController,
                //   decoration: InputDecoration(labelText: 'Email Address', border: OutlineInputBorder()),
                // ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context, true); // Return true to trigger SnackBar
                  },
                  child: Text("Go Back"),
                ),
              ],
            ),
          ),
        ),
      );
    }}
