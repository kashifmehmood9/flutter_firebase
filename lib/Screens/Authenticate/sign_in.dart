import 'package:brew_crew/Services/AuthService.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  Function? toggleView;
  final AuthService _authService = AuthService();
  SignIn({this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign in to brew crew"),
        elevation: 0.0,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                widget.toggleView?.call();
              },
              icon: Icon(Icons.app_registration),
              label: Text("Register")),
        ],
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Email: $email password $password");
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
