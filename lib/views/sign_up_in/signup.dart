import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              'Đăng ký tài khoản',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 6),
              child: TextField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final newUser = _auth.createUserWithEmailAndPassword(
                      email: txtEmail.text, password: txtPass.text);
                  if (newUser != null) {
                    Navigator.pop(context, 'Bạn đã đăng ký thành công');
                  } else {
                    final snackBar =
                        SnackBar(content: Text('Tài khoản này không hợp lệ'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } catch (e) {
                  final snackBar = SnackBar(content: Text('Có lỗi xảy ra rồi'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text(
                'Đăng Ký',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent)),
            )
          ],
        ),
      ),
    );
  }
}
