import 'package:clean_architecture/config/routes/application.dart';
import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_home/food_home_cubit.dart';
import 'package:clean_architecture/features/food/presentation/widgets/food_card.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodHomePage extends StatelessWidget {
  const FoodHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<FoodHomeCubit, FoodHomeState>(
        builder: (context, state) {
          if (state is FoodHomeInitial) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is FoodHomeLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.9,
              ),
              itemCount: state.categoryList.length,
              itemBuilder: (context, index) {
                final foodItem = state.categoryList[index];
                return InkWell(
                    child: FoodCard(foodItem: foodItem),
                    onTap: () {
                      Application.navigateTo(
                          context,
                          "${Routes.categoryFood}/${foodItem.id}/${foodItem.name}",
                          TransitionType.inFromRight);
                    });
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
