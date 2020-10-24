import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key key}) : super(key: key);

  final Widget title = StoreConnector<StoreState, String>(
    converter: (store) => store.state.appName,
    builder: (context, appName) => Text(appName),
  );
}
