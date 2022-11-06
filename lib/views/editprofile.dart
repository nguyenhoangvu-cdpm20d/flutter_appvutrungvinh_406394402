import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/home.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class EditProfile extends StatefulWidget {
  @override

  // TODO: implement createState
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
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
            Container(
              // padding: EdgeInsets.only(top: 0),
              child: Text(
                'CHỈNH SỬA THÔNG TIN CÁ NHÂN ',
                style: TextStyle(
                    fontSize: 25,
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller: txtName,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Tên Người Dùng',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller: txtEmail,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Giới Tính',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller: txtEmail,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Số Điện Thoại',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller: txtEmail,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Năm Sinh',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: const Text(
                            'Lưu Thông Tin Cá Nhân Thành Công',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                                Navigator.pushAndRemoveUntil<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    // ignore: prefer_const_constructors
                                    builder: (BuildContext context) => Home(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Lưu Thông Tin',
                    style: TextStyle(
                      color: Colors.pink[400],
                      fontSize: 25,
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
