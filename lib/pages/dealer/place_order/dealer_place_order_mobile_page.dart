import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';
import 'package:maximagri/models/address_model/province_model.dart';

import 'package:maximagri/widgets/drawer/dealer_drawer.dart';
import 'package:maximagri/widgets/navigation/dealer_navigation.dart';

class DealerPlaceOrderMobilePage extends StatefulWidget {
  const DealerPlaceOrderMobilePage({Key? key}) : super(key: key);

  @override
  State<DealerPlaceOrderMobilePage> createState() =>
      _DealerPlaceOrderMobilePageState();
}

class _DealerPlaceOrderMobilePageState
    extends State<DealerPlaceOrderMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DealerPlaceOrderMobilePage'),
      ),
      drawer: const DealerDrawer(),
      bottomNavigationBar: const DealerNavigation(selectedIndex: 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('DealerPlaceOrderMobilePage'),
          ],
        ),
      ),
    );
  }
}
