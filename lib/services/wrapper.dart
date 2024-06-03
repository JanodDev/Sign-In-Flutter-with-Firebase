import 'package:firbase_tutorial/models/UserModel.dart';
import 'package:firbase_tutorial/screens/authentication/authenticate.dart';
import 'package:firbase_tutorial/screens/home/home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //the user data that the provider prroides this can be a user data or can be null.
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
