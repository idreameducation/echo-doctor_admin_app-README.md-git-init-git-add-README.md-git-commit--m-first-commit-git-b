import 'package:dpm_application/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/features/presentation/widgets/green_elevated_button.dart';
import 'core/util/button_constants.dart';
import 'core/util/color_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'login_select_lang';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> submit() async {
    final phoneNumber = phoneNumberController.text;
    debugPrint('OTP is $phoneNumber');
    if (phoneNumber.length != 10) {
      const snackBar =
          SnackBar(content: Text('Invalid Phone Number. Please check again.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (phoneNumber.length == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(phoneNumberController: phoneNumber),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              const Text(
                "ENTER YOUR MOBILE NUMBER",
                style: kTitleTextStyle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFFFFffffff)),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          '+92',
                          style: TextStyle(
                              fontFamily: 'RobotoCondensed',
                              color: kGreen,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintStyle: kLoginTextFieldStyle,
                          contentPadding: EdgeInsets.all(0.0),
                          isDense: true,
                          border: InputBorder.none,
                        ),
                        controller: phoneNumberController,
                        style: kLoginTextFieldStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          phoneNumberController.text = "";
                        },
                        icon: const CircleAvatar(
                          radius: 15.0,
                          foregroundColor: kAccentColor,
                          child: Icon(
                            CupertinoIcons.clear_circled,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: const Center(
                  child: Text(
                    'We will send you an SMS with the verification code to this number',
                    style: kSubtitleTextStyle,
                  ),
                ),
              ),
            ],
          ),
          GreenElevatedButton(buttonText: 'Continue', onPressed: submit)
        ],
      ),
    );
  }
}
