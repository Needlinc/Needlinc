import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/client-pages/profile.dart';
import '../../main.dart';
import '../colors/colors.dart';
import 'comments.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the App Menu Bar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: DrawerHeader(
                child: Stack(
                  children: [
                    //TODO Blurred overlay using BackdropFilter
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: NeedlincColors.blue2.withOpacity(0.5),
                        width: 0.001,
                        height: 0.001,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: NeedlincColors.blue3,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 4)));
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Richard John", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                                    Container(color: NeedlincColors.black2, width: 180, height: 2.0, margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: NeedlincColors.blue2,),
              title: const Text('Settings', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RootPage()))},
            ),
            const Divider(),
            const ListTile(
                leading: Icon(Icons.input, color: NeedlincColors.blue2,),
                title: Text('Back to Home', style: TextStyle(color: NeedlincColors.blue2)),
               // onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 0)))}
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.shopping_cart_outlined, color: NeedlincColors.blue2,),
              title: Text('Marketplace', style: TextStyle(color: NeedlincColors.blue2)),
            //  onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 1)))},
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.people_outline, color: NeedlincColors.blue2),
              title: Text('Freelancers', style: TextStyle(color: NeedlincColors.blue2)),
            //  onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 2)))},
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.notifications, color: NeedlincColors.blue2,),
              title: Text('Notifications', style: TextStyle(color: NeedlincColors.blue2)),
             // onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 3)))},
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.person_outline, color: NeedlincColors.blue2,),
              title: Text('Profile', style: TextStyle(color: NeedlincColors.blue2)),
           //   onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 4)))},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.question_mark, color: NeedlincColors.blue2,),
              title: const Text('FAQs/Help', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.headset_mic, color: NeedlincColors.blue2,),
              title: const Text('Contact Us', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      //TODO(Already done) This is the AppBar

      body: SafeArea(
        child: Stack(
          children: [
            //TODO Blurred duplicate background
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO Search bar
                  Container(
                    height: 40,
                    width: 400,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: NeedlincColors.black3,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.search),
                        const SizedBox(width: 2),
                        const VerticalDivider(thickness: 2,),
                        const SizedBox(width: 4),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
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
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsets.only(top: 10, bottom: 10,),
                        decoration: BoxDecoration(
                          color: NeedlincColors.black3,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                //TODO Profile Picture
                                GestureDetector(
                                  onTap: ()
                                  {

                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15.0),
                                    margin: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
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
                                ),
                                //TODO Write a post
                                GestureDetector(
                                    onTap: ()
                                    {
                                     // Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()),);
                                    },
                                    child: const Padding(padding: EdgeInsets.all(8), child: Text("Write A Post"),))
                              ],
                            ),
                            //TODO Select Gallary or Camera icon
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 50.0,),
                              //   IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));}, icon: Icon(Icons.photo_library_outlined, color: NeedlincColors.blue1,)),
                              //   IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));}, icon: Icon(Icons.camera_alt_outlined, color: NeedlincColors.blue1,))
                               ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  //TODO Individual post
                  for(int individualPost = 0; individualPost < 2; individualPost++)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
                      color: NeedlincColors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
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
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("John Doe", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                        const Text("🟢 Now", style: TextStyle(fontSize: 9)),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
                                      ],
                                    ),
                                    const Text("~Electrician", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                    const Text("📍John Paul's kitchen, eziobodor", style: TextStyle(fontSize: 12, color: NeedlincColors.black2))
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 30.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border, size: 22,)),
                                  const Text("1.2K", style: TextStyle(fontSize: 10))
                                ],
                              ),
                              const SizedBox(width: 10.0,),
                              Row(
                                children: [
                                  IconButton(onPressed: ()
                                  {
                              //      Navigator.push(context, MaterialPageRoute(builder: (context) => const CommentsPage()));
                                  }, icon: const Icon(Icons.comment_outlined, size: 20,)),
                                  const Text("200", style: TextStyle(fontSize: 10))
                                ],
                              ),
                              const SizedBox(width: 10.0,),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border, size: 20,)),
                              const SizedBox(width: 10.0,),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: 20,))
                            ],
                          )
                        ],
                      ),
                    ),
                ]
            ),
            //TODO seperation
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: NeedlincColors.blue2.withOpacity(0.5),
                width: 0.001,
                height: 0.001,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.95,
              margin: const EdgeInsets.only(top: 50.0),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: NeedlincColors.blue2.withOpacity(0.5),
                        width: 0.001,
                        height: 0.001,
                      ),
                    ),

                    for(int newsPost = 0; newsPost < 16; newsPost++)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 40, bottom: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: NeedlincColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: NeedlincColors.black2.withOpacity(0.5), // Shadow color
                                spreadRadius: 8, // Spread radius
                                blurRadius: 10, // Blur radius
                                offset: const Offset(0, 6), // Offset in the form of (dx, dy)
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
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
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("John Doe", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                          const Text("🟢 Now", style: TextStyle(fontSize: 9)),
                                          IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
                                        ],
                                      ),
                                      const Text("~Electrician", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                      const Text("📍John Paul's kitchen, eziobodor", style: TextStyle(fontSize: 12, color: NeedlincColors.black2))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30.0,),
                            //TODO Icons on each news post
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border, size: 22,)),
                                    const Text("1.2K", style: TextStyle(fontSize: 10))
                                  ],
                                ),
                                const SizedBox(width: 10.0,),
                                Row(
                                  children: [
                                    IconButton(
                                    onPressed: ()
                                    {
                          //            Navigator.push(context, MaterialPageRoute(builder: (context) => const CommentsPage()));
                                    },
                                     icon: const Icon(Icons.comment_outlined, size: 20,)),
                                    const Text("200", style: TextStyle(fontSize: 10))
                                  ],
                                ),
                                const SizedBox(width: 10.0,),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border, size: 20,)),
                                const SizedBox(width: 10.0,),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: 20,))
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0),
              decoration: BoxDecoration(
                  color: NeedlincColors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: NeedlincColors.black2.withOpacity(0.5), // Shadow color
                  //     spreadRadius: 8, // Spread radius
                  //     blurRadius: 10, // Blur radius
                  //     offset: Offset(0, 6), // Offset in the form of (dx, dy)
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(20)
              ),
              child: InkWell(
                onTap: ()
                {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      border: Border.all(color: NeedlincColors.blue2)
                  ),
                  child: const Row(
                    children: [
                      Text("Close"),
                      Icon(Icons.arrow_forward_ios_rounded,)
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
