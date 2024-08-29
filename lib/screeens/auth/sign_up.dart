import 'package:brew_crew/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  final toggleView;

  const SignUp({
    super.key,
    this.toggleView
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

    
  AuthServices _auth = AuthServices();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar( 
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text(
          'Sign Up to Brew Crew',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            label: const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white
              ),
              ),
            icon: const Icon(
              Icons.person,
              color: Colors.white,
              ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              }
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print(email);
                print(password);
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[400]
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            )
          ],
        ),
      )
    );
  }
}