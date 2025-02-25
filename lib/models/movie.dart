import 'dart:convert';

class Movie {
  final int id;
  final String title;
  final String Overview;
  final String posterPath;
  final String backdropPath;
  final String rilisDate;
  final double VotaAverage;

  Movie(
  {required this.id,
  required this.title,
  required this.Overview,
  required this.posterPath,
  required this.backdropPath,
  required this.rilisDate,
  required this. VotaAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
      id: json['id'],
      title: json['title'],
      Overview: json['Overview'],
      posterPath: json['posterPath'],
      backdropPath: json['backdropPath'],
      rilisDate: json['rilisDate'],
      VotaAverage: json['VotaAverage']);
  }
}