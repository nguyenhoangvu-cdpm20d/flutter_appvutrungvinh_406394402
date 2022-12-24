import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/home.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/NapTienObject.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/object.dart';

const List<String> list = <String>['Vinaphone', 'Viettel', 'Mobiphone'];

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});
  @override
  State<searchScreen> createState() => searchScreenState();
}

enum SingingCharacter {
  TenThousand,
  TwentyThousand,
  FiftyThousand,
  OneHunredThousand,
  TwoHunredThousand,
  FiveHunredThousand
}

class searchScreenState extends State<searchScreen> {
  TextEditingController txtSeri = TextEditingController();

  String dropdownValue = list.first;
  SingingCharacter? _character = SingingCharacter.TenThousand;
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
    userData();
    setState(() {});
  }

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
  }

  Vang() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return lsUser[i].vang;
      }
    }
    return '';
  }

  Ten() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return lsUser[i].name;
      }
    }
    return 'Chưa có thông tin';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 184, 244),
      appBar: AppBar(
        //title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 5),
              child: Row(
                children: [
                  Text(
                    'Tên Đăng Nhập:  ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 157, 22, 22),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    Ten(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    size: 35,
                    color: Color.fromARGB(255, 139, 173, 2),
                  ),
                  Text(
                    '${Vang()}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 5),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'Chọn loại thẻ: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(
                          color: Colors.deepPurple, fontSize: 20),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 85, top: 5, bottom: 5),
                  child: Text(
                    'Giá',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 125, top: 5, bottom: 5),
                  child: Text(
                    'Thêm vàng',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                ),
              ],
            ),
            ListTile(
              title: const Text('10.000 VNĐ                       Vàng x 20',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.TenThousand,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('20.000 VNĐ                       Vàng x 40',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.TwentyThousand,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('50.000 VNĐ                       Vàng x 100',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.FiftyThousand,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('100.000 VNĐ                     Vàng x 210',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.OneHunredThousand,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('200.000 VNĐ                     Vàng x 425',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.TwoHunredThousand,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('500.000 VNĐ                     Vàng x 1070',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.FiveHunredThousand,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
              child: TextField(
                controller: txtSeri,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Nhập Mã Số Seri',
                  //labelText: Ten(),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (Route<dynamic> route) => false,
                  );
                  if (txtSeri.text.isNotEmpty && (txtSeri.text.length == 13)) {
                    final snackBar =
                        SnackBar(content: Text('Nạp tiền thành công'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    final snackBar =
                        SnackBar(content: Text('Mã Seri có ít nhất 13 ký tự'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  'Nạp tiền',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
