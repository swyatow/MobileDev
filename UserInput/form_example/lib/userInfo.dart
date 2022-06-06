import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key, required User user}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  _RegisterFormPageState({required User user});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
