import 'package:flutter/material.dart';
import 'package:maximagri/utilities/responsiveness.dart';

import 'package:maximagri/pages/operations/dealers_list/operations_dealers_list_desktop_page.dart';
import 'package:maximagri/pages/operations/dealers_list/operations_dealers_list_mobile_page.dart';
import 'package:maximagri/pages/operations/dealers_list/operations_dealers_list_tablet_page.dart';

import 'package:maximagri/pages/operations/orders_list/operations_orders_list_desktop_page.dart';
import 'package:maximagri/pages/operations/orders_list/operations_orders_list_mobile_page.dart';
import 'package:maximagri/pages/operations/orders_list/operations_orders_list_tablet_page.dart';

import 'package:maximagri/pages/operations/zonal_manager_list/operations_zonal_manager_list_desktop_page.dart';
import 'package:maximagri/pages/operations/zonal_manager_list/operations_zonal_manager_list_mobile_page.dart';
import 'package:maximagri/pages/operations/zonal_manager_list/operations_zonal_manager_list_tablet_page.dart';

import 'package:maximagri/pages/operations/dashboard/operations_dashboard_desktop_page.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_mobile_page.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_tablet_page.dart';

class OperationsNavigation extends StatelessWidget {
  final int selectedIndex;
  const OperationsNavigation({Key? key, required this.selectedIndex})
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
                mobilePage: OperationsDashboardMobilePage(),
                tabletPage: OperationsDashboardTabletPage(),
                desktopPage: OperationsDashboardDesktopPage(),
              ),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: OperationsZonalManagerListMobilePage(),
                tabletPage: OperationsZonalManagerListTabletPage(),
                desktopPage: OperationsZonalManagerListDesktopPage(),
              ),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: OperationsOrdersListMobilePage(),
                tabletPage: OperationsOrdersListTabletPage(),
                desktopPage: OperationsOrdersListDesktopPage(),
              ),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: OperationsDealersListMobilePage(),
                tabletPage: OperationsDealersListTabletPage(),
                desktopPage: OperationsDealersListDesktopPage(),
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
          label: 'ZONAL MANAGERS',
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
