import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/main_screen.dart';
import '../screens/auth_screen.dart';
import '../screens/first_splash_screen.dart';

class WrapperHome extends StatefulWidget {
  static const routeName = '/wrapper_home';

  @override
  _WrapperHomeState createState() => _WrapperHomeState();
}

class _WrapperHomeState extends State<WrapperHome> {
  late Future<void> hasData;

  @override
  void initState() {
    super.initState();
    hasData = _getData();
  }

  Future _getData() async {
    final auth = Provider.of<Auth>(context, listen: false);
    // final order = Provider.of<OrderProvider>(context, listen: false);
    var getOrders = auth.fetchTodayOrders();
    var getPastOrders = auth.fetchPastOrders();
    // var getAddresses = auth.getAddresses();
    try {
      List responses = await Future.wait([
        getOrders,
        getPastOrders
        // getAddresses,
      ]);
      return responses;
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    // bool authenticated = Provider.of<Auth>(context, listen: false).isAuth;
    return
        // authenticated
        //   ? WrapperChooseCity()
        //   :
        FutureBuilder(
            future: hasData,
            builder: (ctx, authSnapshot) {
              switch (authSnapshot.connectionState) {
                case ConnectionState.waiting:
                  return FirstSplashScreen();
                case ConnectionState.done:
                  return const MainScreen();
                default:
                  return const AuthScreen();
              }
            }
            // authsnapshot.connectionState==ConnectionState.waiting ? SplashScreen() : authsnapshot.data ? WrapperChooseCity():AuthScreen(),
            );
  }
}
