part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {}

class GoToHomePage extends PageEvent {
  @override
  List<Object?> get props => [];
}

class GoToHistoryPage extends PageEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GoToShowVideoPage extends PageEvent {
  final Video video;
  GoToShowVideoPage(this.video);
  @override
  List<Object?> get props => [video];
}

class GoToChannelPage extends PageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
