import 'package:berri/utils/colors.dart';
import 'package:berri/widgets/buttons.dart';
import 'package:berri/widgets/textfields.dart';
import 'package:flutter/material.dart';

class CollegeMail extends StatefulWidget {
  const CollegeMail({Key? key});

  @override
  State<CollegeMail> createState() => _CollegeMailState();
}

class _CollegeMailState extends State<CollegeMail> {
  final TextEditingController collegeNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Color buttonColor = MyAppColors.unFocused;

  @override
  void initState() {
    super.initState();
    collegeNameController.addListener(updateButtonColor);
    emailController.addListener(updateButtonColor);
  }

  @override
  void dispose() {
    collegeNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void updateButtonColor() {
    setState(() {
      if (collegeNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty) {
        buttonColor = MyAppColors.textBlue;
      } else {
        buttonColor = MyAppColors.unFocused;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                        text: 'MY ',
                        style: TextStyle(
                          color: MyAppColors.textWhite,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'COLLEGE\n',
                        style: TextStyle(
                          color: MyAppColors.textBlue,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'WisdomScript',
                        ),
                      ),
                      TextSpan(
                        text: 'NAME & EMAIL',
                        style: TextStyle(
                          color: MyAppColors.textWhite,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'WE PROTECT OUR COMMUNITY BY MAKING SURE EVERYONE IS A REAL STUDENT FROM COLLEGE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 97, 98, 100),
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFieldWidgets(
                  textController: collegeNameController,
                  hintText: 'COLLEGE NAME',
                  hintTextColor: MyAppColors.textGrey,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFieldWidgets(
                  textController: emailController,
                  hintText: 'COLLEGE EMAIL ID',
                  hintTextColor: MyAppColors.textGrey,
                ),
              ),
              const SizedBox(height: 200),
              const Center(
                child: Text(
                  'WE ONLY USE EMAIL TO CONFIRM STUDENT STATUS.',
                  style: TextStyle(
                    color: MyAppColors.textGrey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: Buttons(
                  backgroundColor: buttonColor,
                  text: 'GET OTP',
                  textColor: Colors.black54,
                  isBold: true,
                  hasBorder: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
