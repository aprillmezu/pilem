import 'package:flutter/material.dart';
import "package:pab2/servics/api_service.dart";

import '../models/movie.dart';
import '../servics/api.service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  List<Movie> _allMovies = [];
  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    final List<Map<String, dynamic>> allMoviesData = await _apiService.getAllMovies();
    final List<Map<String, dynamic>> trendingMoviesData = await _apiService.getTrendingMovies();
    final List<Map<String, dynamic>> popularMoviesData = await _apiService.getPopularMovies();

    setState(() {
      _allMovies = allMoviesData.map((e) => Movie.fromJson(e)).toList();
      _trendingMovies = trendingMoviesData.map((e) => Movie.fromJson(e)).toList();
      _popularMovies = popularMoviesData.map((e) => Movie.fromJson(e)).toList();
    });
  }

  Widget_buildMovieList (String title, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ). // TextStyle
          ), // Text
        ), // Padding

        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                final Movie movie = movies [index];
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4),
                      Text(
                          movie.title.length > 14
                              ? '${movie.title.substring(0, 10)}...'
                              : movie.title), // Text
                    ],

                  ), // Column

                ); // GestureDetector

              }

          ), // ListView.builder

        ) // SizedBox

      ],

    ); // Column

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        title: Text('Pilem'),
    ), // AppBar
    body: SingleChildScrollView(
    child: Column(
        _buildMovieList("All Movies", _allMovies),
     ],
     ), // Column
    ), // SingleChildScrollView
    );// Scaffold
  }
}



