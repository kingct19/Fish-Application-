import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/pages/MainPages/EmployeePage.dart';
import 'package:sampleproject/pages/MainPages/SignPage.dart';

import 'LoginScreen.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            height: 240,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/FISH2.png',
                ),
              ),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: .001),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 420,
                width: 310,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(25),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Color.fromARGB(255, 117, 116, 116),
                      blurRadius: 6,
                      offset: Offset(8, 20), // Shadow position
                    ),
                  ],
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const LoginForm(),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  LoginFormState createState() {
    return LoginFormState();
    // ignore: todo
  } // TODO: implement createState
}

// ignore: duplicate_ignore
class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _email = "";
  // ignore: unused_field
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 70),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value ?? "";
                      }),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: "Password",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value ?? "";
                    },
                    obscureText: true,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: _email,
                            password: _password,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EmployeePage(
                                        title: '',
                                      )));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Authentication Failed")));
                        }
                      }
                    },
                    icon: const Icon(Icons.lock_open, size: 22),
                    label: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  signUpOption()
                ])));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Color.fromARGB(179, 204, 16, 16))),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen(
                          title: '',
                        )));
          },
          child: const Text(
            " Sign In",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
