import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:you_tube/bloc/page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, this.currentIndex}) : super(key: key);
  final int? currentIndex;

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int? selectedIndex;
  //final pagesEvent = [GoToHomePage(), GoToHistoryPage()];
  @override
  Widget build(BuildContext context) {
    final blocState = context.read<PageBloc>();
    // int blocPageIndex = context.select<PageBloc, int>((bloc) {
    //   return (bloc is PageState) ? ((bloc.state is HomePageLoaded)?bloc.state as HomePageLoaded) : 0;
    // });
    return BottomNavigationBar(
        currentIndex: widget.currentIndex ?? 0,
        elevation: 0,
        selectedItemColor: Colors.red.shade100,
        backgroundColor: Color(0xFF131212),
        //unselectedItemColor: Theme.of(context).primaryColor,
        //showSelectedLabels: false,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            blocState.add(GoToHomePage());
          } else if (index == 2) {
            blocState.add(GoToHistoryPage());
          } else if (index == 3) {
            blocState.add(GoToChannelPage());
          }
          setState(() {
            selectedIndex = index;
          });
        },
        //fixedColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            icon: Icon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(Icons.explore_outlined),
              label: 'Explore'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(Icons.subscriptions_outlined),
              label: 'History'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(Icons.library_books_outlined),
              label: 'Library'),
        ]);
  }
}
