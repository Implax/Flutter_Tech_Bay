import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_bay/screens/sign_in/sign_in_screen.dart';

import 'profile_pic.dart';
import 'profile_menu.dart';
import 'package:tech_bay/components/default_button.dart';
import 'package:tech_bay/screens/profile/update_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List users = [];
  var data = '';

  late var name = '';
  late var email = '';
  late var phone = '';
  late var country = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: fetch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return Text("Loading data ... Please wait");
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    ProfilePic(),
                    SizedBox(height: 20),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            email,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            phone,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            country,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 50),
                          DefaultButton(
                              text: "Edit Profile",
                              press: () {
                                // if all are valid then go to success screen
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new UpdateScreen()));
                              }),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    ProfileMenu(
                      text: "Log Out",
                      icon: "assets/icons/Log out.svg",
                      press: () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                    ),
                  ],
                ),
              );
            }));
  }

  Future<void> fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    final String? uid = firebaseUser?.uid.toString();

    if (firebaseUser != null) {
      var document = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();

      users = document.docs.map((doc) => doc.data()).toList();
      // data = users[0]['country'];

      name = users[0]['fullName'];
      email = users[0]['email'];
      phone = users[0]['phone'];
      country = users[0]['country'];
    }
  }
}
