// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/Input_Decoration.dart';
import '../provider_user/provider_user.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [background(size), personIcon(), loginMethod(context)],
        ),
      ),
    );
  }

  SingleChildScrollView loginMethod(BuildContext context) {
    final userProvider = Provider.of<ProviderUser>(context);
    var textController = TextEditingController();
    var passwordController = TextEditingController();

    userProvider.getUserList();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            // height: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Login",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(children: [
                      TextFormField(
                        controller: textController,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                            hintText: "hamzeh@gmail.com",
                            labelText: "Gmail :",
                            icon: const Icon(Icons.email_outlined)),
                        validator: (value) {
                          // String pattern =
                          //     "r'^([a-zA-Z0-9_\"-\".]+)@([a-zA-Z0-9_\"-]+)(\".[a-zA-Z]{2,5}){1,2}\$";
                          // RegExp reg = RegExp(pattern);
                          // return reg.hasMatch(value ?? "")
                          //     ? null
                          //     : "Bad In Email";
                          // ignore: unnecessary_null_comparison
                          return value!.contains('@') && value.contains('gmail')
                              ? ""
                              : "Wrong syntax Email";
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                            hintText: "****",
                            labelText: "Password",
                            icon: const Icon(Icons.lock)),
                        validator: (value) {
                          return (value != null && value.length >= 6)
                              ? null
                              : "Password should more 6 charecters";
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                          color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          disabledColor: Colors.grey,
                          onPressed: () {
                            // print(userProvider.getUserList());
                            // Navigator.pushReplacementNamed(context, 'home');
                            print("heere");
                           // userProvider.getUserList();
                            if (userProvider.userList
                                        .where((e) =>
                                            e.email == textController.text)
                                        .length >
                                    0 &&
                                userProvider.userList
                                        .where((e) =>
                                            e.passwordd ==
                                            passwordController.text)
                                        .length >
                                    0) {
                              Navigator.pushReplacementNamed(context, 'home');
                            } else {
                              print("Wrongggggggggggggggggggggggggggggggggggg");
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ])),
              ),
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Sign In",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  SafeArea personIcon() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(
          Icons.person_outline,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  Container background(Size size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ])),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: circleWidget()),
          Positioned(top: -40, left: -30, child: circleWidget()),
          Positioned(top: -50, right: -20, child: circleWidget()),
          Positioned(bottom: -50, left: 10, child: circleWidget()),
          Positioned(bottom: 120, right: 20, child: circleWidget()),
        ],
      ),
    );
  }

  Container circleWidget() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
