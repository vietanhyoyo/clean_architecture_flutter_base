import 'package:clean_architecture/features/shopping/presentation/widgets/image_slider.dart';
import 'package:flutter/material.dart';

class ShoppingHomePage extends StatelessWidget {
  const ShoppingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody(context));
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Shopping'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: ImageSlider(),
        ),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: Text("Shopping"))),
      ],
    );
  }
}
