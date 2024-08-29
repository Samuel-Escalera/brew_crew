import 'package:brew_crew/models/user_entity.dart';
import 'package:brew_crew/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign in to Brew Crew'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: ElevatedButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnonymous();
            if (result == null) {
              print('Error sign In');
            } else {
              print('Sing In');
              print(result.uid);
            }
          }, 
          child: Text('Sign in anon')), 
      ),
    );
  }
}