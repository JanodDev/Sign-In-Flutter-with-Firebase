import 'package:firbase_tutorial/constants/colors.dart';
import 'package:firbase_tutorial/constants/descripion.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create a obj from AuthServices
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgBlack,
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(bgBlack)),
              onPressed: () async {
                await _auth.SignOut();
              },
              child: const Icon(Icons.logout),
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "HOME",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/man.png",
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
