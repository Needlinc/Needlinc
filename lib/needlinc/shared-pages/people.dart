import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:needlinc/needlinc/business-pages/profile.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/chat_UI.dart';


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
        title: const Text(
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
            margin: const EdgeInsets.only(bottom: 5.0),
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: ListView(
              physics:
              const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: const TextStyle(color: NeedlincColors.white),
        ),
      ),
    );
  }

  Widget _buildFreelancerCard() {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: FutureBuilder<QuerySnapshot>(
        future: usersCollection.where('userCategory', isEqualTo: freelancerType).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            List<DocumentSnapshot> dataList = snapshot.data!.docs;
            return AnimationLimiter(
              child: ListView.builder(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = dataList[index].data() as Map<String, dynamic>;
                    if (data == null) {
                      // Handle the case when userDetails are missing in a document.
                      return const Text("User details not found");
                    }
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        verticalOffset: -250,
                        child: ScaleAnimation(
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 12.0),
                            decoration: BoxDecoration(
                              color: NeedlincColors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: NeedlincColors.black2.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      margin: const EdgeInsets.all(10),
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
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                           data['userName'],
                                            style:
                                            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                          ),
                                          Text("~${data['userCategory']}",
                                              style: const TextStyle(
                                                  fontSize: 13, fontWeight: FontWeight.w600)),
                                          Text("📍${data['address']}",
                                              style: const TextStyle(
                                                  fontSize: 12, color: NeedlincColors.black2)),
                                          const SizedBox(height: 25.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ProfilePage()));
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      NeedlincColors.blue1),
                                                  shape:
                                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      side: const BorderSide(color: Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                                child: const Text("View Profile"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Message()));
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      NeedlincColors.blue1),
                                                  shape:
                                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      side: const BorderSide(color: Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                                child: const Text("Message"),
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
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
