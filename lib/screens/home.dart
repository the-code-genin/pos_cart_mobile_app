import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildAppBar() {
    return AppBar(
      title: StoreConnector<StoreState, String>(
        converter: (store) => store.state.appName,
        builder: (context, appName) => Text(appName),
      )
    );
  }

  Widget _buildBody() {
    return Center(child: Text('Hello world'));
  }

  Widget _buildFAB() {
    return StoreConnector<StoreState, VoidCallback>(
      converter: (store) {
        return () {
          store.dispatch(
            StoreStateReducer(action: StoreStateReducerAction.addCartItem)
          );
        };
      },
      builder: (buildContext, callback) => FloatingActionButton(
        tooltip: 'Add item',
        child: Icon(Icons.add),
        onPressed: () => callback(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFAB()
    );
  }
}
