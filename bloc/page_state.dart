part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  // const PageState();

  // @override
  // List<Object> get props => [];
}

class PageInitial extends PageState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomePageLoaded extends PageState {
  final int pageIndex;
  HomePageLoaded(this.pageIndex);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HistoryPageLoaded extends PageState {
  final int pageIndex;
  HistoryPageLoaded(this.pageIndex);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ShowVideoPageLoaded extends PageState {
  final int pageIndex;
  final Video video;
  ShowVideoPageLoaded(this.pageIndex, this.video);
  @override
  // TODO: implement props
  List<Object?> get props => [pageIndex, video];
}

class ChannelPageLoaded extends PageState {
  final int pageIndex;
  ChannelPageLoaded(this.pageIndex);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
