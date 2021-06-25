part of 'us_business_news_bloc.dart';

@immutable
abstract class UsBusinessNewsEvent {}

class FetchUsBusinessNews extends UsBusinessNewsEvent {
  final String? newsType;

  FetchUsBusinessNews({this.newsType});
}

