import 'package:clean_architecture/features/food/presentation/pages/category_food_page.dart';
import 'package:clean_architecture/features/food/presentation/widgets/food_card.dart';
import 'package:flutter/material.dart';

class FoodHomePage extends StatelessWidget {
  FoodHomePage({super.key});

  final List<FoodItem> foodItems = [
    FoodItem(
        name: 'Phở',
        price: 50000,
        image:
            'https://i.pinimg.com/564x/b0/41/6f/b0416f0349cf1c13b5bf81c9fcddc82a.jpg'),
    FoodItem(
        name: 'Bún chả',
        price: 60000,
        image:
            'https://i.pinimg.com/564x/b0/41/6f/b0416f0349cf1c13b5bf81c9fcddc82a.jpg'),
    FoodItem(
        name: 'Cơm tấm',
        price: 45000,
        image:
            'https://i.pinimg.com/564x/b0/41/6f/b0416f0349cf1c13b5bf81c9fcddc82a.jpg'),
    FoodItem(
        name: 'Gỏi cuốn',
        price: 30000,
        image:
            'https://i.pinimg.com/564x/b0/41/6f/b0416f0349cf1c13b5bf81c9fcddc82a.jpg'),
    FoodItem(
        name: 'Bánh mì',
        price: 25000,
        image:
            'https://i.pinimg.com/564x/b0/41/6f/b0416f0349cf1c13b5bf81c9fcddc82a.jpg'),
    FoodItem(
        name: 'Chả giò',
        price: 40000,
        image:
            'https://i.pinimg.com/564x/b0/41/6f/b0416f0349cf1c13b5bf81c9fcddc82a.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final foodItem = foodItems[index];
          return InkWell(
              child: FoodCard(foodItem: foodItem),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  CategoryFoodPage()),
                );
              });
        },
      ),
    );
  }
}
