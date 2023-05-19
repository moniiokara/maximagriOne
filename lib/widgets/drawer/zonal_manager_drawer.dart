import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/utilities/user_authentication.dart';
import 'package:maximagri/widgets/navigation/zonal_manager_navigation.dart';

import 'package:maximagri/pages/zonal_manager/credit_center/zonal_manager_credit_center_desktop_page.dart';
import 'package:maximagri/pages/zonal_manager/credit_center/zonal_manager_credit_center_mobile_page.dart';
import 'package:maximagri/pages/zonal_manager/credit_center/zonal_manager_credit_center_tablet_page.dart';

import 'package:maximagri/pages/zonal_manager/sales_manager_list/zonal_manager_sales_manager_list_desktop_page.dart';
import 'package:maximagri/pages/zonal_manager/sales_manager_list/zonal_manager_sales_manager_list_mobile_page.dart';
import 'package:maximagri/pages/zonal_manager/sales_manager_list/zonal_manager_sales_manager_list_tablet_page.dart';

import 'package:maximagri/pages/zonal_manager/dashboard/zonal_manager_dashboard_desktop_page.dart';
import 'package:maximagri/pages/zonal_manager/dashboard/zonal_manager_dashboard_mobile_page.dart';
import 'package:maximagri/pages/zonal_manager/dashboard/zonal_manager_dashboard_tablet_page.dart';

import 'package:maximagri/pages/zonal_manager/dealers_list/zonal_manager_dealers_list_desktop_page.dart';
import 'package:maximagri/pages/zonal_manager/dealers_list/zonal_manager_dealers_list_mobile_page.dart';
import 'package:maximagri/pages/zonal_manager/dealers_list/zonal_manager_dealers_list_tablet_page.dart';

import 'package:maximagri/pages/zonal_manager/orders_list/zonal_manager_orders_list_desktop_page.dart';
import 'package:maximagri/pages/zonal_manager/orders_list/zonal_manager_orders_list_mobile_page.dart';
import 'package:maximagri/pages/zonal_manager/orders_list/zonal_manager_orders_list_tablet_page.dart';

import 'package:maximagri/pages/zonal_manager/sales_officer_list/zonal_manager_sales_officer_list_desktop_page.dart';
import 'package:maximagri/pages/zonal_manager/sales_officer_list/zonal_manager_sales_officer_list_mobile_page.dart';
import 'package:maximagri/pages/zonal_manager/sales_officer_list/zonal_manager_sales_officer_list_tablet_page.dart';

import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_desktop_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_tablet_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_mobile_page.dart';

import 'package:maximagri/pages/contact/contact_us/contact_us_mobile_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_tablet_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_desktop_page.dart';

import 'package:maximagri/pages/about/about_us/about_us_desktop_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_mobile_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_tablet_page.dart';

class ZonalManagerDrawer extends StatelessWidget {
  const ZonalManagerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        //
        const DrawerHeader(
          child: Image(
            image: AssetImage('lib/assets/images/maxim_logo.png'),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.store,
            color: Colors.green,
          ),
          title: const Text(
            'DASHBOARD',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerDashboardMobilePage(),
                tabletPage: ZonalManagerDashboardTabletPage(),
                desktopPage: ZonalManagerDashboardDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.credit_score,
            color: Colors.green,
          ),
          title: const Text(
            'CREDIT CENTER',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerCreditCenterMobilePage(),
                tabletPage: ZonalManagerCreditCenterTabletPage(),
                desktopPage: ZonalManagerCreditCenterDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.people,
            color: Colors.green,
          ),
          title: const Text(
            'SALES MANAGERS',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerSalesManagerListMobilePage(),
                tabletPage: ZonalManagerSalesManagerListTabletPage(),
                desktopPage: ZonalManagerSalesManagerListDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.people,
            color: Colors.green,
          ),
          title: const Text(
            'SALES OFFICERS',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerSalesOfficerListMobilePage(),
                tabletPage: ZonalManagerSalesOfficerListTabletPage(),
                desktopPage: ZonalManagerSalesOfficerListDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.people,
            color: Colors.green,
          ),
          title: const Text(
            'DEALERS LIST',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerDealersListMobilePage(),
                tabletPage: ZonalManagerDealersListTabletPage(),
                desktopPage: ZonalManagerDealersListDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.view_list,
            color: Colors.green,
          ),
          title: const Text(
            'ORDERS LIST',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerOrdersListMobilePage(),
                tabletPage: ZonalManagerOrdersListTabletPage(),
                desktopPage: ZonalManagerOrdersListDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.support_agent,
            color: Colors.green,
          ),
          title: const Text(
            'CONTACT US',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ContactUsMobilePage(
                  pageDrawer: ZonalManagerDrawer(),
                  pageNavigation: ZonalManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: ContactUsTabletPage(
                  pageDrawer: ZonalManagerDrawer(),
                  pageNavigation: ZonalManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage:
                    ContactUsDesktopPage(pageDrawer: ZonalManagerDrawer()),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.corporate_fare,
            color: Colors.green,
          ),
          title: const Text(
            'ABOUT US',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: AboutUsMobilePage(
                  pageDrawer: ZonalManagerDrawer(),
                  pageNavigation: ZonalManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: AboutUsTabletPage(
                  pageDrawer: ZonalManagerDrawer(),
                  pageNavigation: ZonalManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage:
                    AboutUsDesktopPage(pageDrawer: ZonalManagerDrawer()),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.checklist_outlined,
            color: Colors.green,
          ),
          title: const Text(
            'TERMS & CONDITIONS',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: TermsAndConditionsMobilePage(
                  pageDrawer: ZonalManagerDrawer(),
                  pageNavigation: ZonalManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: TermsAndConditionsTabletPage(
                  pageDrawer: ZonalManagerDrawer(),
                  pageNavigation: ZonalManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage: TermsAndConditionsDesktopPage(
                    pageDrawer: ZonalManagerDrawer()),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.green,
          ),
          title: const Text(
            'LOGOUT',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, UserAuthentication.routeName);
          },
        ),
      ]),
    );
  }
}
