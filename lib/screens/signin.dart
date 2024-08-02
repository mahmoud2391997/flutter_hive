import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hive/main.dart';
import 'package:flutter_hive/models/user.dart';
import 'package:flutter_hive/screens/categories2.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';

class AuthService {
  final Box<User> _userBox = Hive.box<User>('userBox');

  // Future<void> login(String email, String token) async {
  //   final user = User()
  //     ..email = email
  //     ..token = token;
  //   await _userBox.put('user', user);
  // }

  User? get currentUser => _userBox.get('user');
}

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController password = TextEditingController();
  final AuthService _authService = AuthService();

  TextEditingController _user_name = TextEditingController();

  void openBoxes() async {
    final Box<User> box = await Hive.openBox<User>('users');
    // Add more boxes if needed
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openBoxes();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = _authService.currentUser;

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
            padding: EdgeInsets.only(top: 80.0, bottom: 80, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                Text(
                  "please login or sign up to continue our app",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Email"),
                  TextField(
                    controller: _user_name,
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Password"),
                  TextField(
                    controller: password,
                    obscureText: true,
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (currentUser!.email == _user_name.text &&
                            currentUser.token == password.text) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => Categories2(),
                          ));
                        }
                        Hive.close();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.black)),
                      child: const Text("Login",
                          style: TextStyle(
                            color: Colors.white, // Set the text color here
                            fontSize: 18,
                          ))),
                ]),
          )
        ],
      ),
    );
  }
}
