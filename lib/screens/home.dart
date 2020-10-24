import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/components/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: HomeBody(),
        bottomSheet: HomeBottomSheet(),
      );
  }
}
