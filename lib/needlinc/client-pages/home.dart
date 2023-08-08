import 'package:flutter/material.dart';
import '../colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO Search bar
                  Container(
                    height: 40,
                    width: 400,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: NeedlincColors.black3,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.search),
                        SizedBox(width: 2),
                        VerticalDivider(thickness: 2,),
                        SizedBox(width: 4),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              // TODO: Perform search action here
                              // For simplicity, you can just print a message for now
                              print('Performing search for: $value');
                      },
                    ),
                  ),
                ],
              ),
            ),
            //TODO Write a post section
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
              color: NeedlincColors.black3,
            child: Column(
              children: [
                Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                            ),
                            fit: BoxFit.fill,
                          ),
                          color: NeedlincColors.black3,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8), child: Text("Write A Post"),)
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 50.0,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.photo_library_outlined, color: NeedlincColors.blue1,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined, color: NeedlincColors.blue1,))
                  ],
                )
              ],
             ),
            ),
            //TODO Individual post
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
              color: NeedlincColors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                            ),
                            fit: BoxFit.fill,
                          ),
                          color: NeedlincColors.black3,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("John Doe", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                Text("🟢 Now", style: TextStyle(fontSize: 9)),
                                IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
                              ],
                            ),
                            Text("~Electrician", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                            Text("📍John Paul's kitchen, eziobodor", style: TextStyle(fontSize: 12, color: NeedlincColors.black2))
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.star_border, size: 22,)),
                      SizedBox(width: 10.0,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined, size: 20,)),
                      SizedBox(width: 10.0,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.save_as_outlined, size: 20,)),
                      SizedBox(width: 10.0,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 20,))
                    ],
                  )
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}
