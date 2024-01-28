import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:profile/constants.dart';
import 'package:profile/screens/home_screen.dart';
import 'package:profile/screens/log_in.dart';
import 'package:profile/screens/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
        'https://th.bing.com/th/id/OIP.4dcJ_AHTJ81dikKbJ_xBtgHaGw?rs=1&pid=ImgDetMain',
        height: 120,
        width: 120,
        fit: BoxFit.fill,
      ),
      logoWidth: 200,
      backgroundColor: Constants.thirdColor,
      loaderColor: Constants.primaryColor,
      loadingText: const Text("Loading..."),
      futureNavigator: getRoute(),
    );
  }
}

Future<Widget> getRoute() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  var pass = prefs.getString('pass');
  if (email != null && pass != null) {
    print('home');
    return const NavigationScreen(); // will be changed into HomeScreen after completion
  } else {
    print('sign');
    print(email);
    print(pass);
    return SignInScreen();
  }
}
