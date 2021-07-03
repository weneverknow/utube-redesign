part of 'channel_bloc.dart';

abstract class ChannelEvent extends Equatable {}

class LoadChannel extends ChannelEvent {
  final String? channelId;
  LoadChannel(this.channelId);

  @override
  List<Object?> get props => [channelId];
}

class LoadChannelForPreview extends ChannelEvent {
  final String channelId;
  LoadChannelForPreview({required this.channelId});
  @override
  List<Object?> get props => [channelId];
}
