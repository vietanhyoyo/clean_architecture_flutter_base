import 'package:clean_architecture/features/food/presentation/pages/detail_food_page.dart';
import 'package:clean_architecture/features/food/presentation/widgets/dismissible_card.dart';
import 'package:flutter/material.dart';

class FoodFavoritePage extends StatelessWidget {
  FoodFavoritePage({super.key});

  final List<DismissibleCardProp> listFool = [
    DismissibleCardProp(
      name: "Pizza",
      price: 150000,
      image:
          "https://i.pinimg.com/564x/9c/07/9f/9c079f0d8799b6844543ba27a30d2a76.jpg",
      like: 100,
      isLiked: true,
      following: 50,
    ),
    DismissibleCardProp(
      name: "Burger",
      price: 120000,
      image:
          "https://i.pinimg.com/564x/9c/07/9f/9c079f0d8799b6844543ba27a30d2a76.jpg",
      like: 80,
      isLiked: false,
      following: 30,
    ),
    DismissibleCardProp(
      name: "Burger",
      price: 120000,
      image:
          "https://i.pinimg.com/564x/9c/07/9f/9c079f0d8799b6844543ba27a30d2a76.jpg",
      like: 80,
      isLiked: false,
      following: 30,
    ),
    DismissibleCardProp(
      name: "Burger",
      price: 120000,
      image:
          "https://i.pinimg.com/564x/9c/07/9f/9c079f0d8799b6844543ba27a30d2a76.jpg",
      like: 80,
      isLiked: false,
      following: 30,
    ),
    DismissibleCardProp(
      name: "Burger",
      price: 120000,
      image:
          "https://i.pinimg.com/564x/9c/07/9f/9c079f0d8799b6844543ba27a30d2a76.jpg",
      like: 80,
      isLiked: false,
      following: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listFool.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey<int>(index),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => DetailFoodPage()),
                //   );
                // },
                child: DismissibleCard(foodItem: listFool[index])),
          ),
        );
      },
    );
  }
}
