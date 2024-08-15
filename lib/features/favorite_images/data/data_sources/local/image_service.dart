import 'dart:convert';

import 'package:clean_architecture/features/favorite_images/data/models/image.dart';
import 'package:flutter/services.dart';

class ImageService {
  Future<List<ImageModel>> getImageList() async {
    final String response =
        await rootBundle.loadString("assets/jsons/images.json");
    final data = await json.decode(response);
    final List<ImageModel> imageData = data.map((item) {
      return ImageModel.fromJson(item);
    });

    return imageData;
  }
}
