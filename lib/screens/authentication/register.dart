import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/descripion.dart';
import '../../constants/styles.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  //function
  //function
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //ref for the AuthServices class
  final AuthServices _auth = AuthServices();

  //form key

  final _formKey = GlobalKey<FormState>();

  //email password states
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          title: const Text(
            "REGISTER",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          elevation: 0,
          backgroundColor: bgBlack,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Column(
              children: [
                //descrption
                const Text(
                  description,
                  style: descriptionStyle,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/man.png",
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //email
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: textInputDecoration,
                          validator: (val) =>
                              val!.isEmpty ? "Enter a valid Email" : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        //password
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: textInputDecoration.copyWith(
                              hintText: "password"),
                          validator: (val) => val!.length < 6
                              ? "password must be at least 6 characters"
                              : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        //google
                        const SizedBox(
                          height: 20,
                        ),
                        //error text
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        const Text(
                          "Login with social account",
                          style: descriptionStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          //sign in with google
                          onTap: () {},
                          child: Center(
                            child: Image.asset(
                              "assets/images/google.png",
                              height: 50,
                            ),
                          ),
                        ),
                        //register
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do have an account?",
                              style: descriptionStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              //go to the signin page
                              onTap: () {
                                widget.toggle();
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: mainBlue,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),

                        //button
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          //method for login user
                          onTap: () async {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            if (result == null) {
                              //error
                              setState(() {
                                error = "please enter a valid email!";
                              });
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: bgBlack,
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 2, color: mainYellow)),
                            child: const Center(
                                child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),

                        //anon
                        const SizedBox(
                          height: 15,
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
}
