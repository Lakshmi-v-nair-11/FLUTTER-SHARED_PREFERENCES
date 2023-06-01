import 'package:flutter/material.dart';
import 'package:sample_login/main.dart';
import 'package:sample_login/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _LoginSccreenState();
}

class _LoginSccreenState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isDataMatch = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    // if(_isDataMatch){
                    //   return null;
                    // }
                    // else{
                    //   return 'ERROR';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    // if(_isDataMatch){
                    //   return null;
                    // }
                    // else{
                    //   return 'ERROR';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDataMatch,
                      child: const Text(
                        'Username and passsword doesnt match',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!
                            .validate()) //call validator fn
                        {
                          checkLogin(context);
                        } else {
                          print('Data Empty');
                        }
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      print('Username and password match');

      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SaveKeyname, true);

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return ScreenHome();
      }));
    } else {
      print('Username and passsword doesnt match');
    }
  }
}
