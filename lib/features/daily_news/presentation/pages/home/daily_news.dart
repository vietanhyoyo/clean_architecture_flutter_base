import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNew extends StatelessWidget {
  const DailyNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is RemoteArticleError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        } else if (state is RemoteArticleDone) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleWidget(article: state.articles![index]);
              },
              itemCount: state.articles!.length);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
