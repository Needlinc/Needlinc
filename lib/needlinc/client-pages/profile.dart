import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../backend/authentication/logout.dart';
import '../colors/colors.dart';
import 'client-main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
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
                  leading: const Icon(
                    Icons.settings,
                    color: NeedlincColors.blue2,
                  ),
                  title: const Text('Settings',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const RootPage()))
                  },
                ),
                const Divider(),
                ListTile(
                    leading: const Icon(
                      Icons.input,
                      color: NeedlincColors.blue2,
                    ),
                    title: const Text('Back to Home',
                        style: TextStyle(color: NeedlincColors.blue2)),
                    onTap: () => {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ClientMainPages(currentPage: 0)))
                        }),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_cart_outlined,
                    color: NeedlincColors.blue2,
                  ),
                  title: const Text('Marketplace',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ClientMainPages(currentPage: 1)))
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.people_outline,
                      color: NeedlincColors.blue2),
                  title: const Text('Freelancers',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ClientMainPages(currentPage: 2)))
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.notifications,
                    color: NeedlincColors.blue2,
                  ),
                  title: const Text('Notifications',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ClientMainPages(currentPage: 3)))
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.person_outline,
                    color: NeedlincColors.blue2,
                  ),
                  title: const Text('Profile',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ClientMainPages(currentPage: 4)))
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.question_mark,
                    color: NeedlincColors.blue2,
                  ),
                  title: const Text('FAQs/Help',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.headset_mic,
                    color: NeedlincColors.blue2,
                  ),
                  title: const Text('Contact Us',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      signOutUser();

                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('//', (route) => false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        "Sign Out/Log Out",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  bool isOwner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the App Menu Bar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: NeedlincColors.blue1),
        title: const Text(
          "John Doe",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 13,
          ),
        ),
        actions: [
          // TODO Drop down menu for Profile page
          if (isOwner)
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                // Profile Picture
                Container(
                  padding: const EdgeInsets.all(40),
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                      ),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                // Name and profile details
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Emeka John",
                      style: GoogleFonts.dosis(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "070 8786 0987",
                      style: GoogleFonts.arimo(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "debra.holt@example.com",
                      style: GoogleFonts.arimo(
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
            // message or edit button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                backgroundColor: NeedlincColors.blue1,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              ),
              child: Text(
                isOwner ? 'Edit Profile' : 'Message',
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 15),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Account Information",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Your Posts",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Saved & Favourited",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Contracts",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Transaction History",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Privacy Settings",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Reviews/Ratings",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Help/Support",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
