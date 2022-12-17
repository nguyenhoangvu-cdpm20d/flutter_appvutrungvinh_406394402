import 'package:http/http.dart';

class UserObject {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String SDT;
  final String image;
  final int diem;
  final int vang;
  UserObject(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password,
      required this.SDT,
      required this.image,
      required this.vang,
      required this.diem});

  UserObject.fromJson(Map<dynamic, dynamic> res)
      : uid = res['uid'],
        name = res['name'],
        email = res['email'],
        password = res['password'],
        SDT = res['SDT'],
        image = res['image'],
        diem = res['diem'],
        vang = res['vang'];

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'SDT': SDT,
      'image': image,
      'diem': diem,
      'vang': vang,
    };
  }
}
