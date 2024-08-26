import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

final AlertDialog alertSuccess = AlertDialog(
  content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
    const Icon(Icons.check_circle_outline, color: AppColors.primary),
    Container(
        margin: const EdgeInsets.only(left: 30),
        child: const Text("Order Success!"))
  ]),
);
