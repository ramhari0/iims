part of 'us_business_news_bloc.dart';

@immutable
abstract class UsBusinessNewsState {}

class UsBusinessNewsInitial extends UsBusinessNewsState {}

class UsBusinessNewsFetched extends UsBusinessNewsState {
  final UsBusinessNews? usBusinessNews;

  UsBusinessNewsFetched({this.usBusinessNews});
}

class UsBusinessNewsFetchFail extends UsBusinessNewsState {
  final String? failedReason;

  UsBusinessNewsFetchFail({this.failedReason});
}

