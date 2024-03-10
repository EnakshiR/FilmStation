import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions/movie_list.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.movie});

  final MovieLists movie;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(top: 16, left: 16),
              decoration: const BoxDecoration(color: Colors.black),
            )
          )
        ]
      )
    )
  }
}
