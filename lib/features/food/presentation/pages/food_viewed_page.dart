import 'package:clean_architecture/features/food/domain/entities/product.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_main/food_main_cubit.dart';
import 'package:clean_architecture/features/food/presentation/widgets/dismissible_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodViewedPage extends StatelessWidget {
  final List<ProductEntity> productList;
  final VoidCallback handleDismiss;

  const FoodViewedPage(
      {super.key, required this.productList, required this.handleDismiss});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey<int>(index),
          onDismissed: (direction) {
            context
                .read<FoodMainCubit>()
                .unSetViewed(productList[index].id ?? "");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                child: DismissibleCard(foodItem: productList[index])),
          ),
        );
      },
    );
  }
}
