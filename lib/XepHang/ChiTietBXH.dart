import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/XepHang/BangXH_Detail.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/object.dart';
import 'package:google_fonts/google_fonts.dart';

class ChiTietBXH extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChiTietBXHState();
  }
}

class ChiTietBXHState extends State<ChiTietBXH> {
  final ref = FirebaseDatabase.instance.ref();
  List<UserObject> lsUser = [];
  List<UserObject> New = [];

  String uidUser = "";

  int i = 0;
  dynamic tam;
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

    set();
    // KiemTra();
  }

  void set() {
    ref.child("users").orderByChild('diem').onChildAdded.listen((data) {
      UserObject bxh = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(bxh);
    });
    if (mounted) {
      setState(() {});
    }
  }

  Diem() {
    // lsUser[];
    // kiemtra();
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
    return 'khong co';
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
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 184, 244),
        body: ListView.builder(
            padding: EdgeInsets.all(5),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //color: Colors.yellow,
                child: ListTile(
                  title: Text(
                    lsUser[lsUser.length - 1 - index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Hero(
                    tag:
                        'productimage_${lsUser[lsUser.length - 1 - index].email}',
                    child: avatar() == ''
                        ? CircleAvatar(
                            child: Text('No Image'),
                          )
                        : CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                lsUser[lsUser.length - 1 - index].image),
                          ),
                  ),
                  trailing: Text(
                    '??i???m: ${lsUser[lsUser.length - 1 - index].diem}',
                    style: GoogleFonts.jotiOne(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${lsUser[lsUser.length - 1 - index].email}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BXHDetail(
                                  product: lsUser[lsUser.length - 1 - index],
                                )));

                    ///Se thuc hien chuyen man hinh chi tiet
                  },
                ),
              );
            }));
  }
}
