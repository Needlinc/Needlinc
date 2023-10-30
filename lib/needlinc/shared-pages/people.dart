import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:needlinc/needlinc/business-pages/profile.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/chat_UI.dart';

import '../client-pages/client-main.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {

  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  String? freelancerType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FREELANCERS",
          style: TextStyle(color: NeedlincColors.blue2, fontSize: 14),
        ),
        centerTitle: true,
        backgroundColor: NeedlincColors.white,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            height: 35,
            width: 300,
            margin: EdgeInsets.only(bottom: 5.0),
            padding: EdgeInsets.symmetric(horizontal: 18.0),
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
                      hintText: 'Search for others...',
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
          Container(
            color: NeedlincColors.white,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: ListView(
              physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategory("All", NeedlincColors.blue1),
                _buildCategory("Mechanic", NeedlincColors.blue3),
                _buildCategory("Tailor", NeedlincColors.blue3),
                _buildCategory("Barber", NeedlincColors.blue3),
                _buildCategory("Electrician", NeedlincColors.blue3),
                _buildCategory("Plumber", NeedlincColors.blue3),
                _buildCategory("Blogger", NeedlincColors.blue3),
              ],
            ),
          ),
          _buildFreelancerCard()
          //TODO Animation Widget
        ],
      ),
    );
  }

  Widget _buildCategory(String text, Color color) {
    return InkWell(
      onTap: (){
        freelancerType = text;
        setState(() {

        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        padding: EdgeInsets.all(4),
        child: Text(
          text,
          style: TextStyle(color: NeedlincColors.white),
        ),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildFreelancerCard() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      child: FutureBuilder<QuerySnapshot>(
        future: usersCollection.where('userCategory', isEqualTo: freelancerType).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            List<DocumentSnapshot> dataList = snapshot.data!.docs;
            return AnimationLimiter(
              child: ListView.builder(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = dataList[index].data() as Map<String, dynamic>;
                    if (data == null) {
                      // Handle the case when userDetails are missing in a document.
                      return Text("User details not found");
                    }
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        verticalOffset: -250,
                        child: ScaleAnimation(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 12.0),
                            decoration: BoxDecoration(
                              color: NeedlincColors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: NeedlincColors.black2.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            data['profilePicture'],
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        color: NeedlincColors.black3,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                           data['userName'],
                                            style:
                                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                          ),
                                          Text("~${data['userCategory']}",
                                              style: TextStyle(
                                                  fontSize: 13, fontWeight: FontWeight.w600)),
                                          Text("📍${data['address']}",
                                              style: TextStyle(
                                                  fontSize: 12, color: NeedlincColors.black2)),
                                          SizedBox(height: 25.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
                                                },
                                                child: Text("View Profile"),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      NeedlincColors.blue1),
                                                  shape:
                                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      side: BorderSide(color: Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Message()));
                                                },
                                                child: Text("Message"),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      NeedlincColors.blue1),
                                                  shape:
                                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      side: BorderSide(color: Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            );
          }
          // While waiting for the data to be fetched, show a loading indicator
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
