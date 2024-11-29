import 'package:flutter/material.dart';
import 'package:your_app/presentation/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>  MyHomePage(
                  title: "The Prayr Time",
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffB39EDB),
        child: const Center(
          child: Image(
            image: AssetImage("assets/prayer-times.png"),
            height: 170,
            width: 170,
            color: Color(0xff502B69),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
