import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String name, email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Mời nhập họ và tên" : null;
                },
                decoration: const InputDecoration(
                  labelText: "Họ và tên",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
                onChanged: (val) {
                  name = val;
                },
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Mời nhập Email" : null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  labelText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Mời nhập Password" : null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                ),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Password không trùng nhau" : null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  labelText: "Nhập lại Password",
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                ),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {},
                child: blueButton(context, "Đăng ký"),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Bạn đã sẵn sàng tạo tài khoản chưa? ",
                    style: TextStyle(fontSize: 15.5),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
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
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
