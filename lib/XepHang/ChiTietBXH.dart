import 'package:cached_network_image/cached_network_image.dart';
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
    int i = 0;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 184, 244),
        body: ListView.builder(
            padding: EdgeInsets.all(5),
            itemCount: lsUser.length,
            itemBuilder: (context, index) {
              return Card(
                //color: Colors.yellow,

                child: ListTile(
                  title: Text(
                    lsUser[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    radius: 20,
                    child: Text(
                      '${++i}',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  trailing: Text(
                    'Score: ${lsUser[index].diem}',
                    style: GoogleFonts.jotiOne(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${lsUser[index].email}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BXHDetail(
                                  product: lsUser[index],
                                )));

                    ///Se thuc hien chuyen man hinh chi tiet
                  },
                ),
              );
            }));
  }
}
