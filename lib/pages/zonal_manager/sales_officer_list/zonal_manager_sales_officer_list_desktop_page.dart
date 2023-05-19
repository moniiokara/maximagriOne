import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/widgets/drawer/zonal_manager_drawer.dart';
import 'package:maximagri/widgets/user_profile_card.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';

import 'package:maximagri/pages/auth/splash_screen/progress_indicator_desktop_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_mobile_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_tablet_page.dart';

class ZonalManagerSalesOfficerListDesktopPage extends StatefulWidget {
  const ZonalManagerSalesOfficerListDesktopPage({Key? key}) : super(key: key);

  @override
  State<ZonalManagerSalesOfficerListDesktopPage> createState() =>
      _ZonalManagerSalesOfficerListDesktopPageState();
}

class _ZonalManagerSalesOfficerListDesktopPageState
    extends State<ZonalManagerSalesOfficerListDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZonalManagerSalesOfficerListDesktopPage'),
      ),
      body: Row(
        children: [
          const ZonalManagerDrawer(),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('userProfile')
                  .where('zonalManagerUID',
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
                      .where((doc) => doc.get('userType') == 'salesOfficer')
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
          )
        ],
      ),
    );
  }
}
