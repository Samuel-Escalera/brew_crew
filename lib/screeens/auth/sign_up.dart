import 'package:brew_crew/services/auth_services.dart';
import 'package:brew_crew/shared/constants.dart';
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
  final _fromKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

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
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (value) => value!.isEmpty ? "Enter an email" : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val!.length < 6 ? "Enter a password 6+ chars long" : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                }
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if(_fromKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    print(result);
                    if (result == null) {
                      setState(() => error = 'Please input a validate email');
                    }
                  }
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
              ),
              const SizedBox(height: 12),
              Text(
                error,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}