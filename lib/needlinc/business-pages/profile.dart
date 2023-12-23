import 'package:flutter/material.dart';
import '../backend/authentication/logout.dart';
import '../colors/colors.dart';
import 'business-main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class reviews {
  String name;
  int rating;
  String review;
  reviews({required this.name, required this.rating, required this.review});
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
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: NeedlincColors.blue2,
                  ),
                  title: Text('Settings',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  // onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()))},
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
                                      BusinessMainPages(currentPage: 0)))
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
                        builder: (context) =>
                            BusinessMainPages(currentPage: 1)))
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
                        builder: (context) =>
                            BusinessMainPages(currentPage: 2)))
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
                        builder: (context) =>
                            BusinessMainPages(currentPage: 3)))
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
                        builder: (context) =>
                            BusinessMainPages(currentPage: 4)))
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
                  child: InkWell(
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

  bool isBlogger = true;
  bool isOwner = true;
  bool isCoverPhoto = true;
  bool isReviews = true;
  bool isPosts = false;
  bool isMarketPlace = false;
  static List<reviews> reviewList = [
    reviews(name: 'Esther Howard', rating: 4, review: 'Nice working with you'),
    reviews(
        name: 'Annette Black',
        rating: 5,
        review:
            'Lets just leave it this way, but Bobby is just recovering so that will be on hold till further notice.'),
    reviews(
        name: 'Black Marvin',
        rating: 3,
        review:
            'I think that better, were suppose to upload the app to play store this week,'),
    // reviews(
    //     name: 'Jenny Wilson',
    //     rating: 1,
    //     review:
    //         'hopefully December the app will be complete and ready for testing directly on the play store.'),
    reviews(
        name: 'Jerome Bell',
        rating: 2,
        review: 'Nice work tho, but you dint do exactly as i wanted'),
    reviews(
        name: 'Oguzie-Ibeh Richard',
        rating: 3,
        review: 'Nice work, but the job had errors after you left'),
    reviews(
        name: 'Ebolom Mcsaint', rating: 5, review: 'Nice but EXPENSIVE work'),
    reviews(
        name: 'Nmesoma Chiwuba',
        rating: 4,
        review: 'Try to clean up your workspace after working'),
    reviews(name: 'Wade Warren', rating: 5, review: 'Excellent work man'),
  ];

  static List<posts> postList = [
    // posts(
    //     text:
    //         'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
    //     picture:
    //         'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    // posts(
    //     text:
    //         'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
    //     picture: null),
    // posts(
    //     text:
    //         'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
    //     picture:
    //         'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    // posts(
    //     text: null,
    //     picture:
    //         'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    // posts(
    //     text:
    //         'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
    //     picture:
    //         'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    // posts(
    //     text:
    //         'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
    //     picture:
    //         'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    // posts(
    //     text:
    //         'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
    //     picture:
    //         'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    // posts(
    //     text:
    //         'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
    //     picture:
    //         'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
    // posts(
    //     text:
    //         'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
    //     picture:
    //         'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
  ];

  static List<marketPlace> marketPlaceList = [
    marketPlace(
        text:
            'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur ma',
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

  int listCounter = reviewList.length;

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
        shape: const Border(
          bottom: BorderSide(color: NeedlincColors.blue2),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 180,
              child: Stack(
                children: [
                  // cover photo
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: NeedlincColors.grey,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: isCoverPhoto
                              ? const NetworkImage(
                                  'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1')
                              : const NetworkImage(' '),
                        ),
                      ),
                    ),
                  ),
                  // Profile Picture
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.only(top: 55),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.G12T_MUuIKWw7XklDIqzhwHaE8?pid=ImgDet&rs=1'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and profile details
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '~Electrician',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: NeedlincColors.red,
                        size: 16,
                      ),
                      Text(
                        'John paul Kitchen, eziobodo',
                        style: TextStyle(
                          color: NeedlincColors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '7 years Experience',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // message or edit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          backgroundColor: NeedlincColors.blue1,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 8),
                        ),
                        child: Text(
                          isOwner ? 'Edit Profile' : 'Message',
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (!isOwner)
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.pending_outlined,
                            size: 30,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Rating & Review
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 53,
                        height: 55,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(),
                                ),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  Text("7.9"),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text("Rating"),
                          ],
                        ),
                      ),
                      const SizedBox(width: 70),
                      SizedBox(
                        width: 53,
                        height: 55,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(),
                                ),
                              ),
                              child: Text('${reviewList.length}'),
                            ),
                            const SizedBox(height: 5),
                            const Text("Reviews"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Options('Reviews', isReviews),
                        Options('Posts', isPosts),
                        Options('MarketPlace', isMarketPlace),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Review / posts / marketPlace Renderer
            if (listCounter != 0)
              Flexible(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listCounter,
                  itemBuilder: (context, index) {
                    if (isReviews) {
                      return listReviewItems(
                        reviewList[index].name,
                        reviewList[index].rating,
                        reviewList[index].review,
                      );
                    }
                    if (isPosts) {
                      return listPostItems(
                        postList[index].text,
                        postList[index].picture,
                      );
                    }
                    if (isMarketPlace) {
                      return listMarketPlaceItems(
                        marketPlaceList[index].text,
                        marketPlaceList[index].picture,
                      );
                    }
                    return null;
                  },
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
        ),
      ),
    );
  }

  // ShowOption widget
  GestureDetector Options(String text, bool activeOption) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case 'Reviews':
            setState(() {
              isReviews = true;
              isPosts = false;
              isMarketPlace = false;
              listCounter = reviewList.length;
            });
            break;
          case 'Posts':
            setState(() {
              isReviews = false;
              isPosts = true;
              isMarketPlace = false;
              listCounter = postList.length;
            });
            break;
          case 'MarketPlace':
            setState(() {
              isReviews = false;
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
}

// Review list container
Padding listReviewItems(String name, int rate, String review) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(182, 203, 226, 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(
                    rate,
                    (index) => Icon(
                      Icons.star,
                      color: Colors.amber[300],
                      size: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(review)
          ],
        ),
      ),
    ),
  );
}

// Post list container
Padding listPostItems(String? text, String? picture) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
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
  );
}

// market list container
Padding listMarketPlaceItems(String? text, String? picture) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
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
                  icon: const Icon(Icons.shopping_cart_outlined),
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
  );
}
