import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'core/features/presentation/widgets/green_elevated_button.dart';
import 'core/util/button_constants.dart';
import 'core/util/color_constants.dart';

class OTPScreen extends StatefulWidget {
  final String? phoneNumberController;
  const OTPScreen({Key? key, required this.phoneNumberController})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpTextEditingController = TextEditingController()
    ..text = "";

  String currentText = "";
  bool checkBoxValue = false;

  Future<void> submit() async {
    debugPrint('checkBoxValue is $checkBoxValue');
    if (!checkBoxValue) {
      const snackBar =
          SnackBar(content: Text('Please agree to terms and conditions'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    final otpCode = currentText;
    debugPrint('OTP is $otpCode');
    if (otpCode.length != 6) {
      const snackBar =
          SnackBar(content: Text('Invalid OTP code. Please check again.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColour,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text(
                  "ENTER VERIFICATION CODE",
                  style: kTitleTextStyle,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,

                      pastedTextStyle: kLoginTextFieldStyle,
                      length: 6,
                      obscureText: false,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeColor: kPrimaryColour,
                        disabledColor: Colors.grey,
                        errorBorderColor: Colors.redAccent,
                        activeFillColor: kPrimaryDarkColour,
                        selectedColor: kPrimaryDarkColour,
                        selectedFillColor: kPrimaryDarkColour,
                        inactiveFillColor: kPrimaryDarkColour,
                        inactiveColor: Colors.transparent,
                      ),
                      cursorColor: kAccentColor,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      textStyle: kLoginTextFieldStyle,
                      controller: otpTextEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   debugPrint("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 50.0),
                  child: Center(
                    child: Text(
                      'Please enter the verification code that was sent to ${widget.phoneNumberController} ',
                      style: kSubtitleTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                GreenElevatedButton(buttonText: 'Continue', onPressed: submit),
                CheckboxListTile(
                  title: const Text(
                    "I Agree to the Terms of Use and Privacy Policy",
                    style: kSubtitleTextStyle,
                  ),
                  checkColor: Colors.white,
                  value: checkBoxValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkBoxValue = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
