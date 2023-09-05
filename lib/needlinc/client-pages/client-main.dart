import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/client-pages/marketplace.dart';
import 'package:needlinc/needlinc/client-pages/notifications.dart';
import 'package:needlinc/needlinc/shared-pages/people.dart';
import 'package:needlinc/needlinc/client-pages/home.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'profile.dart';

class ClientMainPages extends StatefulWidget {
  int? currentPage;
  ClientMainPages({required this.currentPage});

  @override
  State<ClientMainPages> createState() => _ClientMainPagesState();
}

class _ClientMainPagesState extends State<ClientMainPages> {

  int? _currentPage;

  @override
  void initState() {
    // TODO: implement initState
    _currentPage = (widget.currentPage == null ? 0 : widget.currentPage)!;
    super.initState();
  }

  //TODO(Already done) This List is for Icons that are active
  List<IconData> _activeIcons = [
    Icons.home,
    Icons.shopping_cart,
    Icons.people,
    Icons.notifications,
    Icons.person,
  ];

  //TODO(Already done) This List is for Icons that are inactive
  List<IconData> _inactiveIcons = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.people_outline,
    Icons.notifications_none,
    Icons.person_outline,
  ];

  //TODO(Already done) This is widget switches pages on a selected tap
  Widget PageTransition(int currentPage){
    switch(currentPage){
      case 0: return HomePage();
      case 1: return MarketplacePage();
      case 2: return PeoplePage();
      case 3: return NotificationsPage();
      case 4: return ProfilePage();
      default: return HomePage();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the Bottom Navigation bar
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: NeedlincColors.black3,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index){
            setState(() {});
            _currentPage = index;
          },
          items: List.generate(
            _activeIcons.length,
                (index) {
              return _currentPage == index
                  ? Icon((_activeIcons[index]),color: NeedlincColors.blue1) : (Icon(_inactiveIcons[index])
              );
            },
          ),
        ),
        //TODO(Already done) This is the App Body
        body: PageTransition(_currentPage!),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text("Get\nOut"),
      ),
    );
  }
}
