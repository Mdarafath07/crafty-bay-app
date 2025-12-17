import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  Locale _currentLocale = Locale("en");
  Locale get currentLocale => _currentLocale;
  void  changeLocale(Locale newLocale){
    if(_currentLocale == newLocale) return;
    _currentLocale = newLocale;
    _saveLocal(_currentLocale.languageCode);
    notifyListeners();
  }

  Future<void> _saveLocal(String locale) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("locale", locale);
  }
  Future<Locale> _getLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   String savedLocale = sharedPreferences.getString("locale") ?? "en";
   return Locale(savedLocale);
  }


}