import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void loginUser() {
    print('login succesfull');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              Text(
                'Welcome Back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              Image.network(
                'https://3809789.youcanlearnit.net/Alien_LIL131358.png',
                height: 200,
              ),
              ElevatedButton(
                  onPressed: loginUser,
                  child: Text(
                    'Click me!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  )),
              GestureDetector(
                onDoubleTap: () {
                  print('double tapped!');
                },
                onLongPress: () {
                  print('onLongpress');
                },
                onTap: () {
                  print('Link Clicked');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('https://poojabhaumik.com'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
