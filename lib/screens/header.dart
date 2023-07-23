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
              const PictureWidget(),
              Row(
                children: [
                  VStack([
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
                      child: VStack([
                        " - Introduction".text.gray500.widest.sm.make(),
                        10.heightBox,
                        "Flutter Developer, Native Android Developer. Android, iOS, Web, Flutter, Firebase."
                        .text
                        .white
                        .xl3
                        .maxLines(3)
                        .make(),
                        20.heightBox,
                      ])
                  )
                ],
              )
            ]),
          ])
        ).make()
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

