import 'package:flutter/material.dart';
import 'package:tech_bay/screens/sign_in/sign_in_screen.dart';

import 'profile_pic.dart';
import 'profile_menu.dart';
import 'package:tech_bay/components/default_button.dart';
import 'package:tech_bay/screens/profile/update_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  'Full Name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Country',
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
                              builder: (context) => new UpdateScreen()));
                    }),
              ],
            ),
          ),
          SizedBox(height: 80),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          ),
        ],
      ),
    );
  }
}
