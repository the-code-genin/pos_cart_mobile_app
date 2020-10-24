import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddNewButton extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return StoreConnector<StoreState, VoidCallback>(
        converter: (store) {
          return () {
            store.dispatch(
                StoreStateReducer(action: StoreStateReducerAction.addCartItem));
          };
        },
        builder: (buildContext, callback) => RaisedButton(
              child: Text(
                'Add Item',
                textScaleFactor: 1.5,
              ),
              onPressed: () => callback(),
            ));
  }
}
