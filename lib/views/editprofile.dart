import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/home.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class EditProfile extends StatefulWidget {
  @override

  // TODO: implement createState
  State<EditProfile> createState() => EditProfileState();
}

enum SingingCharacter { Man, Woman }

class EditProfileState extends State<EditProfile> {
  SingingCharacter? _character = SingingCharacter.Woman;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2100, 12, 31));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
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
                const Padding(
                  padding: EdgeInsets.all(0),
                  child: TextField(
                    //controller: txtName,
                    readOnly: false,
                    decoration: InputDecoration(
                      labelText: 'Tên Người Dùng',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text(
                          'Giới tính:',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('Nam'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.Man,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Nữ'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.Woman,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        //controller: txtEmail,
                        readOnly: false,
                        decoration: InputDecoration(
                          labelText: 'Số Điện Thoại',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Năm sinh:                            ' +
                            "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextButton(
                        onPressed: () => _selectDate(context),
                        child: Icon(Icons.edit_calendar_outlined),
                      ),
                    ],
                  ),
                  /*child:
                      TextField(
                    //controller: txtEmail,
                    readOnly: false,
                    decoration: InputDecoration(
                      labelText:
                          "Năm sinh: ${selectedDate.toLocal()}".split(' ')[0],
                      border: UnderlineInputBorder(),
                    ),
                  ),*/
                ),
                OutlinedButton(
                  onPressed: () {
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
                          actions: [
                            /* TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                                Navigator.pushAndRemoveUntil<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    // ignore: prefer_const_constructors
                                    builder: (BuildContext context) =>
                                        EditProfile(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: const Text(
                                '                                                                                       Ok',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                ),
                              ),
                            ),*/
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
