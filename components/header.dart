import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_tube/bloc/channel_bloc.dart';
//import 'package:you_tube/models/channel.dart';
import 'package:shimmer/shimmer.dart';
import 'package:you_tube/bloc/page_bloc.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/launcher_logo.png'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'BathTube',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.videocam_outlined,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search_outlined,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.notifications_none_outlined,
                  ),
                ),
                BlocBuilder<ChannelBloc, ChannelState>(
                  builder: (context, state) {
                    if (state is ChannelLoaded) {
                      var myChannel = state.channel;
                      return GestureDetector(
                        onTap: () {
                          context.read<PageBloc>().add(GoToChannelPage());
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // image: DecorationImage(
                            //     image: NetworkImage(myChannel!.profilePict),
                            //     fit: BoxFit.cover)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                myChannel!.profilePict,
                                width: 32,
                                height: 32,
                              )),
                        ),
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Color(0xFFC0C0C0),
                        highlightColor: Color(0xFFF5F5F5),
                        child: Container(
                          width: 32,
                          height: 32,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
