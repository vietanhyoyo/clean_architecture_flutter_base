import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody(context));
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Home'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildCard(
            context,
            title: 'Todo List',
            route: Routes.todoList,
            icon: Icons.check_circle,
          ),
          const SizedBox(height: 16.0),
          _buildCard(
            context,
            title: 'Article',
            route: Routes.article,
            icon: Icons.article,
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title, required String route, required IconData icon}) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          size: 40.0,
          color: AppColors.primary,
        ),
        title: Text(title, style: const TextStyle(fontSize: 18.0)),
        onTap: () {
          Navigator.pushNamed(context, route);
          // FluroRouter.appRouter.navigateTo(context, route);
        },
      ),
    );
  }
}
