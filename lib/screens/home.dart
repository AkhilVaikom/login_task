import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:loginpage/widget/contact.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  List<Contact> contacts = [
    Contact(leadingImg: "1", name: "Name A", number: "9876543210"),
    Contact(leadingImg: "2", name: "Name B", number: "8765432109"),
    Contact(leadingImg: "3", name: "Name C", number: "7654321098"),
    Contact(leadingImg: "4", name: "Name D", number: "6543210987"),
    Contact(leadingImg: "5", name: "Name E", number: "8765432109"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home", style: TextStyle(color: Colors.blue[900])),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    contacts[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(contacts[index].number),
                  leading: CircleAvatar(
                    child: Text(
                      contacts[index].leadingImg,
                      style: TextStyle(fontSize: 15),
                    ),
                    backgroundColor: Colors.blue.shade800,
                    radius: 25,
                  ),
                ),
              );
            }));
  }
}
