import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_model.dart';
import 'package:flutter_codigo5_movieapp/pages/movie_detail_page.dart';

class ItemMovieListwidget extends StatelessWidget {
  MovieModel movieModel;
  ItemMovieListwidget({required this.movieModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailPage(
                      movieId: movieModel.id,

                      //movieDetailModel:  ,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 14.0,
        ),
        width: double.infinity,
        height: height * 0.65,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(4, 4),
              blurRadius: 12.0,
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "http://image.tmdb.org/t/p/w500${movieModel.posterPath}",

              ///"http://image.tmdb.org/t/p/w500${movies[index]["poster_path"]}",
              // "https://images.pexels.com/photos/1921168/pexels-photo-1921168.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(22),
                    bottomLeft: Radius.circular(22),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movieModel.originalTitle,
                      //  moviesList[index].originalTitle,
                      //  movies[index]["original_title"],
                      // movies[index]["original_title"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      movieModel.overview,
                      //    moviesList[index].overview,
                      // movies[index]["overview"],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13.0,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              movieModel.releaseDate
                                  .toString()
                                  .substring(0, 10),
                              // moviesList[index]
                              //     .releaseDate
                              //     .toString()
                              //     .substring(0, 10),
                              // movies[index]["release_date"],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up_alt,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              movieModel.voteCount.toString(),
                              // moviesList[index].voteCount.toString(),
                              // movies[index]["vote_count"]
                              //    .toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(14.0),
                margin: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  movieModel.voteAverage.toString(),
                  // moviesList[index].voteAverage.toString(),
                  //movies[index]["vote_average"].toString(),
                  // "5.3",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
