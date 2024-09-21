import 'package:flutter/material.dart';
import 'package:flutter_app/login/signup_screen.dart';

// ignore: camel_case_types
class Login_screen extends StatelessWidget {
  const Login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add login logic here
                debugPrint("Login Button Pressed");
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint("Pressed Signup Button");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signup_screen(),
                  ),
                );
              },
              child: const Text("SignUp"),
            ),
          ],
        ),
      ),
    );
  }
}
