import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maximagri/pages/sales_officer/create_dealer/sales_officer_create_dealer_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/create_dealer/sales_officer_create_dealer_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/create_dealer/sales_officer_create_dealer_tablet_page.dart';
import 'package:maximagri/widgets/navigation/sales_officer_navigation.dart';

import 'package:maximagri/pages/sales_officer/dealers_list/sales_officer_dealers_list_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/dealers_list/sales_officer_dealers_list_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/dealers_list/sales_officer_dealers_list_tablet_page.dart';

import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/utilities/user_authentication.dart';

import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_tablet_page.dart';

import 'package:maximagri/pages/sales_officer/place_order/sales_officer_place_order_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/place_order/sales_officer_place_order_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/place_order/sales_officer_place_order_tablet_page.dart';

import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_desktop_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_tablet_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_mobile_page.dart';

import 'package:maximagri/pages/contact/contact_us/contact_us_mobile_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_tablet_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_desktop_page.dart';

import 'package:maximagri/pages/about/about_us/about_us_desktop_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_mobile_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_tablet_page.dart';

import 'package:maximagri/pages/sales_officer/orders_list/sales_officer_orders_list_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/orders_list/sales_officer_orders_list_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/orders_list/sales_officer_orders_list_tablet_page.dart';

class SalesOfficerDrawer extends StatelessWidget {
  const SalesOfficerDrawer({Key? key}) : super(key: key);

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
                mobilePage: SalesOfficerDashboardMobilePage(),
                tabletPage: SalesOfficerDashboardTabletPage(),
                desktopPage: SalesOfficerDashboardDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.person_add_alt_1_sharp,
            color: Colors.green,
          ),
          title: const Text(
            'CREATE DEALER',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: SalesOfficerCreateDealerMobilePage(),
                tabletPage: SalesOfficerCreateDealerTabletPage(),
                desktopPage: SalesOfficerCreateDealerDesktopPage(),
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
                mobilePage: SalesOfficerDealersListMobilePage(),
                tabletPage: SalesOfficerDealersListTabletPage(),
                desktopPage: SalesOfficerDealersListDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.add_shopping_cart,
            color: Colors.green,
          ),
          title: const Text(
            'PLACE ORDER',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: SalesOfficerPlaceOrderMobilePage(),
                tabletPage: SalesOfficerPlaceOrderTabletPage(),
                desktopPage: SalesOfficerPlaceOrderDesktopPage(),
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
                mobilePage: SalesOfficerOrdersListMobilePage(),
                tabletPage: SalesOfficerOrdersListTabletPage(),
                desktopPage: SalesOfficerOrdersListDesktopPage(),
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
                  pageDrawer: SalesOfficerDrawer(),
                  pageNavigation: SalesOfficerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                tabletPage: ContactUsTabletPage(
                  pageDrawer: SalesOfficerDrawer(),
                  pageNavigation: SalesOfficerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                desktopPage:
                    ContactUsDesktopPage(pageDrawer: SalesOfficerDrawer()),
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
                  pageDrawer: SalesOfficerDrawer(),
                  pageNavigation: SalesOfficerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                tabletPage: AboutUsTabletPage(
                  pageDrawer: SalesOfficerDrawer(),
                  pageNavigation: SalesOfficerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                desktopPage:
                    AboutUsDesktopPage(pageDrawer: SalesOfficerDrawer()),
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
                  pageDrawer: SalesOfficerDrawer(),
                  pageNavigation: SalesOfficerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                tabletPage: TermsAndConditionsTabletPage(
                  pageDrawer: SalesOfficerDrawer(),
                  pageNavigation: SalesOfficerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                desktopPage: TermsAndConditionsDesktopPage(
                    pageDrawer: SalesOfficerDrawer()),
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
