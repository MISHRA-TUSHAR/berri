import 'package:berri/screens/college_mail.dart';
import 'package:berri/utils/colors.dart';
import 'package:berri/widgets/buttons.dart';
import 'package:flutter/material.dart';

class Join extends StatefulWidget {
  const Join({Key? key}) : super(key: key);

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(
              'assets/images/berri_join.png',
              width: 200,
              height: 200,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'MORE THAN DATING,',
                style: TextStyle(
                  color: MyAppColors.textWhite,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'IT\'S ',
                    style: TextStyle(
                      color: MyAppColors.textBlue,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'community.',
                    style: TextStyle(
                      color: MyAppColors.textBlue,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'WisdomScript',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 300),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CollegeMail()),
                        );
                      },
                      child: const Buttons(
                        backgroundColor: MyAppColors.textBlue,
                        text: 'Join Berri',
                        textColor: Colors.white,
                        isBold: true,
                        hasBorder: false,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Buttons(
                      backgroundColor: Colors.transparent,
                      text: 'Already have an account',
                      textColor: MyAppColors.textBlue,
                      hasBorder: true,
                      isBold: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'BY SIGNING UP YOU AGREE TO OUR ',
                    style: TextStyle(
                      color: MyAppColors.textGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'TERMS. ',
                    style: TextStyle(
                      color: MyAppColors.textBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: 'LEARN HOW WE PROCESS YOUR DATA IN OUR ',
                    style: TextStyle(
                      color: MyAppColors.textGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'PRIVACY POLICY ',
                    style: TextStyle(
                      color: MyAppColors.textBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: 'AND ',
                    style: TextStyle(
                      color: MyAppColors.textGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'COOKIES POLICY.',
                    style: TextStyle(
                      color: MyAppColors.textBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
