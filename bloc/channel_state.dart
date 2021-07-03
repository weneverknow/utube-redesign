part of 'channel_bloc.dart';

abstract class ChannelState extends Equatable {
  // const ChannelState();

  // @override
  // List<Object> get props => [];
}

class ChannelInitial extends ChannelState {
  @override
  List<Object?> get props => [];
}

class ChannelLoaded extends ChannelState {
  final Channel? channel;
  ChannelLoaded(this.channel);
  @override
  List<Object?> get props => [channel];
}

class ChannelForPreviewLoaded extends ChannelState {
  final Channel channel;
  ChannelForPreviewLoaded(this.channel);
  @override
  // TODO: implement props
  List<Object?> get props => [channel];
}
