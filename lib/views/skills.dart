import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_buttons.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';

class MySkills extends StatelessWidget {
  MySkills({super.key});

  final String skillDescription =
      "I possess expertise in multiple technical domains including Flutter, C++, Data Structures & Algorithms, Firebase, and more. My passion for software development has driven me to continuously improve and learn new skills.";

  final List<String> skills = [
    "C",
    "C++",
    "Dart",
    "JavaScript",
    "Flutter",
    "Firebase",
    "Git",
    "GitHub",
    "SQL",
    "MongoDb"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return HelperClass(
      mobile: Column(
        children: [
          buildSkillsContents(),
          Constants.sizedBox(height: 35.0),
          buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          buildSkillsContents(),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildSkillsContents()),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor,
    );
  }

  FadeInRight buildProfilePicture() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          AppAssets.skills,
          height: 300,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Column buildSkillsContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'Technical ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Skills',
                  style: AppTextStyles.headingStyles(
                    fontSize: 30,
                    color: AppColors.robinEdgeBlue,
                  ),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Here are some of the technical skills I have acquired:',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            skillDescription,
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        buildSkillsButtons(),
      ],
    );
  }

  Wrap buildSkillsButtons() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: skills
          .map(
            (skill) => AppButtons.buildMaterialButton(
              buttonName: skill,
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}
