import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app_drawer.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LocaleProvider>(context, listen: true);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String selectedLanguage = AppLocalizations.of(context)!.selected_language ;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: AppDrawer(height),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height * .07,
                width: width,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: width * .001),
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
                      AppLocalizations.of(context)!.language,
                      style:
                          const TextStyle(fontSize: 20, fontFamily: "Poppins"),
                    ),
                  ),
                  trailing: SizedBox(
                    width: width * .18,
                  ),
                ),
              ),
              Container(
                height: height * .8,
                width: width,
                padding: EdgeInsets.symmetric(
                    horizontal: width * .05, vertical: height * .03),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          AppLocalizations.of(context)!.choose_language,
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                    Container(
                      width: width*.8,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffF0FCF8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: height * .005,horizontal: width * .03),
                      margin: EdgeInsets.symmetric(vertical: height * .01),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              child: AutoSizeText("English"),
                              value: "English",
                            ),
                            DropdownMenuItem(
                              child: AutoSizeText("عربي"),
                              value: "عربي",
                            )
                          ],
                          onChanged: (value){
                            if(value== "English"){
                              selectedLanguage = "English";
                              language.setLocale(const Locale('en'));
                            }else{
                              selectedLanguage = "عربي";
                              language.setLocale(const Locale('ar'));
                            }
                          },
                          value: selectedLanguage,
                          dropdownColor: const Color(0xffF0FCF8),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded,color: Color(0xff1B9352),),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Theme.of(context).canvasColor),
                          underline: null,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
