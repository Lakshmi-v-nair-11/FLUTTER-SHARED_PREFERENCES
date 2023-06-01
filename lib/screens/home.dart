import 'package:flutter/material.dart';
import 'package:sample_login/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          actions: [
            IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(
                Icons.exit_to_app,
              ),
            )
          ],
        ),
        body: Center(
          child: const Text('Home'),
        ),
      ),
    );
  }

  signout(BuildContext context) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
      return ScreenLogin();
    }), (route) => false);
  }
}
