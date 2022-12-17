import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/object.dart';

import 'package:google_fonts/google_fonts.dart';

import 'ChiTietBXH.dart';

class BXHDetail extends StatefulWidget {
  UserObject product;
  BXHDetail({Key? key, required this.product}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return BXHDetailState();
  }
}

class BXHDetailState extends State<BXHDetail> {
  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsUser = [];
  String uidUser = '';
  bool kt = false;
  @override
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

  SDT() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].SDT}';
      }
    }
    return 'Chưa có thông tin';
  }

  void userData() {
    ref.child('users').onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
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
        appBar: AppBar(
          title: Text(
            'Trang cá nhân',
            style: GoogleFonts.jotiOne(),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Stack(
                  children: [
                    Container(
                      height: 800,
                      width: 500,
                      color: Color.fromARGB(255, 229, 184, 244),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(bottom: 5, top: 30),
                              height: 200,
                              width: 200,
                              child: avatar() == ''
                                  ? CircleAvatar(
                                      child: Text('No Image'),
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              this.widget.product.image),
                                    ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  'Score: ${this.widget.product.diem}',
                                  style: GoogleFonts.jotiOne(fontSize: 25),
                                )),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                  '_________________________________________________________'),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 30),
                                        child: Text('Tên:',
                                            style: GoogleFonts.jotiOne(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ),
                                      Container(
                                        child: Text(this.widget.product.name,
                                            style: GoogleFonts.jotiOne(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.pink)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                            top: 30,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Email:',
                                              style: GoogleFonts.jotiOne(
                                                  color: Colors.black,
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          child: RichText(
                                        text: TextSpan(
                                          text: this.widget.product.email,
                                          style: GoogleFonts.jotiOne(
                                              color: Colors.pink,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                            top: 30,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Số điện thoại:',
                                              style: GoogleFonts.jotiOne(
                                                  color: Colors.black,
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          child: RichText(
                                        text: TextSpan(
                                          text: this.widget.product.SDT,
                                          style: GoogleFonts.jotiOne(
                                              color: Colors.pink,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ],
                )));
  }
}
