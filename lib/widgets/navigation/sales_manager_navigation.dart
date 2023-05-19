import 'package:flutter/material.dart';
import 'package:maximagri/pages/sales_manager/sales_officer_list/sales_manager_sales_officer_list_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/sales_officer_list/sales_manager_sales_officer_list_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/sales_officer_list/sales_manager_sales_officer_list_tablet_page.dart';
import 'package:maximagri/utilities/responsiveness.dart';

import 'package:maximagri/pages/sales_manager/dealers_list/sales_manager_dealers_list_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/dealers_list/sales_manager_dealers_list_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/dealers_list/sales_manager_dealers_list_tablet_page.dart';

import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/dashboard/sales_manager_dashboard_tablet_page.dart';

import 'package:maximagri/pages/sales_manager/orders_list/sales_manager_orders_list_desktop_page.dart';
import 'package:maximagri/pages/sales_manager/orders_list/sales_manager_orders_list_mobile_page.dart';
import 'package:maximagri/pages/sales_manager/orders_list/sales_manager_orders_list_tablet_page.dart';

class SalesManagerNavigation extends StatelessWidget {
  final int selectedIndex;
  const SalesManagerNavigation({Key? key, required this.selectedIndex})
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
                mobilePage: SalesManagerDashboardMobilePage(),
                tabletPage: SalesManagerDashboardTabletPage(),
                desktopPage: SalesManagerDashboardDesktopPage(),
              ),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: SalesManagerSalesOfficerListMobilePage(),
                tabletPage: SalesManagerSalesOfficerListTabletPage(),
                desktopPage: SalesManagerSalesOfficerListDesktopPage(),
              ),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: SalesManagerOrdersListMobilePage(),
                tabletPage: SalesManagerOrdersListTabletPage(),
                desktopPage: SalesManagerOrdersListDesktopPage(),
              ),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: SalesManagerDealersListMobilePage(),
                tabletPage: SalesManagerDealersListTabletPage(),
                desktopPage: SalesManagerDealersListDesktopPage(),
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
          icon: Icon(Icons.support_agent),
          label: 'SALES OFFICER',
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
