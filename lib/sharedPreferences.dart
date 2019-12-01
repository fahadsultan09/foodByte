
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setWalletAmount(int amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('wallet', amount);
}

Future<int> getWalletAmount()async{
 SharedPreferences prefs = await SharedPreferences.getInstance();

 return prefs.getInt('wallet');
}

Future<void> setlastScratch(String time)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('time', time.toString());
}

Future<String> getlastScratch()async{
 SharedPreferences prefs = await SharedPreferences.getInstance();

 return prefs.getString('time');
}