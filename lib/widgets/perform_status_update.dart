import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_desktop_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_mobile_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_tablet_page.dart';
import 'package:maximagri/utilities/responsiveness.dart';

class PerformStatusUpdate extends StatefulWidget {
  final SingleOrder orderDetails;
  const PerformStatusUpdate({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<PerformStatusUpdate> createState() => _PerformStatusUpdateState();
}

class _PerformStatusUpdateState extends State<PerformStatusUpdate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('userProfile')
            .where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            final userType = snapshot.data?.docs.first.get('userType');

            if (userType == 'dealer') {
              return const Text('dealer');
            } else if (userType == 'salesOfficer') {
              return const Text('salesOfficer');
            } else if (userType == 'salesManager') {
              return const Text('salesManager');
            } else if (userType == 'zonalManager') {
              return const Text('zonalManager');
            } else if (userType == 'operations') {
              return const Text('operations');
            } else {
              return const CircularProgressIndicator();
            }
          }
          return const CircularProgressIndicator();
        });
  }
}
