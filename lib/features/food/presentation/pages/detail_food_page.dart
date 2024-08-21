import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:clean_architecture/features/food/presentation/cubit/detail_food/detail_food_cubit.dart';
import 'package:clean_architecture/features/food/presentation/widgets/follow_info.dart';
import 'package:clean_architecture/features/food/presentation/widgets/like_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetaiProp {
  final String name;
  final int price;
  final String image;
  final int like;
  final int following;
  final bool isLiked;
  final String description;
  final String ingredients;
  final String cooking;

  FoodDetaiProp({
    required this.name,
    required this.price,
    required this.image,
    required this.like,
    required this.isLiked,
    required this.following,
    required this.description,
    required this.ingredients,
    required this.cooking,
  });
}

class DetailFoodPage extends StatelessWidget {
  const DetailFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: BlocBuilder<DetailFoodCubit, DetailFoodState>(
        builder: (context, state) {
          if (state is DetailFoodInitial) {
            return const Text('Detail');
          } else if (state is DetailFoodLoaded) {
            return Text(state.product.title ?? "",
                style: AppText.titleSM,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis);
          } else {
            return const Text('Detail');
          }
        },
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(Icons.menu, size: 30, color: Colors.transparent),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<DetailFoodCubit, DetailFoodState>(
        builder: (context, state) {
      if (state is DetailFoodInitial) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      } else if (state is DetailFoodLoaded) {
        return SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Image.asset(
                state.product.image ?? "",
                height: 300,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LikeInfo(
                          int.tryParse(state.product.favorite ?? "0") ?? 0,
                          true)),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FollowInfo(
                        int.tryParse(state.product.view ?? "0") ?? 0,
                      )),
                ),
              ),
            ]),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Text(state.product.intro ?? "", style: AppText.bodySM),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Nguyên liệu", style: AppText.titleMD),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.product.ingredients ?? ""),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Cách chế biến", style: AppText.titleMD),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.product.instructions ?? ""),
                      ),
                    ]),
              ),
            )
          ]),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
