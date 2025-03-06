import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Login_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyABN0bteD1qym19NM0S2H4UXqsknPJfC9s",
      appId: "1:370809774732:android:fe3a1febb44489b89451a9",
      messagingSenderId: "",
      projectId: "studentsgigs-97701",
      storageBucket: "studentsgigs-97701.firebasestorage.app",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glass Login UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}