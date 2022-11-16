import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'contact_object.dart';

class ContactDetail extends StatefulWidget {
  ContactObject contact;
  ContactDetail({Key? key, required this.contact}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ContactDetailState();
  }
}

class ContactDetailState extends State<ContactDetail> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtName.text = this.widget.contact.name;
    txtPhone.text = this.widget.contact.phone;
    txtEmail.text = this.widget.contact.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông Tin Chi Tiết'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            child: CachedNetworkImage(
              imageUrl: this.widget.contact.picture,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: txtName,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Tên Liên Hệ',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: txtPhone,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Số Điện Thoại',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: txtEmail,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
