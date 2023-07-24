import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:icons_flutter/icons_flutter.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameWidget = "Victor\nEbuka"
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(
        context
            .isMobile ? 15 : 20)
        .bold.make().shimmer();
    return SafeArea(
        child: VxBox(
          child: VStack([
            ZStack([
              // Padding(
              //   // Add padding to the PictureWidget
              //   padding: EdgeInsets.symmetric(
              //     horizontal: context.percentWidth * 10,
              //   ),
              //   child: const PictureWidget(),
              // ),
              // const Align(
              //   alignment: Alignment.center,
              //   child: PictureWidget(),
              // ),
              const PictureWidget().pOnly(left: 120),
              Row(
                children: [
                  VStack([
                    if(context.isMobile) 50.heightBox else 10.heightBox,
                    const CustomAppBar().shimmer(
                      primaryColor: AppColors.accentColor,
                    ),
                    30.heightBox,
                    nameWidget,
                    20.heightBox,
                    VxBox()
                        .color(AppColors.accentColor)
                        .size(60, 10)
                        .make()
                        .shimmer(primaryColor: AppColors.accentColor),
                    30.heightBox,
                    const SocialAccounts(),
                  ]).pSymmetric(
                      h: context.percentWidth*10,
                      v: 32
                  ),
                  Expanded(
                      child: VxResponsive(
                        fallback: const Offstage(),
                        medium: IntroductionWidget()
                            .pOnly(left: 120)
                            .h(context.percentHeight * 60),
                        large: IntroductionWidget()
                            .pOnly(left: 120)
                            .h(context.percentHeight * 60)
                      )
                  )
                ],
              ).w(context.screenWidth)
            ]),
          ])
        )
        //.size(context.screenWidth, context.percentHeight * 60)
        .color(AppColors.secondaryColor)
        .make()
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      ["- Introduction".text.gray500.widest.sm.make(),
        10.heightBox,
        "Flutter Developer, Native Android Developer. Android, iOS, Web, Flutter, Firebase."
            .text
            .white
            .xl3
            .maxLines(5)
            .make()
            .w(context.isMobile
            ? context.screenWidth
            : context.percentWidth * 40),
        20.heightBox,]
          .vStack(
        crossAlignment: CrossAxisAlignment.start,
      ),
      ElevatedButton(
        onPressed: () {
          launchUrl(Uri.parse("https://syticks.com"));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.accentColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 10),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Vx.purple700; // Replace with your desired hover color
              }
              return AppColors.accentColor; // Use the default overlay color when not hovered
            },
          ),
          mouseCursor: MaterialStateMouseCursor.clickable,
        ),
        child: "Visit Syticks.com".text.gray300.make(),
      ).h(50),
    ],
      alignment: MainAxisAlignment.spaceEvenly,
      crossAlignment: CrossAxisAlignment.start,
    );
  }
}


class PictureWidget extends StatelessWidget {
  const PictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: Image.asset(
        "assets/images/profile_image.png",
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: AppColors.accentColor,
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return[
      const Icon(AntDesign.twitter, color: Colors.white,).mdClick(() {
        launchUrl(Uri.parse("https://twitter.com/victorrebuka"));
      }).make(),
      20.widthBox,
      const Icon(AntDesign.instagram, color: Colors.white,).mdClick(() {
        launchUrl(Uri.parse("https://instagram.com/victorrebuka"));
      }).make(),
      20.widthBox,
      const Icon(AntDesign.youtube, color: Colors.white,).mdClick(() {
        launchUrl(Uri.parse("https://youtube.com/victorrebuka"));
      }).make(),
      20.widthBox,
      const Icon(AntDesign.github, color: Colors.white,).mdClick(() {
        launchUrl(Uri.parse("https://github.com/VhiktorBrown"));
      }).make(),
      20.widthBox,
    ].hStack();
  }
}

