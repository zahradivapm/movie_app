import 'package:flutter/material.dart';
import 'package:movie_app/config/config.dart';
import 'package:movie_app/models/Movie_model.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieModel.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Rating: '
            '${movieModel.voteAverage}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Overview: '
            '${movieModel.overview}',
          )
        ],
      ),
    );
  }
}
