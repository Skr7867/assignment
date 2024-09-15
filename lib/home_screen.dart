// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  final String password;
  final String name;
  final String mobileno;

  final String confirmpassword;

  const HomeScreen({
    Key? key,
    required this.email,
    required this.password,
    required this.name,
    required this.mobileno,
    required this.confirmpassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'mobile no: $mobileno',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Password: $password',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'confirmpassword: $confirmpassword',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
