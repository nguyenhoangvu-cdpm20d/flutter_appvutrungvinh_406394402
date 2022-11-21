import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/home.dart';
import 'package:flutter_appvutrungvinh_406394402/views/sign_up_in/signup.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBar(context),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Đăng Nhập',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 6),
                child: TextField(
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 6),
                child: TextField(
                  controller: txtPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    final _user = _auth.signInWithEmailAndPassword(
                        email: txtEmail.text, password: txtPass.text);
                    if (_user != null) {
                      txtEmail.clear();
                      txtPass.clear();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'home',
                        (route) => false,
                      );
                    } else {
                      final snackBar = SnackBar(
                          content: Text('Email hoặc mật khẩu không đúng'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } catch (e) {
                    final snackBar =
                        SnackBar(content: Text('Lỗi kết nối đến Server'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text(
                  'Đăng Nhập',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent)),
              )
            ],
          ),
        ));
  }
}
