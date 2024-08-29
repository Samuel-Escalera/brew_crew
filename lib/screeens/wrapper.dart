import 'package:brew_crew/models/user_entity.dart';
import 'package:brew_crew/screeens/auth/auth.dart';
import 'package:brew_crew/screeens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final userEntity = Provider.of<UserEntity?>(context);
  
    if (userEntity == null) {
      return Auth();
    } else {
      return Home();
    }
  }
}