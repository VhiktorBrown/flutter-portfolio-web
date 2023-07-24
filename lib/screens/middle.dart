import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IntermediateScreen extends StatelessWidget {
  const IntermediateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.purple700,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "All Creative Works\n".richText.withTextSpanChildren(
            [
              "Selected Projects.".textSpan.yellow400.make()
            ]
          )
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              items: [
                ProjectWidget(title: "iQuest"),
                ProjectWidget(title: "Device Track"),
                ProjectWidget(title: "Syticks"),
                ProjectWidget(title: "Syticks For Businesses")
              ],
              height: 170,
              enlargeCenterPage: true,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
            ),
          )
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return title
        .text
        .bold
        .white
        .xl
        .wide
        .center
        .make()
        .box
        .p8
        .roundedLg
        .alignCenter
        .square(200)
        .neumorphic(
        color: Vx.purple700,
        elevation: 5.0,
        curve: VxCurve.flat)
        .make().p8();
  }
}

