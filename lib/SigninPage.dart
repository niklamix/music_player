import 'package:flutter/material.dart';
import 'package:music_player/LoginPage.dart';

import 'User.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});


  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  User user = User();
  final _formKey = GlobalKey<FormState>();
  void _resultButtonClick() {
    if (/*_formKey.currentState!.validate() && */ user.password == user.repeatedPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Welcome'),
        backgroundColor: Colors.green,
      ));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage(user: user);
        },
      ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Sign in", textAlign: TextAlign.center,)),
        ),
        body: Center(
          child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 100.0,),
                  SizedBox(
                    width: 330,
                    //padding: const EdgeInsets.only(left: 105.0, top: 10.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          user.name = text;
                          print(user.name + user.login + user.password + user.repeatedPassword);
                        },
                        /*validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        }*/),
                  ),
                  const SizedBox(height: 20.0,),
                  SizedBox(
                    width: 330,
                    //padding: const EdgeInsets.only(left: 105.0, top: 10.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Login',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          user.login = text;
                          print(user);
                        },
                        /*validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your login';
                          }
                          return null;
                        }*/),
                  ),
                  const SizedBox(height: 20.0,),
                  SizedBox(
                    width: 330,
                    child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          user.password = text;
                          print(user);
                        },
                        /* validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        }*/),
                  ),
                  const SizedBox(height: 20.0,),
                  SizedBox(
                    width: 330,
                    child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Repeat password',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          user.repeatedPassword = text;
                          print(user);
                        },
                        /*validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please repeat your password';
                          } else if (user.password != user.repeatedPassword) {
                            return 'Password incorrect';
                          }
                          return null;
                        }*/),
                  ),
                  const SizedBox(height: 45.0,),
                  SizedBox(
                    height: 30.0,
                    width: 120.0,
                    child: ElevatedButton(
                        onPressed: _resultButtonClick,
                        child: const Text('sing in')),
                  ),
                  //const SizedBox(height: 10.0,),
                  TextButton(onPressed: _resultButtonClick,
                      child: const Text('log in'))
                ],
              )
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}