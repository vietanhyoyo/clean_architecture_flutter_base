import 'package:clean_architecture/config/routes/application.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/features/food/domain/entities/category.dart';
import 'package:clean_architecture/features/food/presentation/widgets/food_card.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class FoodHomePage extends StatelessWidget {
  final List<CategoryEntity> categoryList;

  const FoodHomePage({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.9,
        ),
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final foodItem = categoryList[index];
          return InkWell(
              child: FoodCard(foodItem: foodItem),
              onTap: () {
                Application.navigateTo(
                    context,
                    "${Routes.categoryFood}/${foodItem.id}/${foodItem.name}",
                    TransitionType.inFromRight);
              });
        },
      ),
    );
  }
}
