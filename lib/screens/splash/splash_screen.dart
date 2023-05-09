import 'dart:async';

import 'package:flutter/material.dart';
import 'package:powermax/models/models.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), ()=> Navigator.pushNamed(context, "/"));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Center(
            child: Image(
              image: AssetImage('assets/images/dxb_coder_logo.jpg'),
              height: 125,
              width: 125,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child:  Text("DXB CODER", style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
