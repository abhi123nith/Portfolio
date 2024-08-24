// // ignore_for_file: library_private_types_in_public_api

// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:portfolio/globals/app_assets.dart';
// import 'package:portfolio/globals/app_buttons.dart';
// import 'package:portfolio/globals/app_colors.dart';
// import 'package:portfolio/globals/constants.dart';
// import 'package:portfolio/helper%20class/helper_class.dart';

// import '../globals/app_text_styles.dart';

// class MyServices extends StatefulWidget {
//   const MyServices({super.key});

//   @override
//   _MyServicesState createState() => _MyServicesState();
// }

// class _MyServicesState extends State<MyServices>
//     with SingleTickerProviderStateMixin {
//   bool isApp = false, isGraphic = false, isDataAnalyst = false;

//   final Matrix4 _onHoverActive = Matrix4.identity()..translate(0, -10, 0);
//   final Matrix4 _onHoverRemove = Matrix4.identity();

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return HelperClass(
//       mobile: _buildMobileLayout(),
//       tablet: _buildTabletLayout(),
//       desktop: _buildDesktopLayout(),
//       paddingWidth: size.width * 0.04,
//       bgColor: AppColors.bgColor2,
//     );
//   }

//   Column _buildMobileLayout() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         _buildMyServicesText(),
//         Constants.sizedBox(height: 60.0),
//         _buildServiceCard(
//           title: 'App Development',
//           asset: AppAssets.code,
//           isActive: isApp,
//           onHover: (value) {
//             setState(() {
//               isApp = value;
//             });
//           },
//         ),
//         Constants.sizedBox(height: 24.0),
//         _buildServiceCard(
//           title: 'Graphic Designing',
//           asset: AppAssets.brush,
//           isActive: isGraphic,
//           onHover: (value) {
//             setState(() {
//               isGraphic = value;
//             });
//           },
//         ),
//         Constants.sizedBox(height: 24.0),
//         _buildServiceCard(
//           title: 'Digital Marketing',
//           asset: AppAssets.analyst,
//           isActive: isDataAnalyst,
//           onHover: (value) {
//             setState(() {
//               isDataAnalyst = value;
//             });
//           },
//         ),
//       ],
//     );
//   }

//   Column _buildTabletLayout() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         _buildMyServicesText(),
//         Constants.sizedBox(height: 60.0),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildServiceCard(
//               title: 'App Development',
//               asset: AppAssets.code,
//               isActive: isApp,
//               onHover: (value) {
//                 setState(() {
//                   isApp = value;
//                 });
//               },
//             ),
//             Constants.sizedBox(width: 24.0),
//             _buildServiceCard(
//               title: 'Graphic Designing',
//               asset: AppAssets.brush,
//               isActive: isGraphic,
//               onHover: (value) {
//                 setState(() {
//                   isGraphic = value;
//                 });
//               },
//             ),
//           ],
//         ),
//         Constants.sizedBox(height: 26.0),
//         _buildServiceCard(
//           title: 'Digital Marketing',
//           asset: AppAssets.analyst,
//           isActive: isDataAnalyst,
//           onHover: (value) {
//             setState(() {
//               isDataAnalyst = value;
//             });
//           },
//           width: 725.0,
//           hoverWidth: 735.0,
//         ),
//       ],
//     );
//   }

//   Column _buildDesktopLayout() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         _buildMyServicesText(),
//         Constants.sizedBox(height: 60.0),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildServiceCard(
//               title: 'App Development',
//               asset: AppAssets.code,
//               isActive: isApp,
//               onHover: (value) {
//                 setState(() {
//                   isApp = value;
//                 });
//               },
//             ),
//             Constants.sizedBox(width: 24.0),
//             _buildServiceCard(
//               title: 'Frontend Development',
//               asset: AppAssets.brush,
//               isActive: isGraphic,
//               onHover: (value) {
//                 setState(() {
//                   isGraphic = value;
//                 });
//               },
//             ),
//             Constants.sizedBox(width: 24.0),
//             _buildServiceCard(
//               title: 'Backend Development',
//               asset: AppAssets.analyst,
//               isActive: isDataAnalyst,
//               onHover: (value) {
//                 setState(() {
//                   isDataAnalyst = value;
//                 });
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   FadeInDown _buildMyServicesText() {
//     return FadeInDown(
//       duration: const Duration(milliseconds: 1200),
//       child: RichText(
//         text: TextSpan(
//           text: 'My ',
//           style: AppTextStyles.headingStyles(fontSize: 30.0),
//           children: [
//             TextSpan(
//               text: 'Services',
//               style: AppTextStyles.headingStyles(
//                 fontSize: 30.0,
//                 color: AppColors.robinEdgeBlue,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   AnimatedContainer _buildServiceCard({
//     required String title,
//     required String asset,
//     required bool isActive,
//     required void Function(bool) onHover,
//     double width = 350,
//     double hoverWidth = 360,
//   }) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: isActive ? hoverWidth : width,
//       height: isActive ? 390 : 380,
//       alignment: Alignment.center,
//       transform: isActive ? _onHoverActive : _onHoverRemove,
//       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
//       decoration: BoxDecoration(
//         color: AppColors.bgColor,
//         borderRadius: BorderRadius.circular(30),
//         border:
//             isActive ? Border.all(color: AppColors.themeColor, width: 3) : null,
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black54,
//             spreadRadius: 4.0,
//             blurRadius: 4.5,
//             offset: Offset(3.0, 4.5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Image.asset(
//             asset,
//             width: 50,
//             height: 50,
//             color: AppColors.themeColor,
//           ),
//           Constants.sizedBox(height: 30.0),
//           Text(
//             title,
//             style: AppTextStyles.montserratStyle(
//               color: Colors.white,
//               fontSize: 22.0,
//             ),
//           ),
//           Constants.sizedBox(height: 12.0),
//           Text(
//             "Flutter is Google's UI toolkit for building fast, responsive apps across platforms with one codebase. I started using Flutter to create efficient, visually appealing UIs with top-notch performance.",
//             style: AppTextStyles.normalStyle(fontSize: 14.0),
//             textAlign: TextAlign.center,
//           ),
//           Constants.sizedBox(height: 20.0),
//           AppButtons.buildMaterialButton(
//             buttonName: 'Read More',
//             onTap: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
