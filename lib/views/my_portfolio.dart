import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_buttons.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String appTitle1 = "SAMPARK APP";
    String image1 = AppAssets.project1;
    String projectdescription1 =
        "Sampark App is a robust communication platform developed with Dart and Flutter, featuring real-time messaging (text, image, video, audio), one-to-one and group calls, and live streaming. Utilizing GetX for state management and Firebase for backend services, the app offers secure email authentication and versatile group management (creation, editing, deletion). The app’s scalable backend and real-time communication capabilities provide a reliable and engaging way for users to connect and interact.";

    String appTitle2 = "My Portfolio";
    String image2 = AppAssets.project2;
    String projectdescription2 =
        "My portfolio is a visually engaging and fully responsive web application built using Flutter. It leverages advanced animations to create smooth transitions and an interactive user experience. Designed to perform seamlessly across devices—whether mobile, tablet, or desktop—the portfolio highlights Abhishek's technical skills, projects, and expertise in Flutter. The use of animations brings a dynamic feel to the interface, showcasing his commitment to both design and functionality.";

    String appTitle3 = "Calculator ";
    String image3 = AppAssets.project3;
    String projectdescription3 =
        "A calculator with basic functions was built using Flutter, showcasing a clean user interface and smooth functionality. The app efficiently handles essential operations like addition, subtraction, multiplication, remainder and division. This project highlights the ability to create simple yet effective applications with Flutter’s framework, emphasizing ease of use and responsiveness.";

    String liveLink1 = "";
    String githubLink1 = "https://github.com/abhi123nith/chat_app";

    String liveLink2 = "https://godaraportfolio.netlify.app/";
    String githubLink2 = "https://github.com/abhi123nith/Portfolio";

    String liveLink3 = "https://godaracalculator.netlify.app/";
    String githubLink3 = "https://github.com/abhi123nith/Calculator_app";

    return HelperClass(
      mobile: Column(
        children: [
          FadeInRight(
            duration: const Duration(milliseconds: 1200),
            child: RichText(
              text: TextSpan(
                text: 'My ',
                style: AppTextStyles.headingStyles(fontSize: 30.0),
                children: [
                  TextSpan(
                    text: 'Projects',
                    style: AppTextStyles.headingStyles(
                        fontSize: 30, color: AppColors.robinEdgeBlue),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              buildAboutMeContents(
                  appTitle1, projectdescription1, githubLink1, liveLink1),
              Constants.sizedBox(height: 35.0),
              buildProfilePicture(image1),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              buildAboutMeContents(
                  appTitle2, projectdescription2, githubLink2, liveLink2),
              Constants.sizedBox(height: 35.0),
              buildProfilePicture(image2),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              buildAboutMeContents(
                  appTitle3, projectdescription3, githubLink3, liveLink3),
              Constants.sizedBox(height: 35.0),
              buildProfilePicture(image3),
            ],
          ),
        ],
      ),
      tablet: Column(
        children: [
          FadeInRight(
            duration: const Duration(milliseconds: 1200),
            child: RichText(
              text: TextSpan(
                text: 'My ',
                style: AppTextStyles.headingStyles(fontSize: 30.0),
                children: [
                  TextSpan(
                    text: 'Projects',
                    style: AppTextStyles.headingStyles(
                        fontSize: 30, color: AppColors.robinEdgeBlue),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              buildProfilePicture(image1),
              Constants.sizedBox(width: 25.0),
              buildAboutMeContents(
                  appTitle1, projectdescription1, githubLink1, liveLink1)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              buildProfilePicture(image2),
              Constants.sizedBox(width: 25.0),
              buildAboutMeContents(
                  appTitle2, projectdescription2, githubLink2, liveLink2)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              buildProfilePicture(image3),
              Constants.sizedBox(width: 25.0),
              buildAboutMeContents(
                  appTitle3, projectdescription3, githubLink3, liveLink3)
            ],
          ),
        ],
      ),
      desktop: Column(
        children: [
          FadeInRight(
            duration: const Duration(milliseconds: 1200),
            child: RichText(
              text: TextSpan(
                text: 'My ',
                style: AppTextStyles.headingStyles(fontSize: 30.0),
                children: [
                  TextSpan(
                    text: 'Projects',
                    style: AppTextStyles.headingStyles(
                        fontSize: 30, color: AppColors.robinEdgeBlue),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              buildProfilePicture(image1),
              Constants.sizedBox(width: 25.0),
              Expanded(
                  child: buildAboutMeContents(
                      appTitle1, projectdescription1, githubLink1, liveLink1)),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              buildProfilePicture(image2),
              Constants.sizedBox(width: 25.0),
              Expanded(
                  child: buildAboutMeContents(
                      appTitle2, projectdescription2, githubLink2, liveLink2)),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              buildProfilePicture(image3),
              Constants.sizedBox(width: 25.0),
              Expanded(
                  child: buildAboutMeContents(
                      appTitle3, projectdescription3, githubLink3, liveLink3)),
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfilePicture(String image) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          image,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Column buildAboutMeContents(String apptitle, String projectDescription,
      String githubLink, String liveLink) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Constants.sizedBox(height: 6.0),
            FadeInLeft(
              duration: const Duration(milliseconds: 1400),
              child: Text(
                apptitle,
                style: AppTextStyles.headingStyles(
                    color: Colors.white, fontSize: 20),
              ),
            ),
            Constants.sizedBox(height: 8.0),
            FadeInLeft(
              duration: const Duration(milliseconds: 1600),
              child: Column(
                children: [
                  Text(
                    projectDescription,
                    style: AppTextStyles.normalStyle(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                FadeInUp(
                  duration: const Duration(milliseconds: 1800),
                  child: AppButtons.buildMaterialButton(
                      onTap: () async {
                        final Uri uri = Uri.parse(liveLink);
                        if (await canLaunchUrl(uri)) {
                          launchUrl(uri, mode: LaunchMode.externalApplication);
                          //  print('Tapppeddddd');
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                      buttonName: 'Live'),
                ),
                const SizedBox(width: 30),
                FadeInUp(
                  duration: const Duration(milliseconds: 1800),
                  child: AppButtons.buildMaterialButton(
                      onTap: () async {
                        final Uri uri = Uri.parse(githubLink);
                        if (await canLaunchUrl(uri)) {
                          launchUrl(uri, mode: LaunchMode.externalApplication);
                          //  print('Tapppeddddd');
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                      buttonName: 'Source Code'),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
