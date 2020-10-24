import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CustomAppBar extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return AppBar(
      title: StoreConnector<StoreState, String>(
        converter: (store) => store.state.appName,
        builder: (context, appName) => Text(appName),
      )
    );
  }
}