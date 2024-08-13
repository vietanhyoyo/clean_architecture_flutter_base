import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody());
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Home', style: TextStyle(color: Colors.black)),
    );
  }

  _buildBody() {
    return const Center(child: Text("Home"));
  }
}
