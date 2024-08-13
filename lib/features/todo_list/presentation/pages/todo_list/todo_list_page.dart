import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody());
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Todo List', style: TextStyle(color: Colors.black)),
    );
  }

  _buildBody() {
    return const Center(child: Text("Todo list"));
  }
}
