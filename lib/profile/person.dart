import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/editprofile.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/object.dart';
import 'package:http/http.dart' as http;

class Person extends StatefulWidget {
  @override

  // TODO: implement createState
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtSdt = TextEditingController();
  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsUser = [];
  String uidUser = "";
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    userData(); // kt va hien thi thong tin
  }

  Ten() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].name}';
      }
    }
    return 'Chưa có thông tin';
  }

  Mail() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].email}';
      }
    }
    return 'Chưa có thông tin';
  }

  SoDienThoai() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].SDT}';
      }
    }
    return 'Chưa có thông tin';
  }

  Vang() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].vang}';
      }
    }
    return 'khong co';
  }

  Diem() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].diem}';
      }
    }
    return 'khong co';
  }

  avatar() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].image}';
      }
    }
    return '';
  }

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // padding: EdgeInsets.only(top: 0),
              child: Text(
                'THÔNG TIN CÁ NHÂN ',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.redAccent.shade700,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: const Color.fromARGB(255, 170, 34, 34)
                              .withOpacity(0.3),
                          offset: const Offset(15, 15),
                          blurRadius: 15)
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 30),
              height: 200,
              width: 200,
              child: avatar() == ''
                  ? CircleAvatar(
                      child: Text('No Image'),
                    )
                  : CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(avatar()),
                    ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                '' + Ten(),
                style: TextStyle(
                    color: Colors.redAccent.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Email: ' + Mail(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.pink.shade600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Số điện thoại: ' + SoDienThoai(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.pink.shade600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Điểm: ' + Diem(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.pink.shade600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Vàng: ' + Vang(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.pink.shade600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(255, 255, 0, 149),
                            Color.fromARGB(255, 255, 0, 149),
                            Color.fromARGB(255, 255, 0, 149),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (txtName.text != "") {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        final ref =
                            FirebaseDatabase.instance.ref().child('users');
                        for (int i = 0; i < lsUser.length; i++) {
                          if (uidUser == lsUser[i].uid) {
                            ref.child(lsUser[i].uid).update({
                              'name': txtName.text,
                            });
                          }
                        }
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    },
                    child: const Text(
                      'Chỉnh sửa thông tin cá nhân',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
