import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pos_cart_mobile_app/components/components.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildBody() {
    return Center(child: Text('Hello world'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: _buildBody(),
        floatingActionButton: FAB()
      );
  }
}
