import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pos_cart_mobile_app/components/components.dart';

class HomeBottomSheet extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: StoreConnector<StoreState, double>(
              converter: (store) => store.state.getCartItemsTotal(),
              builder: (buildContext, total) {
                return Text('Total: N$total', textScaleFactor: 1.75);
              },
            ),
          ),
          HomeAddNewButton(),
        ],
      ),
    );
  }
}
