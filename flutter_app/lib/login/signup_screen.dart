import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/login/signup/login_screen.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  _Signup_screenState createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  final String apiUrl = "http://10.0.2.2:3000/auth/signup";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String message = '';

  Future<void> signup() async {
    setState(() {
      isLoading = true;
      message = '';
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Name': nameController.text,
          'Username': usernameController.text,
          'Password': passwordController.text,
        }),
      );

      if (response.statusCode == 201) {
        // User successfully signed up
        setState(() {
          message = "Signup successful!";
          nameController.clear();
          usernameController.clear();
          passwordController.clear();
        });
        print("Signup successful: ${response.body}");

        // Navigate back to the login screen
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Login_screen()),
          );
        });
      } else {
        // Handle error
        setState(() {
          message = "Failed to signup: ${response.body}";
        });
        print("Failed to signup: ${response.body}");
      }
    } catch (e) {
      setState(() {
        message = "Error occurred: $e";
      });
      print("Error occurred: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login_screen()),
                );
              },
              child: const Text("Back"),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: "Name", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                  labelText: "Username", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (isLoading) CircularProgressIndicator(),
            ElevatedButton(
              onPressed: isLoading ? null : signup,
              child: const Text("Signup"),
            ),
            const SizedBox(height: 20),
            if (message.isNotEmpty)
              Text(
                message,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
