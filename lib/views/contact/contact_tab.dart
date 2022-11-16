import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'contact_detail.dart';
import 'contact_object.dart';
import 'contact_provider.dart';

class ContactTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactTabState();
  }
}

class ContactTabState extends State<ContactTab> {
  List<ContactObject> lsContacts = [];
  void _LoadDanhSach() async {
    final data = await ContactProvider.getAllContacts();
    setState(() {});
    lsContacts = data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _LoadDanhSach();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: ListView.builder(
        itemCount: lsContacts.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(lsContacts[index].picture),
            ),
            title: Text(lsContacts[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lsContacts[index].phone),
                Text(lsContacts[index].email),
              ],
            ),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  // ignore: prefer_const_constructors
                  builder: (BuildContext context) =>
                      ContactDetail(contact: lsContacts[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
