// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:portfolio/globals/app_buttons.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});
  final _key = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController remail = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController emailSubject = TextEditingController();
  TextEditingController message = TextEditingController();

  sendEmail(String subject, String emailRec, String number, String message,
      String name) async {
    final Email email = Email(
        body: message, subject: subject, recipients: [emailRec], isHTML: false);

    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildContactText(),
            Constants.sizedBox(height: 40.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextField(
                controller: fullname,
                onChanged: (val) {
                  val = fullname.toString();
                },
                cursorColor: AppColors.white,
                style: AppTextStyles.normalStyle(),
                decoration: buildInputDecoration(hintText: 'Full Name'),
              ),
            ),
            Constants.sizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextField(
                controller: remail,
                onChanged: (val) {
                  val = remail.toString();
                },
                cursorColor: AppColors.white,
                style: AppTextStyles.normalStyle(),
                decoration: buildInputDecoration(hintText: 'Email Address'),
              ),
            ),
            Constants.sizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextField(
                controller: mobilenumber,
                onChanged: (val) {
                  val = mobilenumber.toString();
                },
                cursorColor: AppColors.white,
                style: AppTextStyles.normalStyle(),
                decoration: buildInputDecoration(hintText: 'Mobile Number'),
              ),
            ),
            Constants.sizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextField(
                controller: emailSubject,
                onChanged: (val) {
                  val = emailSubject.toString();
                },
                cursorColor: AppColors.white,
                style: AppTextStyles.normalStyle(),
                decoration: buildInputDecoration(hintText: 'Email Subject'),
              ),
            ),
            Constants.sizedBox(height: 20.0),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: TextField(
                controller: message,
                onChanged: (val) {
                  val = message.toString();
                },
                maxLines: 15,
                cursorColor: AppColors.white,
                style: AppTextStyles.normalStyle(),
                decoration: buildInputDecoration(hintText: 'Your Message'),
              ),
            ),
            Constants.sizedBox(height: 40.0),
            AppButtons.buildMaterialButton(
                buttonName: 'Send Message',
                onTap: () {
                  _key.currentState!.save();
                  sendEmail(
                      emailSubject.toString(),
                      remail.toString(),
                      mobilenumber.toString(),
                      message.toString(),
                      fullname.toString());
                }),
            Constants.sizedBox(height: 30.0),
          ],
        ),
      ),
      tablet: buildForm(),
      desktop: buildForm(),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.bgColor,
    );
  }

  Column buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(),
        Constants.sizedBox(height: 40.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  controller: fullname,
                  onChanged: (val) {
                    val = fullname.toString();
                  },
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Full Name'),
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  controller: remail,
                  onChanged: (val) {
                    val = remail.toString();
                  },
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Email Address'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  controller: mobilenumber,
                  onChanged: (val) {
                    val = mobilenumber.toString();
                  },
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Mobile Number'),
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextField(
                  controller: emailSubject,
                  onChanged: (val) {
                    val = emailSubject.toString();
                  },
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Email Subject'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          elevation: 8,
          child: TextField(
            controller: message,
            onChanged: (val) {
              val = message.toString();
            },
            maxLines: 15,
            cursorColor: AppColors.white,
            style: AppTextStyles.normalStyle(),
            decoration: buildInputDecoration(hintText: 'Your Message'),
          ),
        ),
        Constants.sizedBox(height: 40.0),
        AppButtons.buildMaterialButton(
            buttonName: 'Send Message',
            onTap: () async {
              sendEmail(
                  emailSubject.toString().trim(),
                  remail.toString().trim(),
                  mobilenumber.toString().trim(),
                  message.toString().trim(),
                  fullname.toString().trim());
            }),
        Constants.sizedBox(height: 30.0),
      ],
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Me!',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.comfortaaStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColors.bgColor2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16));
  }
}
