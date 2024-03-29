import 'package:flutter/material.dart';
import '../Screens/tv_details_page.dart';

class PopularTVShows extends StatelessWidget {
  const PopularTVShows({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsTV(tvShows: snapshot.data[index]),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 200,
                      width: 150,
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500/${snapshot.data[index].posterPath}',
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
