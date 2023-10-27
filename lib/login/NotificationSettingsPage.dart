import 'package:flutter/material.dart';
import 'package:myapp/views/home_page.dart';

class NotificationLogin extends StatefulWidget {
  const NotificationLogin({super.key});

  @override
  State<NotificationLogin> createState() => _NotificationLoginState();
}

class _NotificationLoginState extends State<NotificationLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/Notification-Icon.png',
              scale: 2,
            ),
          ),
          Text(
            'No Notification Yet',
            style: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Simply browes,create a wishlist or make a Purchase',
            style: TextStyle(
                color: Color.fromARGB(255, 77, 76, 76),
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
              color: Colors.purple,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Continue Shopping',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
