import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/utils/helper.dart';
import 'package:flutter/material.dart';

class DismissibleCardProp {
  final String name;
  final int price;
  final String image;
  final int like;
  final int following;
  final bool isLiked;

  DismissibleCardProp(
      {required this.name,
      required this.price,
      required this.image,
      required this.like,
      required this.isLiked,
      required this.following});
}

class DismissibleCard extends StatelessWidget {
  final DismissibleCardProp foodItem;

  const DismissibleCard({super.key, required this.foodItem});

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
                    const Icon(
                      Icons.swipe,
                      size: 30,
                    )
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
