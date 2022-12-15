import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtPass2 = TextEditingController();

  final ref = FirebaseDatabase.instance.ref().child('users');
  final reff = FirebaseDatabase.instance.ref().child('history');

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 184, 244),
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
                controller: txtName,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
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
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 6),
              child: TextField(
                controller: txtPass2,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.password),
                ),
              ),
            ),
            ElevatedButton(
              // onPressed: () async {
              //   try {
              //     final newUser = _auth.createUserWithEmailAndPassword(
              //         email: txtEmail.text, password: txtPass.text);
              //     if (newUser != null) {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => SignIn()));
              //     } else {
              //       final snackBar =
              //           SnackBar(content: Text('Tài khoản này không hợp lệ'));
              //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //     }
              //   } catch (e) {
              //     final snackBar = SnackBar(content: Text('Có lỗi xảy ra rồi'));
              //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //   }
              // },
              onPressed: () async {
                if (txtPass.text == txtPass2.text &&
                    txtPass2.text.length >= 8 &&
                    txtPass.text.length >= 8) {
                  try {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                            email: txtEmail.text, password: txtPass.text);
                    if (userCredential.user != null) {
                      String uid = userCredential.user!.uid;

                      ref.child(uid).set({
                        'name': txtName.text,
                        'password': txtPass.text,
                        'email': txtEmail.text,
                        'SDT': ' ',
                        'image':
                            'https://vivureviews.com/wp-content/uploads/2022/08/avatar-vo-danh-9.png',
                        'uid': uid,
                        'diem': 0,
                        'vang': 100,
                      });
                      reff.child(uid).set({
                        'name': txtName.text,
                        'tenchude': '',
                        'chedo': '',
                        'diem': 0,
                        'thoigian': 0,
                        'sl': 0,
                        'uid': uid
                      });
                      Navigator.pop(context, 'Đăng Ký Thành Công!');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    } else {
                      final snackBar = SnackBar(
                          content: Text('Tài khoản này không hợp lệ!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } catch (e) {
                    final snackBar = SnackBar(content: Text('Có lỗi xảy ra!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: const Text(
                'Đăng Ký',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent)),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bạn đã có tài khoản? ",
                  style: TextStyle(fontSize: 15.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: const Text(
                    "  Đăng nhập",
                    style: TextStyle(
                        fontSize: 15.5, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
