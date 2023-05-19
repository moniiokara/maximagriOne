import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/home_page_option.dart';

import 'package:maximagri/pages/operations/create_account/operations_create_account_desktop_page.dart';
import 'package:maximagri/pages/operations/create_account/operations_create_account_mobile_page.dart';
import 'package:maximagri/pages/operations/create_account/operations_create_account_tablet_page.dart';

import 'package:maximagri/utilities/responsiveness.dart';
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

import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_desktop_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_tablet_page.dart';
import 'package:maximagri/pages/terms_conditions/terms_conditions/terms_conditions_mobile_page.dart';

import 'package:maximagri/pages/contact/contact_us/contact_us_mobile_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_tablet_page.dart';
import 'package:maximagri/pages/contact/contact_us/contact_us_desktop_page.dart';

import 'package:maximagri/pages/about/about_us/about_us_desktop_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_mobile_page.dart';
import 'package:maximagri/pages/about/about_us/about_us_tablet_page.dart';

class OperationsDashboardDesktopPage extends StatefulWidget {
  const OperationsDashboardDesktopPage({Key? key}) : super(key: key);

  @override
  State<OperationsDashboardDesktopPage> createState() =>
      _OperationsDashboardDesktopPageState();
}

class _OperationsDashboardDesktopPageState
    extends State<OperationsDashboardDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsDashboardDesktopPage'),
      ),
      body: Row(
        children: [
          const OperationsDrawer(),
          Expanded(

            child: SingleChildScrollView(

              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.person_add_alt_1),
                          pageTitle: 'CREATE ACCOUNT',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                      ),
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.credit_score),
                          pageTitle: 'CREDIT CENTER',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.people),
                          pageTitle: 'ZONAL MANAGERS',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                      ),
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.people),
                          pageTitle: 'SALES MANAGERS',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.people),
                          pageTitle: 'SALES OFFICERS',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                      ),
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.people),
                          pageTitle: 'DEALERS LIST',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.view_list),
                          pageTitle: 'ORDERS LIST',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                      ),
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.support_agent),
                          pageTitle: 'CONTACT US',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                                desktopPage: ContactUsDesktopPage(
                                    pageDrawer: OperationsDrawer()),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(

                        child: HomePageOption(
                          pageIcon: const Icon(Icons.corporate_fare),
                          pageTitle: 'ABOUT US',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                                desktopPage: AboutUsDesktopPage(
                                    pageDrawer: OperationsDrawer()),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: HomePageOption(
                          pageIcon: const Icon(Icons.checklist_outlined),
                          pageTitle: 'TERMS & CONDITIONS',
                          pageSubtitle: 'pageSubtitle',
                          pageRoute: () => Navigator.push(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
