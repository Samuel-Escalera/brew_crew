import 'package:brew_crew/services/auth_services.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text(
          'Brew Crew',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
            }, 
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}