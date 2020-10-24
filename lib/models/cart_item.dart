class CartItem {
  String name;
  int _quantity;
  double _price;

  CartItem({this.name = '', quantity = 0, price = 0.0}) {
    this.quantity = quantity;
    this.price = price;
  }

  int get quantity => _quantity;
  set quantity(int value) => value >= 0 ? _quantity = value : _quantity = 0;

  double get price => _price;
  set price(double value) => value >= 0 ? _price = value : _price = 0;
}
