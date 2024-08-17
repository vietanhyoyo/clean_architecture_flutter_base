import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageCard extends StatefulWidget {
  final String imageSrc;
  final String name;
  final bool isLike;
  final void Function()? onLike;
  const ImageCard(
      {super.key,
      required this.imageSrc,
      required this.isLike,
      this.onLike,
      required this.name});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  late bool _isLike;

  @override
  void initState() {
    super.initState();
    _isLike = widget.isLike;
  }

  void _toggleLike() {
    setState(() {
      _isLike = !_isLike;
    });
    if (widget.onLike != null) {
      widget.onLike!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: widget.imageSrc,
        imageBuilder: (context, imageProvider) => Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 14, end: 14, bottom: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: GridTile(
                  footer: GridTileBar(
                    leading: Column(
                      children: [
                        GestureDetector(
                          onTap: _toggleLike,
                          child: Icon(
                            Icons.favorite,
                            size: 30,
                            color: _isLike ? AppColors.red : AppColors.white,
                          ),
                        ),
                        const Text("Like image",
                            style:
                                TextStyle(fontSize: 10, color: AppColors.white))
                      ],
                    ),
                    title: const Text(""),
                    trailing: Text(widget.name,
                        style: const TextStyle(color: AppColors.white)),
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
        progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
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
  }
}
