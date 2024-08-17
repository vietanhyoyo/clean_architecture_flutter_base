import 'package:clean_architecture/features/favorite_images/domain/entities/image.dart';
import 'package:clean_architecture/features/favorite_images/presentation/cubit/favorite_image/favorite_image_cubit.dart';
import 'package:clean_architecture/features/favorite_images/presentation/widgets/image_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

class SwipeBody extends StatelessWidget {
  final List<ImageEntity> imageList;
  const SwipeBody({
    super.key,
    required this.imageList,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: 350,
      itemHeight: 650,
      itemBuilder: (context, index) {
        final image = imageList[index];
        return ImageCard(
          imageSrc: image.image ?? "",
          name: image.name ?? "",
          isLike: image.like ?? false,
          onLike: () {
            context.read<FavoriteImageCubit>().changeLike(index);
          },
        );
      },
      itemCount: imageList.length,
    );
  }
}
