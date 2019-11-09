
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setWalletAmount(int amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('wallet', amount);
}

Future<int> getWalletAmount()async{
 SharedPreferences prefs = await SharedPreferences.getInstance();

 return prefs.getInt('wallet');
}