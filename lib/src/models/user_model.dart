class UserModel {
  String _name;
  String _pass;
  UserModel data(name, pass) {
    UserModel user = new UserModel();
    user._name = name;
    user._pass = pass;
    return user;
  }

  String get name => _name;
  String get pass => _pass;
}