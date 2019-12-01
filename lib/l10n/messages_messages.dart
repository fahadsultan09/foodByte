// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "a_account" : MessageLookupByLibrary.simpleMessage("Already have an account?"),
    "account" : MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "cart" : MessageLookupByLibrary.simpleMessage("Your Food Cart"),
    "cart_total" : MessageLookupByLibrary.simpleMessage("Cart Total"),
    "category" : MessageLookupByLibrary.simpleMessage("Category"),
    "checkout" : MessageLookupByLibrary.simpleMessage("Proceed To Checkout"),
    "confirm_password" : MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "consumer" : MessageLookupByLibrary.simpleMessage("Consumer"),
    "discount" : MessageLookupByLibrary.simpleMessage("Discount"),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "food_item" : MessageLookupByLibrary.simpleMessage("Food Items"),
    "forgotPassword" : MessageLookupByLibrary.simpleMessage("Forgotten Password?"),
    "heading" : MessageLookupByLibrary.simpleMessage("Trending Restaurants"),
    "order" : MessageLookupByLibrary.simpleMessage("Food Order"),
    "order_detail" : MessageLookupByLibrary.simpleMessage("Your Order will arrive at 40 minutes"),
    "orders" : MessageLookupByLibrary.simpleMessage("Orders"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "scratchCard" : MessageLookupByLibrary.simpleMessage("Get A ScratchCard"),
    "seeAll" : MessageLookupByLibrary.simpleMessage("see All"),
    "signin" : MessageLookupByLibrary.simpleMessage("Sign In"),
    "signout" : MessageLookupByLibrary.simpleMessage("Signout"),
    "signup" : MessageLookupByLibrary.simpleMessage("Sign up"),
    "subtotal" : MessageLookupByLibrary.simpleMessage("Subtotal"),
    "username" : MessageLookupByLibrary.simpleMessage("Your email or username"),
    "wallet" : MessageLookupByLibrary.simpleMessage("Wallet"),
    "wallet_contain" : MessageLookupByLibrary.simpleMessage("Your wallet contains"),
    "won" : MessageLookupByLibrary.simpleMessage("You have won a scratch card")
  };
}
