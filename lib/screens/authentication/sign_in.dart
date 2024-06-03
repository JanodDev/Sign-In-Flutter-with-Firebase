import 'package:firbase_tutorial/constants/colors.dart';
import 'package:firbase_tutorial/constants/descripion.dart';
import 'package:firbase_tutorial/constants/styles.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  //function
  final Function toggle;
  const SignIn({Key? key, required this.toggle}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            "SIGN IN",
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
                    height: 150,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        //google
                        const SizedBox(
                          height: 20,
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
                              "Do not have an account?",
                              style: descriptionStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              //go to the Regiser page
                              onTap: () {
                                widget.toggle();
                              },
                              child: const Text(
                                "REGISTER",
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
                                .signInUsingEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                error =
                                    "Could not signin with those credential";
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
                              "LOG IN",
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
                        GestureDetector(
                          //method for login user as anon
                          onTap: () async {
                            await _auth.singInAnonymously();
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
                              "LOGIN AS GUEST",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        )
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



// ElevatedButton(
//         child: const Text("sign in anonymously"),
//         onPressed: () async {
//           dynamic result = await _auth.singInAnonymously();
//           if (result == Null) {
//             print("error in sign in anon");
//           } else {
//             print("signed in anon");
//             print(result.uid);
//           }
//         },
//       ),