import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:tech_bay/constants.dart';
import 'package:tech_bay/size_config.dart';

import 'package:tech_bay/screens/complete_profile/components/complete_profile_form.dart';

class CompleteProfileScreen extends StatefulWidget {
  late final String email;
  late final String password;

  CompleteProfileScreen({Key? key, required this.email, required this.password})
      : super(key: key);

  static String routeName = "/complete_profile";
  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Text("Complete Profile", style: headingStyle),
                  Text(
                    "Complete your details on this page to finish \nwith your Account Creation.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.06),
                  CompleteProfileForm(
                    email: '${widget.email}',
                    password: '${widget.password}',
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Text(
                    "By continuing your confirm that you agree \nwith our Terms and Conditions",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
