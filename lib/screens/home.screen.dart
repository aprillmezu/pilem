import 'package:flutter/material.dart';
import 'package:pilem/servics/api.service.dart';

class homeSreen extends StatefulWidget {
  const homeSreen({super.key});

  @override
  State<homeSreen> createState() => _homeSreenState();
}

class _homeSreenState extends State<homeSreen> {
  final ApiService _apiService = ApiService();

  List<Movie> _allMovies = [];
  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<void> _loadMovies() async{

  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Movie {
}
