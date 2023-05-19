import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:maximagri/utilities/responsiveness.dart';

import 'package:maximagri/pages/auth/sign_in/sign_in_mobile_page.dart';
import 'package:maximagri/pages/auth/sign_in/sign_in_tablet_page.dart';
import 'package:maximagri/pages/auth/sign_in/sign_in_desktop_page.dart';

import 'package:maximagri/pages/auth/splash_screen/progress_indicator_mobile_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_tablet_page.dart';
import 'package:maximagri/pages/auth/splash_screen/progress_indicator_desktop_page.dart';

import 'package:maximagri/pages/operations/dashboard/operations_dashboard_mobile_page.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_tablet_page.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_desktop_page.dart';

import 'package:maximagri/pages/zonal_manager/dashboard/zonal_manager_dashboard_desktop_page.dart';
import 'package:maximagri/pages/zonal_manager/dashboard/zonal_manager_dashboard_mobile_page.dart';
import 'package:maximagri/pages/zonal_manager/dashboard/zonal_manager_dashboard_tablet_page.dart';

import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_tablet_page.dart';

import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_tablet_page.dart';
import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_desktop_page.dart';

import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_desktop_page.dart';
import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_mobile_page.dart';
import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_tablet_page.dart';

class UserRedirection extends StatefulWidget {
  static const String routeName = 'userRedirection';
  const UserRedirection({Key? key}) : super(key: key);

  @override
  State<UserRedirection> createState() => _UserRedirectionState();
}

class _UserRedirectionState extends State<UserRedirection> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('userProfile')
            .where('userUID', isEqualTo: auth.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Responsiveness(
              mobilePage: ProgressIndicatorMobilePage(),
              tabletPage: ProgressIndicatorTabletPage(),
              desktopPage: ProgressIndicatorDesktopPage(),
            );
          }
          if (snapshot.hasData) {
            final userType = snapshot.data?.docs[0].get('userType');
            if (userType == 'operations') {
              return const Responsiveness(
                mobilePage: OperationsDashboardMobilePage(),
                tabletPage: OperationsDashboardTabletPage(),
                desktopPage: OperationsDashboardDesktopPage(),
              );
            }
            if (userType == 'zonalManager') {
              return const Responsiveness(
                mobilePage: ZonalManagerDashboardMobilePage(),
                tabletPage: ZonalManagerDashboardTabletPage(),
                desktopPage: ZonalManagerDashboardDesktopPage(),
              );
            }
            if (userType == 'salesManager') {
              return const Responsiveness(
                mobilePage: SalesManagerDashboardMobilePage(),
                tabletPage: SalesManagerDashboardTabletPage(),
                desktopPage: SalesManagerDashboardDesktopPage(),
              );
            }
            if (userType == 'salesOfficer') {
              return const Responsiveness(
                mobilePage: SalesOfficerDashboardMobilePage(),
                tabletPage: SalesOfficerDashboardTabletPage(),
                desktopPage: SalesOfficerDashboardDesktopPage(),
              );
            }
            if (userType == 'dealer') {
              return const Responsiveness(
                mobilePage: DealerDashboardMobilePage(),
                tabletPage: DealerDashboardTabletPage(),
                desktopPage: DealerDashboardDesktopPage(),
              );
            }
            return const Responsiveness(
              mobilePage: SignInMobilePage(),
              tabletPage: SignInTabletPage(),
              desktopPage: SignInDesktopPage(),
            );
          } else {
            return const Responsiveness(
              mobilePage: SignInMobilePage(),
              tabletPage: SignInTabletPage(),
              desktopPage: SignInDesktopPage(),
            );
          }
        });
  }
}
