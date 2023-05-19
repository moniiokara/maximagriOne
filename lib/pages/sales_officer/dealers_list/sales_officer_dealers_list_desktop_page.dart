import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/widgets/user_profile_card.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';

import 'package:maximagri/pages/auth/splash_screen/progress_indicator_desktop_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_mobile_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_tablet_page.dart';

class SalesOfficerDealersListDesktopPage extends StatefulWidget {
  const SalesOfficerDealersListDesktopPage({Key? key}) : super(key: key);

  @override
  State<SalesOfficerDealersListDesktopPage> createState() =>
      _SalesOfficerDealersListDesktopPageState();
}

class _SalesOfficerDealersListDesktopPageState
    extends State<SalesOfficerDealersListDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SalesOfficerDealersListDesktopPage'),
      ),
      body: Row(
        children: [
          const SalesOfficerDrawer(),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('userProfile')
                  .where('salesOfficerUID',
                      isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.active) {
                  return const Responsiveness(
                    mobilePage: ProgressIndicatorMobilePage(),
                    tabletPage: ProgressIndicatorTabletPage(),
                    desktopPage: ProgressIndicatorDesktopPage(),
                  );
                }
                if (!snapshot.hasData) {
                  return const Responsiveness(
                    mobilePage: ProgressIndicatorMobilePage(),
                    tabletPage: ProgressIndicatorTabletPage(),
                    desktopPage: ProgressIndicatorDesktopPage(),
                  );
                } else {
                  final filteredDocs = snapshot.data!.docs
                      .where((doc) => doc.get('userType') == 'dealer')
                      .toList();
                  return ListView.builder(
                      itemCount: filteredDocs.length,
                      itemBuilder: (context, index) {
                        final json = filteredDocs[index].data();
                        final userProfile = UserProfile.fromJson(json);
                        return UserProfileCard(userProfile: userProfile);
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
