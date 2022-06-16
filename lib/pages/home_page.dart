import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/genre_model.dart';
import 'package:flutter_codigo5_movieapp/models/movie_model.dart';
import 'package:flutter_codigo5_movieapp/services/api_services.dart';
import 'package:flutter_codigo5_movieapp/ui/general/colors.dart';
import 'package:flutter_codigo5_movieapp/ui/widgets/item_filter_widget.dart';
import 'package:flutter_codigo5_movieapp/ui/widgets/item_movie_list_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  List<MovieModel> moviesList = [];
  List<MovieModel> moviesListAux = [];
  List<GenreModel> genresList = [];
  final APIService _apiService = APIService();

  int indexFilter = 0;

  @override
  void initState() {
    super.initState();
    // getMovies();
    getData();
  }

  getData() async {
    // _apiService.getMovies().then((value) {
    //   moviesList = value;
    //   setState(() {
    //
    //   });
    // });
    moviesList = await _apiService.getMovies();
    moviesListAux = moviesList;
    genresList = await _apiService.getGenres();
    genresList.insert(0, GenreModel(id: 0, name: "All", selected: true));
    indexFilter = genresList[0].id;
    setState(() {});
  }

  filterMovie() {
    moviesList = moviesListAux;
    if (indexFilter != 0) {
      moviesList = moviesList
          .where((element) => element.genreIds.contains(indexFilter))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Mario",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Discover",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.5),
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(100.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Color(0xff23dec3),
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.black87.withOpacity(0.02),
                            backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(3.5),
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: Colors.redAccent,
                    //     gradient: LinearGradient(
                    //       begin: Alignment.topLeft,
                    //       end: Alignment.bottomRight,
                    //       colors: [
                    //         Color(0xff5de09c),
                    //         kBrandSecondaryColor,
                    //       ],
                    //     ),
                    //   ),
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(50.0),
                    //     child: Image.network(
                    //       "https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    //       height: 50,
                    //       width: 50,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: genresList
                        .map(
                          (e) => ItemFilterWidget(
                            textFilter: e.name,
                            isSelected: indexFilter == e.id,
                            onTap: () {
                              indexFilter = e.id;
                              print(indexFilter);
                              filterMovie();
                            },
                          ),
                        )
                        .toList(),

                    // [
                    //   ItemFilterWidget(
                    //     textFilter: "All",
                    //     isSelected: false,
                    //   ),
                    //   ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: moviesList.length,
                  // itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemMovieListwidget(
                      movieModel: moviesList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
