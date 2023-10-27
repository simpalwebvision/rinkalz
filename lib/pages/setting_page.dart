import 'package:flutter/material.dart';

class ShippingAddressForm extends StatefulWidget {
  @override
  _ShippingAddressFormState createState() => _ShippingAddressFormState();
}

class _ShippingAddressFormState extends State<ShippingAddressForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _fullName = '';
  String _streetAddress = '';
  String _city = '';
  String _state = '';
  String _zipCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping Address Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fullName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Street Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your street address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _streetAddress = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
                onSaved: (value) {
                  _city = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'State'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your state';
                  }
                  return null;
                },
                onSaved: (value) {
                  _state = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ZIP Code'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your ZIP code';
                  }
                  return null;
                },
                onSaved: (value) {
                  _zipCode = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // You can now use the captured address data for further processing.
                    print('Full Name: $_fullName');
                    print('Street Address: $_streetAddress');
                    print('City: $_city');
                    print('State: $_state');
                    print('ZIP Code: $_zipCode');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
