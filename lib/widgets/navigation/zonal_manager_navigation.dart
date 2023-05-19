import 'package:flutter/material.dart';
import 'package:maximagri/utilities/responsiveness.dart';

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

class ZonalManagerNavigation extends StatelessWidget {
  final int selectedIndex;
  const ZonalManagerNavigation({Key? key, required this.selectedIndex})
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
                mobilePage: ZonalManagerDashboardMobilePage(),
                tabletPage: ZonalManagerDashboardTabletPage(),
                desktopPage: ZonalManagerDashboardDesktopPage(),
              ),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerSalesManagerListMobilePage(),
                tabletPage: ZonalManagerSalesManagerListTabletPage(),
                desktopPage: ZonalManagerSalesManagerListDesktopPage(),
              ),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerOrdersListMobilePage(),
                tabletPage: ZonalManagerOrdersListTabletPage(),
                desktopPage: ZonalManagerOrdersListDesktopPage(),
              ),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: ZonalManagerDealersListMobilePage(),
                tabletPage: ZonalManagerDealersListTabletPage(),
                desktopPage: ZonalManagerDealersListDesktopPage(),
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
