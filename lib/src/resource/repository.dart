import 'dart:async';
import 'package:marketplace_app/src/models/user_model.dart';

import 'products_api_provider.dart';
import '../models/item_model.dart';
import 'sharedpreference_provider.dart';

class Repository {
  final productsApiProvider = ProductsApiProvider();
  final sharedPreferenceProvider = SharePreferenceProvider();
  Future<ItemModel> fetchProducts() => productsApiProvider.fetchProductsList();
  Future<UserModel> fetchUser() => sharedPreferenceProvider.fetchUser();
  SaveUser(user) =>sharedPreferenceProvider.addStringToSF( user.name, user.pass);

}