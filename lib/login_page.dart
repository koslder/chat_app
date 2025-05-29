import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(userPasswordController.text);

      await context.read<AuthService>().loginUser(userNameController.text);
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: userNameController.text);
      print('login succesfull!');
    } else {
      print('not succesfull!');
    }
  }

  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  final _mainUrl =
      "https://www.roblox.com/share?code=eccc85be8ada934984a7d3dbf108f368&type=Server";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              verticalSpacing(24),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: const AssetImage('assets/illustration.png')),
                    borderRadius: BorderRadius.circular(56)),
              ),
              verticalSpacing(24),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginTextField(
                      hinText: "Enter your username",
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Your username should be more 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your username";
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      hasAsterisks: true,
                      hinText: 'Type your password',
                      controller: userPasswordController,
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              ElevatedButton(
                  onPressed: () async {
                    await loginUser(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  )),
              GestureDetector(
                onDoubleTap: () {
                  print('double tapped!');
                },
                onLongPress: () {
                  print('onLongpress');
                },
                onTap: () async {
                  print('Link Clicked');
                  if (!await launch(_mainUrl)) {
                    throw 'Could not launch this!';
                  }
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text(_mainUrl),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.twitter(
                    size: 20,
                    color: Colors.blue,
                    url: "twitter.com",
                  ),
                  SocialMediaButton.linkedin(
                    size: 20,
                    color: Colors.blue,
                    url: "linkedin.com",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
