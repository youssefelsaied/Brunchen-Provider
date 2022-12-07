import 'package:flutter/material.dart';
import '../Wrappers/wrapper_home.dart';
import '../providers/auth.dart';
import '../screens/auth_screen.dart';
import '../screens/first_splash_screen.dart';
import 'package:provider/provider.dart';

class WrapperAuth extends StatefulWidget {
  static const routeName = '/wrapper_auth';

  @override
  _WrapperAuthState createState() => _WrapperAuthState();
}

class _WrapperAuthState extends State<WrapperAuth> {
  late Future<bool> isAuth;

  @override
  void initState() {
    super.initState();
    isAuth = _getAuth();
  }

  Future<bool> _getAuth() async {
    return await Provider.of<Auth>(context, listen: false).tryAutoLogin();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/images/logo2.png'), context);

  }
  @override
  Widget build(BuildContext context) {
    bool authenticated = Provider.of<Auth>(context, listen: true).isAuth;
    return
    FutureBuilder(
        future: isAuth,
        builder: (ctx, authSnapshot) {
          switch (authSnapshot.connectionState) {
            case ConnectionState.waiting:
              return FirstSplashScreen();
            case ConnectionState.done:
              return authenticated ? WrapperHome() : const AuthScreen();
            default:
              return const AuthScreen();
          }
        }
      // authsnapshot.connectionState==ConnectionState.waiting ? SplashScreen() : authsnapshot.data ? WrapperChooseCity():AuthScreen(),
    );
  }
}
