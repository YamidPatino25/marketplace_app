
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../models/user_model.dart';

import '../blocs/products_bloc.dart';
import '../blocs/login_bloc.dart';
import 'login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    productsBloc.fetchAllProducts();
    loginBloc.fetchUser();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Produts'),
        backgroundColor: Color(0xFF03a9f4),
        leading: GestureDetector(
            onTap: () { /* Write listener code here */ },
            child: Icon(
             Icons.menu,  // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {  Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),
                );},
                child: Icon(
                    Icons.account_circle
                ),
              )
          ),
        ],
      ),
      body: StreamBuilder(
        stream: loginBloc.user,
        builder: (context, AsyncSnapshot<UserModel> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.name);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

}