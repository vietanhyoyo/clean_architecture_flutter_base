import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LikeInfo extends StatelessWidget {
  final int number;
  final bool isLike;

  const LikeInfo(this.number, this.isLike, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.favorite, color: isLike ? AppColors.red : AppColors.grey),
      const SizedBox(width: 4.0),
      Text(isLike ? (number + 1).toString() : number.toString())
    ]);
  }
}
