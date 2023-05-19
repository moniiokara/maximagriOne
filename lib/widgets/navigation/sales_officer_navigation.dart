import 'package:flutter/material.dart';
import 'package:maximagri/utilities/responsiveness.dart';

import 'package:maximagri/pages/sales_officer/dealers_list/sales_officer_dealers_list_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/dealers_list/sales_officer_dealers_list_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/dealers_list/sales_officer_dealers_list_tablet_page.dart';

import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/dashboard/sales_officer_dashboard_tablet_page.dart';

import 'package:maximagri/pages/sales_officer/place_order/sales_officer_place_order_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/place_order/sales_officer_place_order_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/place_order/sales_officer_place_order_tablet_page.dart';

import 'package:maximagri/pages/sales_officer/orders_list/sales_officer_orders_list_desktop_page.dart';
import 'package:maximagri/pages/sales_officer/orders_list/sales_officer_orders_list_mobile_page.dart';
import 'package:maximagri/pages/sales_officer/orders_list/sales_officer_orders_list_tablet_page.dart';

class SalesOfficerNavigation extends StatelessWidget {
  final int selectedIndex;
  const SalesOfficerNavigation({Key? key, required this.selectedIndex})
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
                mobilePage: SalesOfficerDashboardMobilePage(),
                tabletPage: SalesOfficerDashboardTabletPage(),
                desktopPage: SalesOfficerDashboardDesktopPage(),
              ),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: SalesOfficerPlaceOrderMobilePage(),
                tabletPage: SalesOfficerPlaceOrderTabletPage(),
                desktopPage: SalesOfficerPlaceOrderDesktopPage(),
              ),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: SalesOfficerOrdersListMobilePage(),
                tabletPage: SalesOfficerOrdersListTabletPage(),
                desktopPage: SalesOfficerOrdersListDesktopPage(),
              ),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: SalesOfficerDealersListMobilePage(),
                tabletPage: SalesOfficerDealersListTabletPage(),
                desktopPage: SalesOfficerDealersListDesktopPage(),
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
          icon: Icon(Icons.people),
          label: 'DEALERS LIST',
        ),
      ],
    );
  }
}
