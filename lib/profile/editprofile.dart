import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/home.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/object.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/person.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class EditProfile extends StatefulWidget {
  @override

  // TODO: implement createState
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSoDienThoai = TextEditingController();
  TextEditingController txtAvatar = TextEditingController();

  int get count => list.length;
  List<int> list = [];
  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsUser = [];
  String uidUser = "";
  bool kt = false;
  @override
  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(15, (v) => v));
      print("data count = ${list.length}");
    });
  }

  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    userData(); // kt va hien thi thong tin
    setState(() {});
  }

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
  }

  Ten() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].name}';
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

  avatar() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].image}';
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
            /*Container(
              padding: EdgeInsets.only(top: 0),
              child: Text(
                'CHỈNH SỬA THÔNG TIN CÁ NHÂN ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.redAccent.shade700,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color:
                              Color.fromARGB(255, 170, 34, 34).withOpacity(0.3),
                          offset: Offset(15, 15),
                          blurRadius: 15)
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 30),
              child: const CircleAvatar(
                radius: 65.0,
                //backgroundImage: AssetImage('images/123.jpg'),
              ),
            ),*/
            //SizedBox(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                  child: TextField(
                    controller: txtName,
                    decoration: InputDecoration(
                      hintText: 'Nhập Tên Đăng Nhập',
                      labelText: '${Ten()}',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: txtSoDienThoai,
                    decoration: InputDecoration(
                      hintText: 'Nhập Số Điện Thoại',
                      labelText: '${SoDienThoai()}',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, bottom: 100),
                  child: TextField(
                    controller: txtAvatar,
                    decoration: InputDecoration(
                      hintText: 'Link Hình Ảnh',
                      labelText: '${avatar()}',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(10),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: const <Widget>[
                //       TextField(
                //         keyboardType: TextInputType.emailAddress,
                //         //controller: txtEmail,
                //         readOnly: false,
                //         decoration: InputDecoration(
                //           labelText: 'Email',
                //           border: UnderlineInputBorder(),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (txtName.text.isNotEmpty) {
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            backgroundColor: Color.fromARGB(200, 0, 0, 0),
                            title: Text(
                              'Lưu Thông Tin Cá Nhân Thành Công',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 40,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                          );
                        },
                      );
                    } else if (txtSoDienThoai.text.isNotEmpty) {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      final ref =
                          FirebaseDatabase.instance.ref().child('users');
                      for (int i = 0; i < lsUser.length; i++) {
                        if (uidUser == lsUser[i].uid) {
                          ref.child(lsUser[i].uid).update({
                            'SDT': txtSoDienThoai.text,
                          });
                        }
                      }
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            backgroundColor: Color.fromARGB(200, 0, 0, 0),
                            title: Text(
                              'Lưu Thông Tin Cá Nhân Thành Công',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 40,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                          );
                        },
                      );
                    } else if (txtAvatar.text.isNotEmpty) {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      final ref =
                          FirebaseDatabase.instance.ref().child('users');
                      for (int i = 0; i < lsUser.length; i++) {
                        if (uidUser == lsUser[i].uid) {
                          ref.child(lsUser[i].uid).update({
                            'image': txtAvatar.text,
                          });
                        }
                      }
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            backgroundColor: Color.fromARGB(200, 0, 0, 0),
                            title: Text(
                              'Lưu Thông Tin Cá Nhân Thành Công',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 40,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            backgroundColor: Color.fromARGB(200, 0, 0, 0),
                            title: Text(
                              'Lưu Thông Tin Cá Nhân Thất Bại',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                              size: 40,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    'Lưu Thông Tin',
                    style: TextStyle(
                      color: Colors.pink[400],
                      fontSize: 25,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Quay lại',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
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
