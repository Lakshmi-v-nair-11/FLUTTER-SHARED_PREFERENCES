import 'package:flutter/material.dart';
import 'package:sample_login/main.dart';
import 'package:sample_login/screens/home.dart';
import 'package:sample_login/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    CheckUserLogin();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images.png'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const ScreenLogin()),
    );
  }

  Future<void> CheckUserLogin() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedin = _sharedPrefs.getBool(SaveKeyname);
    if (_userLoggedin == null || _userLoggedin == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return ScreenHome();
      }));
    }
  }
}
