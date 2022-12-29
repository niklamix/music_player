import 'package:flutter/material.dart';
import 'package:music_player/AlbumsPage.dart';

import 'User.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.user});

  final User user;


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String login = "";
  String password = "";

  void _resultButtonClick() {
    if (widget.user.login == login && widget.user.password == password) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Welcome'),
        backgroundColor: Colors.green,
      ));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AlbumsPage();
        },
      ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Log in", textAlign: TextAlign.center,)),
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
                      hintText: 'Login',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      login = text;
                      print(login + " " + widget.user.login);
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
                      password = text;
                      print(password + " " + widget.user.password);
                    },
                    /*validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
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
                    child: const Text('log in')),
              ),
              //const SizedBox(height: 10.0,),
              TextButton(onPressed: _resultButtonClick,
                child: const Text('sign in'))
            ],
        )
      ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}