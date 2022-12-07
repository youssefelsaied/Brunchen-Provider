import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/providers/auth.dart';
import 'package:delivery_app/screens/app_drawer.dart';
import 'package:delivery_app/screens/orders_screen.dart';
import 'package:delivery_app/screens/restaurant_orders_screen.dart';
import 'package:delivery_app/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../widgets/order_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: true);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: AppDrawer(height),
      body: Container(
        height: height,
        // color: Colors.red,
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // shrinkWrap: true,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Container(
              height: height * .08,
              width: width,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: width * .001),
                leading: TextButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: SvgPicture.asset(
                    "assets/images/menu.svg",
                  ),
                ),
                title: Center(
                  child: AutoSizeText(
                    AppLocalizations.of(context)!.home,
                    style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                  ),
                ),
                trailing: SizedBox(
                  width: width * .18,
                ),
              ),
            ),
            Container(
              height:
                  height - MediaQuery.of(context).padding.top - height * .08,
              child: RefreshIndicator(
                onRefresh: () async {
                  await auth.fetchTodayOrders();
                },
                color: Theme.of(context).primaryColor,
                backgroundColor: Colors.white,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        order: auth.todayOrders[index],
                      );
                    },
                    itemCount: auth.todayOrders.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
