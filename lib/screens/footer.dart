import 'package:flutter/cupertino.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:portfolio_website/screens/header.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      VxDevice(mobile: VStack([
          "Got a project?\nLet's talk"
          .text
          .center
          .white
          .xl2
          .make(),
          10.heightBox,
          "theelitedevelopers1@gmail.com"
          .text
          .color(AppColors.accentColor)
          .semiBold
          .make()
          .box
          .border(color: AppColors.accentColor)
          .p16
          .rounded
          .make(),
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
          web: HStack([
              "Got a project?\nLet's talk"
                  .text
                  .center
                  .white
                  .xl2
                  .make(),
              10.widthBox,
              "theelitedevelopers1@gmail.com"
                  .text
                  .color(AppColors.accentColor)
                  .semiBold
                  .make()
                  .box
                  .border(color: AppColors.accentColor)
                  .p16
                  .rounded
                  .make()
            ],
            alignment: MainAxisAlignment.spaceAround,
            axisSize: MainAxisSize.max,
          )
      ),
      50.heightBox,
      CustomAppBar(),
      10.heightBox,
      "Thank you for visiting.".text.semiBold.white.make(),
      10.heightBox,
      [
        "Made by Victor with ".text.purple400.make(),
        10.widthBox,
        Icon(AntDesign.heart, color: Vx.purple400, size: 14,),
      ].hStack(alignment: MainAxisAlignment.center)
    ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}
