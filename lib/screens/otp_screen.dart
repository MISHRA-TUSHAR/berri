import 'dart:async';
import 'package:berri/widgets/buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../utils/colors.dart';

class OTPscreen extends StatefulWidget {
  final String email;

  const OTPscreen({super.key, required this.email});

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  late Timer _timer;
  int _resendSeconds = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_resendSeconds == 0) {
          timer.cancel();
        } else {
          setState(() {
            _resendSeconds--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: MyAppColors.textBlue,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 30,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/berri_join.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'VERIFY YOUR \n',
                        style: TextStyle(
                          color: MyAppColors.textWhite,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'email\n',
                        style: TextStyle(
                          color: MyAppColors.textBlue,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'WisdomScript',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'ENTER CODE RECEIVED ON ',
                        style: TextStyle(
                          color: MyAppColors.textGrey,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: '${widget.email}\n',
                        style: const TextStyle(
                          color: MyAppColors.emailColor,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'CHANGE',
                        style: const TextStyle(
                          color: MyAppColors.textBlue,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: OtpTextField(
                  numberOfFields: 6,
                  borderRadius: BorderRadius.circular(20),
                  borderColor: MyAppColors.textBlue,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // Handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'RESEND IN $_resendSeconds seconds',
                  style: const TextStyle(
                    color: MyAppColors.textBlue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 260),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: InkWell(
                  onTap: () {},
                  child: const Buttons(
                    backgroundColor: MyAppColors.textBlue,
                    text: 'Submit',
                    textColor: Colors.black54,
                    isBold: true,
                    hasBorder: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
