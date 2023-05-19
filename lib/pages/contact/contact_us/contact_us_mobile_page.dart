
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsMobilePage extends StatefulWidget {
  final Widget pageDrawer;
  final Widget pageNavigation;
  const ContactUsMobilePage(
      {Key? key, required this.pageDrawer, required this.pageNavigation})
      : super(key: key);

  @override
  State<ContactUsMobilePage> createState() => _ContactUsMobilePageState();
}

class _ContactUsMobilePageState extends State<ContactUsMobilePage> {
  launchWhatsApp({required String phone, required String message}) async {
    String url() {
      if (kIsWeb) {
        return "https://api.whatsapp.com/send?phone=$phone&text=${Uri.parse(message)}";
      } else {
        if (Platform.isAndroid) {
          return "https://wa.me/$phone/?text=${Uri.parse(message)}";
        } else {
          return "https://api.whatsapp.com/send?phone=$phone&text=${Uri.parse(message)}";
        }
      }
    }

    if (await canLaunchUrl(Uri.parse(url()))) {
      await launchUrl(Uri.parse(url()));
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  final _fireStore = FirebaseFirestore.instance;
  TextEditingController _phoneController = TextEditingController();
  String phone = '';

  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  getPhoneNumber() async {
    DocumentSnapshot doc =
    await _fireStore.collection("contactUs").doc('phoneNumber').get();

    setState(() {
      phone = doc.get('phone');
    });
  }

  void updatePhoneNumber(String newPhone) async {
    _fireStore.collection('contactUs').doc('phoneNumber').update({'phone': newPhone});
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Phone Number'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                updatePhoneNumber(_phoneController.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Edit Number Successfully")));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactUsMobilePage'),
      ),
      drawer: widget.pageDrawer,
      bottomNavigationBar: widget.pageNavigation,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1596524430615-b46475ddff6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29udGFjdCUyMHVzfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                radius: 80,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'MaxiMagri',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Email: info@maxiagri.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  launchWhatsApp(
                      phone: '+923419840585', message: 'Hello from Flutter!');
                },
                child:  const Text('Contact us'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed:  _showMyDialog,
                child:  const Text('Edit Number'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

