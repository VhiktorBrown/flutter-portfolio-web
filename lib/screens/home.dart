import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/header.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryColor,
      child: const VStack([
        HeaderScreen(),
      ]).scrollVertical(),
    );
  }

}