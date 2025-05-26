import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print('button clicked');
      }),
      // body:
      body: Column(
        children: [
          Text(
            'Let\'s sign you in!',
            style: TextStyle(
                fontSize: 30,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
          Text(
            'Welcome Back! \n You\'ve been missed!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blueGrey),
          ),
          Image.network(
            'https://3809789.youcanlearnit.net/Alien_LIL131358.png',
            height: 200,
          ),
          Container(
            height: 150,
            width: 150,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                  'https://3809789.youcanlearnit.net/Alien_LIL131358.png',
                ),
              ),
              color: Colors.blue,
              borderRadius: BorderRadius.circular(24),
            ),
          )
        ],
      ),
    );
  }
}
