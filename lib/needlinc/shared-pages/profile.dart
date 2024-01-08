import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/shared-pages/contracts.dart';
import 'package:needlinc/needlinc/shared-pages/edit-profile.dart';
import '../colors/colors.dart';
import '../shared-pages/auth-pages/welcome.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class broadcasts {
  String? text;
  String? picture;

  broadcasts({required this.text, required this.picture});
}

class posts {
  String? text;
  String? picture;

  posts({required this.text, required this.picture});
}

class marketPlace {
  String? text;
  String? picture;

  marketPlace({required this.text, required this.picture});
}

class _ProfilePageState extends State<ProfilePage> {
  bottomMenuBar() {
    showModalBottomSheet(
        showDragHandle: true,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Settings',
                      style: TextStyle(color: Colors.black)),
                  //  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));},
                ),
                const Divider(),
                ListTile(
                    title: const Text('Contracts',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  Contracts()))
                    }),
                const Divider(),
                ListTile(
                  title: const Text('Saved',
                      style: TextStyle(color: Colors.black)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            Contracts()))
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Reviews/Ratings',
                      style: TextStyle(color: Colors.black)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            Contracts()))
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Contact Us',
                      style: TextStyle(color: Colors.black)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            Contracts()))
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Help',
                      style: TextStyle(color: Colors.black)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            Contracts()))
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Log out',
                      style: TextStyle(color: Colors.red)),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                const Divider()
              ],
            ),
          );
        });
  }


  String? userId;
  static bool isBlogger = true;
  bool isBroadcast = true;
  bool isPosts = !isBlogger;
  bool isMarketPlace = false;



  static List<broadcasts> broadcastList = [
    broadcasts(
        text:
        'BROADCAST Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    broadcasts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture: null),
    broadcasts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    broadcasts(
        text: null,
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    broadcasts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
  ];

  static List<posts> postList = [
    posts(
        text:
        'POST Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    posts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture: null),
    posts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    posts(
        text: null,
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    posts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    posts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    posts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    posts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    posts(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
  ];

  static List<marketPlace> marketPlaceList = [
    marketPlace(
        text:
        'MARKETPLACE Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    marketPlace(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture: null),
    marketPlace(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    marketPlace(
        text: null,
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    marketPlace(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    marketPlace(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    marketPlace(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    marketPlace(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    marketPlace(
        text:
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
        picture:
        'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
  ];

  int listCounter = isBlogger ? broadcastList.length : postList.length;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the App Menu Bar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: NeedlincColors.blue1),
        title: Row(
          children: [
            const Text(
              '',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13,
              ),
            ),
            // if (isBlogger) const Icon(Icons.mic, size: 16)
          ],
        ),
        actions: [
          //  TODO Drop down menu for Profile page
          if (true)
            InkWell(
              onTap: bottomMenuBar,
              child: Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: const Icon(Icons.menu_sharp),
              ),
            )
        ],
        backgroundColor: NeedlincColors.white,
        elevation: 0,
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users') // Replace with your collection name
              .doc('${_auth.currentUser!.uid}') // Replace with your document ID
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: const Text("Something went wrong"));
            }
            if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
              var userData = snapshot.data?.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile Picture
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "${userData['profilePicture']}",
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 20),
                        // Name and profile details
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  userData['userId'] == _auth.currentUser!.uid ? '${userData['userName']}' : 'Emeka Doe',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600, fontSize: 16),
                                ),
                                if (isBlogger) Icon(Icons.mic, size: 22)
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${userData['phoneNumber']}",
                              style: GoogleFonts.arimo(
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${userData['email']}",
                              style: GoogleFonts.arimo(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // message or edit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (userData['userId'] == _auth.currentUser!.uid) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const editProfile()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          backgroundColor: NeedlincColors.blue1,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                        ),
                        child: Text(
                          userData['userId'] == _auth.currentUser!.uid ? 'Edit Profile' : 'Message',
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (userData['userId'] != _auth.currentUser!.uid)
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding: EdgeInsets.all(0),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    dialogMenu(
                                      'Add Rating',
                                      Icons.star,
                                      Colors.amber[400],
                                    ),
                                    dialogMenu(
                                      'Share profile link',
                                      Icons.link,
                                    ),
                                    dialogMenu(
                                      'Report this account',
                                      Icons.report,
                                      NeedlincColors.red,
                                    ),
                                    dialogMenu(
                                      'Block',
                                      Icons.block,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.pending_outlined,
                            size: 30,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Toggle options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (isBlogger) options('Broadcast', isBroadcast),
                      options('Posts', isPosts),
                      options('MarketPlace', isMarketPlace),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // posts / marketPlace Renderer
                  if (listCounter != 0)
                    Flexible(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: listCounter,
                          itemBuilder: (context, index) {
                            if (isBlogger) if (isBroadcast) {
                              return listBroadcastItems(
                                broadcastList[index].text,
                                broadcastList[index].picture,
                                index,
                              );
                            }
                            if (isPosts) {
                              return listPostItems(
                                postList[index].text,
                                postList[index].picture,
                                index,
                              );
                            }
                            if (isMarketPlace) {
                              return listMarketPlaceItems(
                                marketPlaceList[index].text,
                                marketPlaceList[index].picture,
                                index,
                              );
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                  if (listCounter == 0)
                    const Flexible(
                      child: Center(
                        child: Text(
                          'No Posts',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return const WelcomePage();
          },
        ),
      ),
    );
  }

  // ShowOption widget
  GestureDetector options(String text, bool activeOption) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case 'Broadcast':
            setState(() {
              isBroadcast = true;
              isPosts = false;
              isMarketPlace = false;
              listCounter = broadcastList.length;
            });
            break;
          case 'Posts':
            setState(() {
              isBroadcast = false;
              isPosts = true;
              isMarketPlace = false;
              listCounter = postList.length;
            });
            break;
          case 'MarketPlace':
            setState(() {
              isBroadcast = false;
              isPosts = false;
              isMarketPlace = true;
              listCounter = marketPlaceList.length;
            });
            break;
        }
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                color:
                activeOption ? NeedlincColors.blue1 : NeedlincColors.blue3),
          ),
          if (activeOption)
            Container(
              height: 2,
              width: 60,
              color: NeedlincColors.blue1,
            )
        ],
      ),
    );
  }

  // Show Dialog Widget
  Container dialogMenu(String text,
      [IconData? icon, Color? iconColor, Widget? location]) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: NeedlincColors.grey,
        border: Border.symmetric(
          horizontal: BorderSide(
              width: 0.5, color: NeedlincColors.black1.withOpacity(0.5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          Text(text),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              color: NeedlincColors.blue2,
            ),
          )
        ],
      ),
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;




// Broadcast list container
Padding listBroadcastItems(String? text, String? picture, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    child: AnimationConfiguration.staggeredList(
      position: index,
      delay: Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: Container(
            decoration: BoxDecoration(
              color: NeedlincColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (text != null) Text(text),
                  const SizedBox(height: 8),
                  if (picture != null)
                    Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(picture),
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  // Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: NeedlincColors.red,
                            ),
                          ),
                          const Text('400'),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.maps_ugc_outlined),
                          ),
                          const Text('400'),
                        ],
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark, color: Colors.amber[300]),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// Post list container
Padding listPostItems(String? text, String? picture, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    child: AnimationConfiguration.staggeredList(
      position: index,
      delay: const Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: Container(
            decoration: BoxDecoration(
              color: NeedlincColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (text != null) Text(text),
                  const SizedBox(height: 8),
                  if (picture != null)
                    Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(picture),
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  // Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: NeedlincColors.red,
                            ),
                          ),
                          const Text('400'),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.maps_ugc_outlined),
                          ),
                          const Text('400'),
                        ],
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark, color: Colors.amber[300]),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// market list container
Padding listMarketPlaceItems(String? text, String? picture, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    child: AnimationConfiguration.staggeredList(
      position: index,
      delay: Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: Container(
            decoration: BoxDecoration(
              color: NeedlincColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (text != null) Text(text),
                  const SizedBox(height: 8),
                  if (picture != null)
                    Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(picture),
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  // Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: NeedlincColors.white,
                        ),
                        label: const Text(
                          'Buy',
                          style: TextStyle(color: NeedlincColors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: NeedlincColors.blue1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: NeedlincColors.red,
                            ),
                          ),
                          const Text('400'),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.maps_ugc_outlined),
                          ),
                          const Text('400'),
                        ],
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark, color: Colors.amber[300]),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
