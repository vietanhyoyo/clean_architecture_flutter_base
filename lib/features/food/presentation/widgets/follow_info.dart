import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FollowInfo extends StatelessWidget {
  final int number;

  const FollowInfo(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.check_circle, color: AppColors.primary),
      const SizedBox(width: 4.0),
      Text(number.toString())
    ]);
  }
}
