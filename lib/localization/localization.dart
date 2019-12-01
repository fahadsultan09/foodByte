import 'package:foodbyte/screens/scratchCard.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:foodbyte/l10n/messages_all.dart';

import 'dart:async';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  // String get title {
  //   return Intl.message(
  //     'Weather Application',
  //     name: 'title',
  //     desc: 'Title for the Weather Application',
  //   );
  // }

  String get heading {
    return Intl.message(
      'Trending Restaurants',
      name: 'heading',
      desc: 'top button on page',
    );
  }

  String get seeAll {
    return Intl.message(
      'see All',
      name: 'seeAll',
      desc: 'top button on page',
    );
  }

  String get category {
    return Intl.message('Category', name: 'category');
  }

  String get won {
    return Intl.message('You have won a scratch card',
        name: 'won', desc: 'won');
  }

  String get wallet {
    return Intl.message('Wallet', name: 'wallet', desc: '');
  }

  String get signout {
    return Intl.message('Signout', name: 'signout');
  }
  String get cancel{
        return Intl.message('Cancel', name: 'cancel');

  }

  String get wallet_contain {
    return Intl.message('Your wallet contains',
        name: 'wallet_contain', desc: '');
  }

  String get scratchCard {
    return Intl.message('Get A ScratchCard', name: 'scratchCard', desc: '');
  }

  String get username {
    return Intl.message('Your email or username', name: 'username', desc: '');
  }

  String get password {
    return Intl.message('Password', name: 'password', desc: '');
  }

  String get signin {
    return Intl.message('Sign In', name: 'signin', desc: '');
  }

  String get forgotPassword {
    return Intl.message('Forgotten Password?',
        name: 'forgotPassword', desc: '');
  }

  String get account {
    return Intl.message('Don\'t have an account?', name: 'account', desc: '');
  }

  String get signup {
    return Intl.message('Sign up', name: 'signup', desc: '');
  }

  String get email {
    return Intl.message('Email', name: 'email', desc: '');
  }

  String get confirm_password {
    return Intl.message('Confirm Password', name: 'confirm_password', desc: '');
  }

  String get a_account {
    return Intl.message('Already have an account?', name: 'a_account');
  }

  String get order {
    return Intl.message('Food Order', name: 'order');
  }

  String get order_detail {
    return Intl.message('Your Order will arrive at 40 minutes',
        name: 'order_detail');
  }

  String get cart {
    return Intl.message('Your Food Cart', name: 'cart');
  }

  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal');
  }

  String get discount {
    return Intl.message('Discount', name: 'discount');
  }

  String get cart_total {
    return Intl.message('Cart Total', name: 'cart_total');
  }

  String get checkout {
    return Intl.message('Proceed To Checkout', name: 'checkout');
  }
  String get consumer{
    return Intl.message('Consumer',name:'consumer');
  }
  String get orders{
    return Intl.message('Orders',name: 'orders');
  }
  String get food_item{
    return Intl.message('Food Items',name: 'food_item');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ur'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) {
    return false;
  }
}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}
