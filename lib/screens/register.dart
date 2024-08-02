import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hive/models/user.dart';
import 'package:flutter_hive/screens/signin.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

// Add more boxes if needed

Future<void> register(String email, String password) async {
  final Box<User> _userBox = await Hive.openBox<User>('userBox');
  final user = User()
    ..email = email
    ..token = password;
  await _userBox.put('user', user);
}

// Add other authentication methods like login, logout, getUser, etc.

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  TextEditingController password = TextEditingController();
  TextEditingController _user_name = TextEditingController();

  void toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  void openBoxes() async {
    await Hive.openBox<User>('userBox');
    // Add more boxes if needed
  }

  @override
  void initState() {
    super.initState();
    openBoxes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              width: 150,
              height: 150,
              child: const Image(image: AssetImage("assets/images/logo.png")),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 60.0, bottom: 60, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign up!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                Text(
                  "Create a new account",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Email"),
                  TextField(
                    controller: _user_name,
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Password"),
                  TextField(
                    obscureText: true,
                    controller: password,
                  ),
                ]),
          ),
          Row(
            children: [
              Checkbox(value: isChecked, onChanged: toggleCheckbox),
              Text(
                  "by creating an account you agree to our teams and conditions")
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          print(_user_name.text);
                          print(password.text);
                          if (_user_name.text != "" && password.text != "") {
                            register(_user_name.text, password.text);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SigninScreen(),
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.black)),
                        child: const Text("register",
                            style: TextStyle(
                              color: Colors.white, // Set the text color here
                              fontSize: 18,
                            ))),
                  ]))
        ],
      ),
    );
  }
}
