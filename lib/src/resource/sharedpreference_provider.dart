
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marketplace_app/src/models/user_model.dart';
class SharePreferenceProvider{


  addStringToSF( name, pass) async {
    print(name);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('pass', pass);

  }

  Future<UserModel> fetchUser() async {

    UserModel user= new UserModel();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String _name = prefs.getString('name');
    String _pass = prefs.getString('pass');
    final response = await user.data(_name, _pass);
    return response;
  }

}