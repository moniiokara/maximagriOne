import 'package:flutter/material.dart';

import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/widgets/drawer/dealer_drawer.dart';

import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_desktop_page.dart';
import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_mobile_page.dart';
import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_tablet_page.dart';

import 'package:maximagri/pages/dealer/orders_list/dealer_orders_list_desktop_page.dart';
import 'package:maximagri/pages/dealer/orders_list/dealer_orders_list_mobile_page.dart';
import 'package:maximagri/pages/dealer/orders_list/dealer_orders_list_tablet_page.dart';

import 'package:maximagri/pages/dealer/place_order/dealer_place_order_desktop_page.dart';
import 'package:maximagri/pages/dealer/place_order/dealer_place_order_mobile_page.dart';
import 'package:maximagri/pages/dealer/place_order/dealer_place_order_tablet_page.dart';

import 'package:maximagri/pages/contact/contact_us/contact_us_mobile_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_tablet_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_desktop_page.dart';

class DealerNavigation extends StatelessWidget {
  final int selectedIndex;
  const DealerNavigation({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: DealerDashboardMobilePage(),
                tabletPage: DealerDashboardTabletPage(),
                desktopPage: DealerDashboardDesktopPage(),
              ),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: DealerPlaceOrderMobilePage(),
                tabletPage: DealerPlaceOrderTabletPage(),
                desktopPage: DealerPlaceOrderDesktopPage(),
              ),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: DealerOrdersListMobilePage(),
                tabletPage: DealerOrdersListTabletPage(),
                desktopPage: DealerOrdersListDesktopPage(),
              ),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
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
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.store,
          ),
          label: 'DASHBOARD',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart),
          label: 'PLACE ORDER',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          label: 'ORDERS LIST',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'CONTACT US',
        ),
      ],
    );
  }
}
