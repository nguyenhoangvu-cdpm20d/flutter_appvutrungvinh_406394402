import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/lich_su/LSObject.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/object.dart';

class LichSu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LichSuState();
  }
}

class LichSuState extends State<LichSu> {
  List<UserObject> lsUser = [];
  String uidUser = "";
  List<LSObject> lsLichSu = [];
  String uidLichSu = "";
  final ref = FirebaseDatabase.instance.ref();
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidLichSu = user.uid;
      }
    });
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    userData();
    LichSuData(); // kt va hien thi thong tin
    setState(() {});
  }

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
  }

  void LichSuData() {
    ref.child("history").onChildAdded.listen((data) {
      LSObject lsObject = LSObject.fromJson(data.snapshot.value as Map);
      lsLichSu.add(lsObject);
      setState(() {});
    });
  }

  TenChuDe() {
    for (int i = 0; i < lsLichSu.length; i++) {
      if (lsLichSu[i].uid == uidLichSu) {
        return '${lsLichSu[i].tenchude}';
      }
    }
    return uidLichSu;
  }

  CheDo() {
    for (int i = 0; i < lsLichSu.length; i++) {
      if (lsLichSu[i].uid == uidLichSu) {
        return '${lsLichSu[i].chedo}';
      }
    }
    return 'Chưa có thông tin';
  }

  ThoiGian() {
    for (int i = 0; i < lsLichSu.length; i++) {
      if (lsLichSu[i].uid == uidLichSu) {
        return '${lsLichSu[i].thoigian}';
      }
    }
    return 'Chưa có thông tin';
  }

  Diem() {
    for (int i = 0; i < lsLichSu.length; i++) {
      if (lsLichSu[i].uid == uidLichSu) {
        return '${lsLichSu[i].diem}';
      }
    }
    return 'Chưa có thông tin';
  }

  Sl() {
    for (int i = 0; i < lsLichSu.length; i++) {
      if (lsLichSu[i].uid == uidLichSu) {
        return '${lsLichSu[i].sl}';
      }
    }
    return 'Chưa có thông tin';
  }

  Ten() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].name}';
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 184, 244),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 550,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 195, 60, 134),
            ),
            child: Column(
              children: [
                Text(
                    "__________________________________________________________"),
                Container(
                  margin: EdgeInsets.only(),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(left: 15, top: 15, bottom: 5),
                        child: avatar() == ''
                            ? CircleAvatar(
                                child: Text('No Image'),
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    CachedNetworkImageProvider(avatar()),
                              ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          '${Ten()}',
                          style: TextStyle(
                              color: Colors.redAccent.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                    "__________________________________________________________"),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Chủ đề: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${TenChuDe()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Chế độ: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "${CheDo()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Câu trả lời đúng: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "${Sl()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Thời gian: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "${ThoiGian()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Điểm: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "${Diem()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Vàng: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "${Vang()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
