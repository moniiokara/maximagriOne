import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/utilities/user_authentication.dart';
import 'package:maximagri/widgets/navigation/sales_manager_navigation.dart';

import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_tablet_page.dart';

import 'package:maximagri/pages/sales_manager/dealers_list/sales_manager_dealers_list_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/dealers_list/sales_manager_dealers_list_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/dealers_list/sales_manager_dealers_list_tablet_page.dart';

import 'package:maximagri/pages/sales_manager/orders_list/sales_manager_orders_list_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/orders_list/sales_manager_orders_list_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/orders_list/sales_manager_orders_list_tablet_page.dart';

import 'package:maximagri/pages/sales_manager/sales_officer_list/sales_manager_sales_officer_list_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/sales_officer_list/sales_manager_sales_officer_list_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/sales_officer_list/sales_manager_sales_officer_list_tablet_page.dart';

import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_desktop_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_tablet_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_mobile_page.dart';

import 'package:maximagri/pages/contact/contact_us/contact_us_mobile_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_tablet_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_desktop_page.dart';

import 'package:maximagri/pages/about/about_us/about_us_desktop_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_mobile_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_tablet_page.dart';

class SalesManagerDrawer extends StatelessWidget {
  const SalesManagerDrawer({Key? key}) : super(key: key);

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
                mobilePage: SalesManagerDashboardMobilePage(),
                tabletPage: SalesManagerDashboardTabletPage(),
                desktopPage: SalesManagerDashboardDesktopPage(),
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
                mobilePage: SalesManagerSalesOfficerListMobilePage(),
                tabletPage: SalesManagerSalesOfficerListTabletPage(),
                desktopPage: SalesManagerSalesOfficerListDesktopPage(),
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
                mobilePage: SalesManagerDealersListMobilePage(),
                tabletPage: SalesManagerDealersListTabletPage(),
                desktopPage: SalesManagerDealersListDesktopPage(),
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
                mobilePage: SalesManagerOrdersListMobilePage(),
                tabletPage: SalesManagerOrdersListTabletPage(),
                desktopPage: SalesManagerOrdersListDesktopPage(),
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
                  pageDrawer: SalesManagerDrawer(),
                  pageNavigation: SalesManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: ContactUsTabletPage(
                  pageDrawer: SalesManagerDrawer(),
                  pageNavigation: SalesManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage:
                    ContactUsDesktopPage(pageDrawer: SalesManagerDrawer()),
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
                  pageDrawer: SalesManagerDrawer(),
                  pageNavigation: SalesManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: AboutUsTabletPage(
                  pageDrawer: SalesManagerDrawer(),
                  pageNavigation: SalesManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage:
                    AboutUsDesktopPage(pageDrawer: SalesManagerDrawer()),
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
                  pageDrawer: SalesManagerDrawer(),
                  pageNavigation: SalesManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: TermsAndConditionsTabletPage(
                  pageDrawer: SalesManagerDrawer(),
                  pageNavigation: SalesManagerNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage: TermsAndConditionsDesktopPage(
                    pageDrawer: SalesManagerDrawer()),
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
