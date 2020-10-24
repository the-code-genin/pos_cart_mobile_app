import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key key}) : super(key: key);

  @override
  final Widget title = StoreConnector<StoreState, String>(
    converter: (store) => store.state.appName,
    builder: (context, appName) => Text(appName),
  );

  @override
  final List<Widget> actions = [
    StoreConnector<StoreState, VoidCallback>(
      converter: (store) {
        return () {
          store.dispatch(StoreStateReducer(
            action: StoreStateReducerAction.clearCartItem
          ));
        };
      },
      builder: (buildContext, callback) {
        return GestureDetector(
          onTap: () => callback(),
          child: Container(
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Clear',
              textScaleFactor: 1.25
            )
          )
        );
      }
    )
  ];
}
