import 'package:delivery_app/providers/auth.dart';
import 'package:delivery_app/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Wrappers/wrapper_auth.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (ctx) => Auth(),
              ),
              // ChangeNotifierProvider(
              //   create: (ctx) => ScreensProvider(),
              // ),
              // ChangeNotifierProvider(
              //   create: (ctx) => MapProvider(),
              // ),
              // ChangeNotifierProvider(
              //   create: (ctx) => OrderProvider(),
              // ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: const Color(0xff3EDBAB),
                accentColor: const Color(0xff3DDAAA),
                canvasColor: const Color(0xff707070),
                buttonColor: const Color(0xff1A9151),
                backgroundColor: const Color(0xffFFFFFF),
                highlightColor: const Color(0xffFCFEFD),
                primarySwatch: Colors.blue,
              ),
              locale: provider.locale,
              supportedLocales: L10n.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: WrapperAuth(),
              routes: {
                WrapperAuth.routeName: (ctx) => WrapperAuth(),
              },
// WrapperFirstTime(),
            ),
          );
        },
      );
}
