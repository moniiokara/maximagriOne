import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:maximagri/pages/operations/create_account/operations_create_account_desktop_page.dart';
import 'package:maximagri/pages/operations/create_account/operations_create_account_mobile_page.dart';
import 'package:maximagri/pages/operations/create_account/operations_create_account_tablet_page.dart';

import 'package:maximagri/utilities/responsiveness.dart';
import 'package:maximagri/utilities/user_authentication.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';

import 'package:maximagri/pages/operations/zonal_manager_list/operations_zonal_manager_list_desktop_page.dart';
import 'package:maximagri/pages/operations/zonal_manager_list/operations_zonal_manager_list_mobile_page.dart';
import 'package:maximagri/pages/operations/zonal_manager_list/operations_zonal_manager_list_tablet_page.dart';

import 'package:maximagri/pages/operations/credit_center/operations_credit_center_desktop_page.dart';
import 'package:maximagri/pages/operations/credit_center/operations_credit_center_mobile_page.dart';
import 'package:maximagri/pages/operations/credit_center/operations_credit_center_tablet_page.dart';

import 'package:maximagri/pages/operations/sales_manager_list/operations_sales_manager_list_desktop_page.dart';
import 'package:maximagri/pages/operations/sales_manager_list/operations_sales_manager_list_mobile_page.dart';
import 'package:maximagri/pages/operations/sales_manager_list/operations_sales_manager_list_tablet_page.dart';

import 'package:maximagri/pages/operations/sales_officer_list/operations_sales_officer_list_desktop_page.dart';
import 'package:maximagri/pages/operations/sales_officer_list/operations_sales_officer_list_mobile_page.dart';
import 'package:maximagri/pages/operations/sales_officer_list/operations_sales_officer_list_tablet_page.dart';

import 'package:maximagri/pages/operations/dealers_list/operations_dealers_list_desktop_page.dart';
import 'package:maximagri/pages/operations/dealers_list/operations_dealers_list_mobile_page.dart';
import 'package:maximagri/pages/operations/dealers_list/operations_dealers_list_tablet_page.dart';

import 'package:maximagri/pages/operations/orders_list/operations_orders_list_desktop_page.dart';
import 'package:maximagri/pages/operations/orders_list/operations_orders_list_mobile_page.dart';
import 'package:maximagri/pages/operations/orders_list/operations_orders_list_tablet_page.dart';

import 'package:maximagri/pages/operations/dashboard/operations_dashboard_desktop_page.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_mobile_page.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_tablet_page.dart';

import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_desktop_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_tablet_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_mobile_page.dart';

import 'package:maximagri/pages/contact/contact_us/contact_us_mobile_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_tablet_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_desktop_page.dart';

import 'package:maximagri/pages/about/about_us/about_us_desktop_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_mobile_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_tablet_page.dart';

class OperationsDrawer extends StatelessWidget {
  const OperationsDrawer({Key? key}) : super(key: key);

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
                mobilePage: OperationsDashboardMobilePage(),
                tabletPage: OperationsDashboardTabletPage(),
                desktopPage: OperationsDashboardDesktopPage(),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.person_add_alt_1,
            color: Colors.green,
          ),
          title: const Text(
            'CREATE ACCOUNT',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: OperationsCreateAccountMobilePage(),
                tabletPage: OperationsCreateAccountTabletPage(),
                desktopPage: OperationsCreateAccountDesktopPage(),
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
                mobilePage: OperationsCreditCenterMobilePage(),
                tabletPage: OperationsCreditCenterTabletPage(),
                desktopPage: OperationsCreditCenterDesktopPage(),
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
            'ZONAL MANAGERS',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Responsiveness(
                mobilePage: OperationsZonalManagerListMobilePage(),
                tabletPage: OperationsZonalManagerListTabletPage(),
                desktopPage: OperationsZonalManagerListDesktopPage(),
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
                mobilePage: OperationsSalesManagerListMobilePage(),
                tabletPage: OperationsSalesManagerListTabletPage(),
                desktopPage: OperationsSalesManagerListDesktopPage(),
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
                mobilePage: OperationsSalesOfficerListMobilePage(),
                tabletPage: OperationsSalesOfficerListTabletPage(),
                desktopPage: OperationsSalesOfficerListDesktopPage(),
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
                mobilePage: OperationsDealersListMobilePage(),
                tabletPage: OperationsDealersListTabletPage(),
                desktopPage: OperationsDealersListDesktopPage(),
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
                mobilePage: OperationsOrdersListMobilePage(),
                tabletPage: OperationsOrdersListTabletPage(),
                desktopPage: OperationsOrdersListDesktopPage(),
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
                  pageDrawer: OperationsDrawer(),
                  pageNavigation: OperationsNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: ContactUsTabletPage(
                  pageDrawer: OperationsDrawer(),
                  pageNavigation: OperationsNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage:
                    ContactUsDesktopPage(pageDrawer: OperationsDrawer()),
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
                  pageDrawer: OperationsDrawer(),
                  pageNavigation: OperationsNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: AboutUsTabletPage(
                  pageDrawer: OperationsDrawer(),
                  pageNavigation: OperationsNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage: AboutUsDesktopPage(pageDrawer: OperationsDrawer()),
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
                  pageDrawer: OperationsDrawer(),
                  pageNavigation: OperationsNavigation(
                    selectedIndex: 1,
                  ),
                ),
                tabletPage: TermsAndConditionsTabletPage(
                  pageDrawer: OperationsDrawer(),
                  pageNavigation: OperationsNavigation(
                    selectedIndex: 1,
                  ),
                ),
                desktopPage: TermsAndConditionsDesktopPage(
                    pageDrawer: OperationsDrawer()),
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
