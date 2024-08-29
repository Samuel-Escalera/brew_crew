import 'package:brew_crew/firebase_options.dart';
import 'package:brew_crew/models/user_entity.dart';
import 'package:brew_crew/screeens/wrapper.dart';
import 'package:brew_crew/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserEntity?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthServices().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}