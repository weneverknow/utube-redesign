import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:you_tube/models/channel.dart';
import 'package:you_tube/services/channel_service.dart';

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelInitial());

  @override
  Stream<ChannelState> mapEventToState(
    ChannelEvent event,
  ) async* {
    if (event is LoadChannel) {
      Channel channel =
          await ChannelService.getChannel(channelId: event.channelId);
      yield ChannelLoaded(channel);
    } else if (event is LoadChannelForPreview) {
      Channel channel =
          await ChannelService.getChannel(channelId: event.channelId);
      yield ChannelForPreviewLoaded(channel);
    }
  }
}
