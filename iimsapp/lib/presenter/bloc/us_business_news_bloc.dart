import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iimsapp/models/us_business_news.dart';
import 'package:iimsapp/repository/imms_data_impl.dart';
import 'package:meta/meta.dart';

part 'us_business_news_event.dart';

part 'us_business_news_state.dart';

class UsBusinessNewsBloc
    extends Bloc<UsBusinessNewsEvent, UsBusinessNewsState> {
  UsBusinessNewsBloc() : super(UsBusinessNewsInitial());

  @override
  Stream<UsBusinessNewsState> mapEventToState(
    UsBusinessNewsEvent event,
  ) async* {
    //singleton instance of dataImplementer
    final IIMSDataImpl _iimsDataImpl = IIMSDataImpl.inst;

    if (event is FetchUsBusinessNews) {
      try {
        //this is the api call, dataSource calls its method to fetch data from api
        final UsBusinessNews? usBusinessNews =
            await _iimsDataImpl.iimsDataSource.fetchUsBusinessNews();

        //if usBusinessNews is not null, we pass that data to state

        if (usBusinessNews != null) {
          yield UsBusinessNewsFetched(usBusinessNews: usBusinessNews);
        } else {
          yield UsBusinessNewsFetchFail(
              failedReason: 'Sorry could\'nt fetch news data');
        }
      } catch (e) {
        yield UsBusinessNewsFetchFail(
            failedReason: 'Sorry could\'nt fetch news data');
      }
    }
  }
}
