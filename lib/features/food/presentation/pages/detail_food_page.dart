import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:clean_architecture/features/food/presentation/cubit/food_main/food_main_cubit.dart';
import 'package:clean_architecture/features/food/presentation/widgets/follow_info.dart';
import 'package:clean_architecture/features/food/presentation/widgets/like_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailFoodPage extends StatefulWidget {
  final String productId;
  final String title;
  const DetailFoodPage(this.productId, this.title, {super.key});

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  late FoodMainCubit foodMainCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    foodMainCubit = context.read<FoodMainCubit>();
  }

  @override
  void dispose() {
    foodMainCubit.increaseView(widget.productId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(widget.title,
          style: AppText.titleSM,
          textAlign: TextAlign.center,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis),
      actions: const [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(Icons.menu, size: 30, color: Colors.transparent),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<FoodMainCubit, FoodMainState>(builder: (context, state) {
      if (state is FoodMainInitial) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      } else if (state is FoodMainLoaded) {
        final product =
            state.productList.firstWhere((item) => item.id == widget.productId);
        return SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Image.asset(
                product.image ?? "",
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
                          int.tryParse(product.favorite ?? "0") ?? 0,
                          product.isLiked ?? false)),
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
                        int.tryParse(product.view ?? "0") ?? 0,
                      )),
                ),
              ),
            ]),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Text(product.intro ?? "", style: AppText.bodySM),
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
                        child: Text(product.ingredients ?? ""),
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
                        child: Text(product.instructions ?? ""),
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
