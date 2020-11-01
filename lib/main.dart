import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pos_cart_mobile_app/screens/screens.dart';

// App constants
const appName = 'POS Cart';

// Initialize app
void main() {
  StoreState storeState = StoreState(appName: appName);
  Store store = Store<StoreState>(StoreReducer(), initialState: storeState);
  runApp(MyApp(store: store));
}

// App
class MyApp extends StatelessWidget {
  final Store<StoreState> store;

  MyApp({Key key, this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: store.state.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/add-new-cart-item': (context) => AddNewCartItemScreen(),
          '/edit-cart-item': (context) => EditCartItemScreen(),
        },
      ),
    );
  }
}
