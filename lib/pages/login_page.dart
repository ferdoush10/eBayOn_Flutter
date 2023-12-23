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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/login.png',
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
                          return "Please enter username";
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
                          return "Please enter username";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 40),

                    InkWell(
                      onTap: () async {
                        setState(() {
                          chnageButton = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          await Future.delayed(const Duration(seconds: 2));
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: chnageButton ? 50 : 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          shape: chnageButton
                              ? BoxShape.circle
                              : BoxShape.rectangle,
                          // borderRadius: chnageButton
                          //     ? BorderRadius.circular(20)
                          //     : BorderRadius.circular(8),
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


//TODO:- time start 