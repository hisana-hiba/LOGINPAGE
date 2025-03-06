import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:untitled63/WORK/home_page.dart';
import 'package:untitled63/WORK/singup%20screen.dart';
import 'firebase survice page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    String? result = await FirebaseService().loginUser(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    if (result == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pngtree-glass-effect-image_15637289.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GlassmorphicContainer(
            width: 350,
            height: 400,
            borderRadius: 20,
            blur: 15,
            alignment: Alignment.center,
            border: 2,
            linearGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.2),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: loginUser,
                    child: Text("Login"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text("Don't have an account? Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
