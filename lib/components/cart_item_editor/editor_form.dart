import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/models/models.dart';
import 'input_on_change_callback.dart';

class CartItemEditor extends StatelessWidget {
  final CartItem _cartItem;
  final String _saveButtonText;
  final VoidCallback _onSave;

  CartItemEditor({
    Key key,
    CartItem cartItem,
    String saveButtonText,
    VoidCallback onSave,
  })  : _cartItem = cartItem,
        _saveButtonText = saveButtonText,
        _onSave = onSave,
        super(key: key);

  Widget _input({Widget field}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      child: field,
    );
  }

  Widget _numberInput({
    String label,
    bool decimal = false,
    InputOnChangeCallback onChange,
  }) {
    return _input(
      field: TextField(
        style: const TextStyle(fontSize: 18),
        keyboardType: TextInputType.numberWithOptions(decimal: decimal),
        decoration: InputDecoration(labelText: label),
        onChanged: (value) => onChange(value),
      ),
    );
  }

  Widget _textInput({
    String label,
    InputOnChangeCallback onChange,
  }) {
    return _input(
      field: TextField(
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(labelText: label),
        onChanged: (value) => onChange(value),
      ),
    );
  }

  Widget build(BuildContext buildContext) {
    return Form(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        child: ListView(
          children: [
            _textInput(
              label: 'Item Name',
              onChange: (value) {
                _cartItem.name = value;
              },
            ),
            _numberInput(
              label: 'Item Price',
              decimal: true,
              onChange: (value) {
                _cartItem.price = double.parse(value);
              },
            ),
            _numberInput(
              label: 'Item Quantity',
              onChange: (value) {
                _cartItem.quantity = int.parse(value);
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: _onSave,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(12),
                  ),
                ),
                child: Text(
                  _saveButtonText,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
