import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/utils/helper.dart';
import 'package:clean_architecture/features/food/presentation/widgets/follow_info.dart';
import 'package:clean_architecture/features/food/presentation/widgets/like_info.dart';
import 'package:flutter/material.dart';

class FoodDetailCardProp {
  final String name;
  final int price;
  final String image;
  final int like;
  final int following;
  final bool isLiked;

  FoodDetailCardProp(
      {required this.name,
      required this.price,
      required this.image,
      required this.like,
      required this.isLiked,
      required this.following});
}

class FoodDetailCard extends StatelessWidget {
  final FoodDetailCardProp foodItem;

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
            child:
                Image.network(foodItem.image, fit: BoxFit.cover, height: 250),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodItem.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${Helper.addThousandSeparator(foodItem.price)} VND',
                        style: TextStyle(color: Colors.grey[600])),
                    Row(
                      children: [
                        LikeInfo(foodItem.like, foodItem.isLiked),
                        const SizedBox(width: 6.0),
                        FollowInfo(foodItem.following),
                      ],
                    ),
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
