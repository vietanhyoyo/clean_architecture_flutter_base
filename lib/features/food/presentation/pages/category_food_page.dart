import 'package:clean_architecture/features/food/presentation/pages/detail_food_page.dart';
import 'package:clean_architecture/features/food/presentation/widgets/food_detail_card.dart';
import 'package:flutter/material.dart';

class CategoryFoodPage extends StatelessWidget {
  CategoryFoodPage({super.key});

  final List<FoodDetailCardProp> listFool = [
    FoodDetailCardProp(
      name: "Pizza",
      price: 150000,
      image:
          "https://i.pinimg.com/564x/9c/07/9f/9c079f0d8799b6844543ba27a30d2a76.jpg",
      like: 100,
      isLiked: true,
      following: 50,
    ),
    FoodDetailCardProp(
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
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Category'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: listFool.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailFoodPage()),
                );
              },
              child: FoodDetailCard(foodItem: listFool[index])),
        );
      },
    );
  }
}
