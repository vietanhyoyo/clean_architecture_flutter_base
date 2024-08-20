import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/presentation/widgets/follow_info.dart';
import 'package:clean_architecture/features/food/presentation/widgets/like_info.dart';
import 'package:flutter/material.dart';

class FoodDetailCard extends StatelessWidget {
  final ProductEntity foodItem;

  const FoodDetailCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      elevation: 4.0,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(6.0)),
            child: Image.asset(foodItem.image ?? "",
                fit: BoxFit.cover, height: 250),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodItem.title ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    LikeInfo(int.tryParse(foodItem.favorite ?? "0") ?? 0, true),
                    const SizedBox(width: 6.0),
                    FollowInfo(int.tryParse(foodItem.view ?? "0") ?? 0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
