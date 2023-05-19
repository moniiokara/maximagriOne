import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maximagri/widgets/navigation/dealer_navigation.dart';
import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/utilities/user_authentication.dart';

import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_desktop_page.dart';
import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_mobile_page.dart';
import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_tablet_page.dart';

import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_desktop_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_tablet_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_mobile_page.dart';

import 'package:maximagri/pages/contact/contact_us/contact_us_mobile_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_tablet_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_desktop_page.dart';

import 'package:maximagri/pages/about/about_us/about_us_desktop_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_mobile_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_tablet_page.dart';

import 'package:maximagri/pages/dealer/orders_list/dealer_orders_list_desktop_page.dart';
import 'package:maximagri/pages/dealer/orders_list/dealer_orders_list_mobile_page.dart';
import 'package:maximagri/pages/dealer/orders_list/dealer_orders_list_tablet_page.dart';

import 'package:maximagri/pages/dealer/place_order/dealer_place_order_desktop_page.dart';
import 'package:maximagri/pages/dealer/place_order/dealer_place_order_mobile_page.dart';
import 'package:maximagri/pages/dealer/place_order/dealer_place_order_tablet_page.dart';

class DealerDrawer extends StatelessWidget {
  const DealerDrawer({Key? key}) : super(key: key);

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
                mobilePage: DealerDashboardMobilePage(),
                tabletPage: DealerDashboardTabletPage(),
                desktopPage: DealerDashboardDesktopPage(),
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
                mobilePage: DealerPlaceOrderMobilePage(),
                tabletPage: DealerPlaceOrderTabletPage(),
                desktopPage: DealerPlaceOrderDesktopPage(),
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
                mobilePage: DealerOrdersListMobilePage(),
                tabletPage: DealerOrdersListTabletPage(),
                desktopPage: DealerOrdersListDesktopPage(),
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
                  pageDrawer: DealerDrawer(),
                  pageNavigation: DealerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                tabletPage: ContactUsTabletPage(
                  pageDrawer: DealerDrawer(),
                  pageNavigation: DealerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                desktopPage: ContactUsDesktopPage(pageDrawer: DealerDrawer()),
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
                  pageDrawer: DealerDrawer(),
                  pageNavigation: DealerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                tabletPage: AboutUsTabletPage(
                  pageDrawer: DealerDrawer(),
                  pageNavigation: DealerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                desktopPage: AboutUsDesktopPage(pageDrawer: DealerDrawer()),
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
                  pageDrawer: DealerDrawer(),
                  pageNavigation: DealerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                tabletPage: TermsAndConditionsTabletPage(
                  pageDrawer: DealerDrawer(),
                  pageNavigation: DealerNavigation(
                    selectedIndex: 3,
                  ),
                ),
                desktopPage:
                    TermsAndConditionsDesktopPage(pageDrawer: DealerDrawer()),
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
