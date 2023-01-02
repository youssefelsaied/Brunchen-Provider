import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The live_longer btn
  ///
  /// In en, this message translates to:
  /// **'Live longer \nwith healthy food '**
  String get live_longer;

  /// The lorem txt
  ///
  /// In en, this message translates to:
  /// **''**
  String get lorem;

  /// The choose_language txt
  ///
  /// In en, this message translates to:
  /// **'Choose your Language '**
  String get choose_language;

  /// The don't_have_account btn
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dont_have_account;

  /// The Take a tour btn
  ///
  /// In en, this message translates to:
  /// **'Take a tour'**
  String get take_a_tour;

  /// The login btn
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// The welcome_back txt
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcome_back;

  /// The first_name txt
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// The last_name txt
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// The password txt
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// The i_forget_my_password btn
  ///
  /// In en, this message translates to:
  /// **'I forget my password'**
  String get i_forget_my_password;

  /// The or btn
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// The email txt
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get phone;

  /// The Verify txt
  ///
  /// In en, this message translates to:
  /// **'Verify Password'**
  String get re_password;

  /// The sign_up txt
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account ?'**
  String get already_have_account;

  /// No description provided for @add_other_location.
  ///
  /// In en, this message translates to:
  /// **'New Location'**
  String get add_other_location;

  /// No description provided for @address_name.
  ///
  /// In en, this message translates to:
  /// **'Place name'**
  String get address_name;

  /// No description provided for @address_details.
  ///
  /// In en, this message translates to:
  /// **'Address details'**
  String get address_details;

  /// No description provided for @building.
  ///
  /// In en, this message translates to:
  /// **'Building'**
  String get building;

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get floor;

  /// No description provided for @more_details.
  ///
  /// In en, this message translates to:
  /// **'More Details'**
  String get more_details;

  /// No description provided for @select_your_location.
  ///
  /// In en, this message translates to:
  /// **'Select your location'**
  String get select_your_location;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @all_new_orders.
  ///
  /// In en, this message translates to:
  /// **'All Orders'**
  String get all_new_orders;

  /// No description provided for @in_progress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get in_progress;

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get ready;

  /// No description provided for @on_the_way.
  ///
  /// In en, this message translates to:
  /// **'ON THE WAY'**
  String get on_the_way;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get canceled;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selected_language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get selected_language;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @profile_picture.
  ///
  /// In en, this message translates to:
  /// **'Profile Picture'**
  String get profile_picture;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @e_mail.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get e_mail;

  /// No description provided for @order_summary.
  ///
  /// In en, this message translates to:
  /// **'Order summary'**
  String get order_summary;

  /// No description provided for @order_id.
  ///
  /// In en, this message translates to:
  /// **'Order id'**
  String get order_id;

  /// No description provided for @delivery_address.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get delivery_address;

  /// No description provided for @customer_area.
  ///
  /// In en, this message translates to:
  /// **'Customer area'**
  String get customer_area;

  /// No description provided for @order_status.
  ///
  /// In en, this message translates to:
  /// **'Order status'**
  String get order_status;

  /// No description provided for @customer_info.
  ///
  /// In en, this message translates to:
  /// **'Customer info'**
  String get customer_info;

  /// No description provided for @customer_name.
  ///
  /// In en, this message translates to:
  /// **'Customer name'**
  String get customer_name;

  /// No description provided for @customer_number.
  ///
  /// In en, this message translates to:
  /// **'Customer number'**
  String get customer_number;

  /// No description provided for @order_info.
  ///
  /// In en, this message translates to:
  /// **'Order info'**
  String get order_info;

  /// No description provided for @meal_details.
  ///
  /// In en, this message translates to:
  /// **'Meal details'**
  String get meal_details;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @less_details.
  ///
  /// In en, this message translates to:
  /// **'Less details'**
  String get less_details;

  /// No description provided for @logout_text.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to Logout ?'**
  String get logout_text;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @wrong_auth.
  ///
  /// In en, this message translates to:
  /// **'User name or Password is incorrect'**
  String get wrong_auth;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @delivery_time.
  ///
  /// In en, this message translates to:
  /// **'Delivery Time'**
  String get delivery_time;

  /// No description provided for @delivery_details.
  ///
  /// In en, this message translates to:
  /// **'Delivery Details'**
  String get delivery_details;

  /// No description provided for @order_history.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get order_history;

  /// No description provided for @no_orders.
  ///
  /// In en, this message translates to:
  /// **'No Orders yet'**
  String get no_orders;

  /// No description provided for @no_delivery.
  ///
  /// In en, this message translates to:
  /// **'No Delivery is assigned to this order yet'**
  String get no_delivery;

  /// No description provided for @change_statues.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to change the order status ?'**
  String get change_statues;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
