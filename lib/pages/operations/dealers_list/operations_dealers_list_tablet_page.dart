import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_desktop_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_mobile_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_tablet_page.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/widgets/user_profile_card.dart';

class OperationsDealersListTabletPage extends StatefulWidget {
  const OperationsDealersListTabletPage({Key? key}) : super(key: key);

  @override
  State<OperationsDealersListTabletPage> createState() =>
      _OperationsDealersListTabletPageState();
}

class _OperationsDealersListTabletPageState
    extends State<OperationsDealersListTabletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsDealersListTabletPage'),
      ),
      drawer: const OperationsDrawer(),
      bottomNavigationBar: const OperationsNavigation(selectedIndex: 3),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('userProfile')
              .where('userType', isEqualTo: 'dealer')
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
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    final json = snapshot.data!.docs[index].data();
                    final userProfile = UserProfile.fromJson(json);
                    return UserProfileCard(userProfile: userProfile);
                  });
            }
          },
        ),
      ),
    );
  }
}
