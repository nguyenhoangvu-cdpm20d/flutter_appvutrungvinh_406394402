import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/object.dart';

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
  String uidUser = "";
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
    return 'khong co';
  }

  Mail() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return '${lsUser[i].email}';
      }
    }
    return 'khong co';
  }

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
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
            "Trang cá nhân",
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
                      color: Color.fromARGB(255, 229, 184, 244),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 70),
                                height: 150,
                                width: 500,
                                child: Hero(
                                  tag:
                                      'productimage_${this.widget.product.name}',
                                  child: avatar() == ''
                                      ? CircleAvatar(
                                          child: Text('No Image'),
                                        )
                                      : CircleAvatar(
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                  avatar()),
                                        ),
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Score: ${this.widget.product.diem}',
                                  style: GoogleFonts.jotiOne(fontSize: 18),
                                )),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                  "_________________________________________________________"),
                            ),
                            Container(
                                child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 100,
                                      right: 40,
                                      bottom: 40,
                                      top: 50),
                                  child: Text(
                                      "Tên:  " + this.widget.product.name,
                                      style: GoogleFonts.jotiOne(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 70,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            'Email: ${this.widget.product.email}',
                                        style: GoogleFonts.jotiOne(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                Container(
                                  width: 150,
                                  height: 50,
                                  margin:
                                      const EdgeInsets.only(top: 90, left: 85),
                                  //padding: EdgeInsets.all(15),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll<Color>(
                                              Color.fromARGB(
                                                  255, 102, 190, 39)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    child: Text('Trở về',
                                        style:
                                            GoogleFonts.jotiOne(fontSize: 28)),
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )),
                          ]),
                    ),
                  ],
                )));
  }
}
