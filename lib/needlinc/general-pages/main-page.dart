import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/client-pages/marketplace.dart';
import 'package:needlinc/needlinc/client-pages/notifications.dart';
import 'package:needlinc/needlinc/client-pages/people.dart';
import 'package:needlinc/needlinc/client-pages/home.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../client-pages/profile.dart';

class NeedlincMainPage extends StatefulWidget {
  const NeedlincMainPage({Key? key}) : super(key: key);

  @override
  State<NeedlincMainPage> createState() => _NeedlincMainPageState();
}

class _NeedlincMainPageState extends State<NeedlincMainPage> {

  int _currentPage = 0;

  //TODO(Already done) This List is for Icons that are active
  List<IconData> _activeIcons = [
    Icons.home,
    Icons.shop,
    Icons.people,
    Icons.notifications,
    Icons.person,
  ];

  //TODO(Already done) This List is for Icons that are inactive
  List<IconData> _inactiveIcons = [
    Icons.home_outlined,
    Icons.shop_outlined,
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
      //TODO(Already done) This is the App Menu Bar
      drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'Side menu',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/cover.jpg'))),
                ),
                ListTile(
                  leading: Icon(Icons.input),
                  title: Text('Welcome'),
                  onTap: () => {Navigator.of(context).pop},
                ),
                ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text('Profile'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.border_color),
                  title: Text('Feedback'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
              ],
            ),
          ),
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
        //TODO(Already done) This is the AppBar
      appBar: AppBar(
        backgroundColor: NeedlincColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: NeedlincColors.blue1),
        title: Center(child: Text("Needlinc", style: TextStyle(fontSize: 15,color: NeedlincColors.blue1),)),
        actions: [IconButton(
          padding: EdgeInsets.symmetric(horizontal: 10),
            icon: Icon(Icons.message),
          onPressed: (){
            //TODO Chat messaging feature
          },
        ),]
      ),
        //TODO(Already done) This is the App Body
      body: PageTransition(_currentPage)
    );
  }
}
