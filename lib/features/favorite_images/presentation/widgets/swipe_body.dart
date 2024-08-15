import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

class SwipeBody extends StatelessWidget {
  const SwipeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: 350,
      itemHeight: 650,
      itemBuilder: (context, index) {
        return CachedNetworkImage(
            imageUrl:
                "https://i.pinimg.com/564x/73/a6/de/73a6dec854967ddfeeb5da5cc6d08810.jpg",
            imageBuilder: (context, imageProvider) => Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 14, end: 14, bottom: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: GridTile(
                      footer: const GridTileBar(
                        leading: Column(
                          children: [
                            Icon(Icons.favorite, size: 30),
                            Text("Like image",
                                style: TextStyle(
                                    fontSize: 10, color: AppColors.white))
                          ],
                        ),
                        title: Text(""),
                        trailing: Text("Image 01",
                            style: TextStyle(color: AppColors.white)),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.9),
                                  Colors.black.withOpacity(0.1),
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                ],
                                begin: Alignment
                                    .bottomCenter, // Gradient starts at the bottom
                                end: Alignment.topCenter, // and ends at the top
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 14, end: 14, bottom: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                  ),
                ),
            errorWidget: (context, url, error) => Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 14, end: 14, bottom: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                      ),
                      child: const Icon(Icons.error),
                    ),
                  ),
                ));
      },
      itemCount: 3,
    );
  }
}
