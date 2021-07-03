import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:you_tube/models/video.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToHomePage) {
      yield HomePageLoaded(0);
    } else if (event is GoToHistoryPage) {
      yield HistoryPageLoaded(2);
    } else if (event is GoToShowVideoPage) {
      yield ShowVideoPageLoaded(1, event.video);
    } else if (event is GoToChannelPage) {
      yield ChannelPageLoaded(3);
    }
  }
}
