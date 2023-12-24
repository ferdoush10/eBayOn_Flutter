import 'package:ebuy_on/utls/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  bool chnageButton = false;

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        chnageButton = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        chnageButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/welcome.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text('Welcome $name',
                style: const TextStyle(fontSize: 30, letterSpacing: 5)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usernameTEController,
                      decoration: const InputDecoration(
                        hintText: "enter username",
                        labelText: "username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username can not be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    //password
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "enter password",
                        labelText: "password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can not be empty";
                        } else if (value.length < 6) {
                          return "Password length should be at lest 6";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 40),

                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: chnageButton ? 50 : 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          shape: chnageButton
                              ? BoxShape.circle
                              : BoxShape.rectangle,
                        ),
                        child: Center(
                            child: chnageButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Log In',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _usernameTEController.clear();
    _passwordTEController.clear();
  }
}

