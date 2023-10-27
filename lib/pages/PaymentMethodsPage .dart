import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  List<String> paymentMethods = [
    'Visa **** **** 1234',
    'MasterCard **** **** 5678'
  ];

  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Your Payment Methods',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(paymentMethods[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Implement code to delete payment method
                        setState(() {
                          paymentMethods.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement code to add a new payment method
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Payment Method'),
                      content: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter your payment method',
                        ),
                        onChanged: (value) {
                          // Implement logic to update the payment method
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Save'),
                          onPressed: () {
                            // Implement logic to save the payment method
                            setState(() {
                              paymentMethods.add('New Payment Method: $value');
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Add Payment Method'),
            ),
          ],
        ),
      ),
    );
  }
}
