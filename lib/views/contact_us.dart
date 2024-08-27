// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_buttons.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:portfolio/helper%20class/send_email.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  final TextEditingController fullname = TextEditingController();
  final TextEditingController remail = TextEditingController();
  final TextEditingController emailSubject = TextEditingController();
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return HelperClass(
      mobile: _buildMobileLayout(context),
      tablet: _buildFormLayout(size, context),
      desktop: _buildFormLayout(size, context),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.bgColor,
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildContactText(),
          Constants.sizedBox(height: 40.0),
          _buildTextField(
            controller: fullname,
            hintText: 'Full Name',
          ),
          Constants.sizedBox(height: 20.0),
          _buildTextField(
            controller: remail,
            hintText: 'Email Address',
          ),
          Constants.sizedBox(height: 20.0),
          _buildTextField(
            controller: emailSubject,
            hintText: 'Email Subject',
          ),
          Constants.sizedBox(height: 20.0),
          _buildTextField(
            controller: message,
            hintText: 'Your Message',
            maxLines: 15,
          ),
          Constants.sizedBox(height: 40.0),
          AppButtons.buildMaterialButton(
            buttonName: 'Send Message',
            onTap: () async {
              bool isSent = await _sendMessage(context);
              if (isSent) {
                fullname.clear();
                remail.clear();
                emailSubject.clear();
                message.clear();
              }
            },
          ),
          Constants.sizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _buildFormLayout(Size size, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildContactText(),
          Constants.sizedBox(height: 40.0),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: fullname,
                  hintText: 'Full Name',
                ),
              ),
              Constants.sizedBox(width: 20.0),
              Expanded(
                child: _buildTextField(
                  controller: remail,
                  hintText: 'Email Address',
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 20.0),
          _buildTextField(
            controller: emailSubject,
            hintText: 'Email Subject',
          ),
          Constants.sizedBox(height: 20.0),
          _buildTextField(
            controller: message,
            hintText: 'Your Message',
            maxLines: 15,
          ),
          Constants.sizedBox(height: 40.0),
          AppButtons.buildMaterialButton(
            buttonName: 'Send Message',
            onTap: () async {
              bool isSent = await _sendMessage(context);
              if (isSent) {
                fullname.clear();
                remail.clear();
                emailSubject.clear();
                message.clear();
              }
            },
          ),
          Constants.sizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      elevation: 8,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        cursorColor: AppColors.white,
        style: AppTextStyles.normalStyle(),
        decoration: _buildInputDecoration(hintText: hintText),
      ),
    );
  }

  InputDecoration _buildInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.comfortaaStyle(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: AppColors.bgColor2,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    );
  }

  FadeInDown _buildContactText() {
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
                fontSize: 30,
                color: AppColors.robinEdgeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _sendMessage(BuildContext context) async {
    if (fullname.text.trim().isEmpty ||
        remail.text.trim().isEmpty ||
        emailSubject.text.trim().isEmpty ||
        message.text.trim().isEmpty) {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields are required!'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    try {
      await sendEmailService.sendMail(
        name: fullname.text.trim(),
        email: remail.text.trim(),
        subject: emailSubject.text.trim(),
        message: message.text.trim(),
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email sent successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      return true;
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send message: $e'),
          backgroundColor: Colors.red,
        ),
      );

      return false;
    }
  }
}
