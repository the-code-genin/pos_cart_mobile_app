import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StoreConnector<StoreState, String>(
          converter: (store) => store.state.appName,
          builder: (context, appName) => Text(appName),
        )
      ),
      body: Center(
        child: Text('Hello world')
      ),
    );
  }
}
