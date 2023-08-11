import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FREELANCERSR",
          style: TextStyle(color: NeedlincColors.blue2, fontSize: 14),
        ),
        centerTitle: true,
        backgroundColor: NeedlincColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
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
              ],
            ),
          ),
          SizedBox(height: 10), // Add spacing

          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
                physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
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
                        child: _buildFreelancerCard(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String text, Color color) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      padding: EdgeInsets.all(4),
      child: Text(
        text,
        style: TextStyle(color: NeedlincColors.white),
      ),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildFreelancerCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
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
                      "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
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
                      "John Doe",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text("~Electrician",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    Text("📍John Paul's kitchen, eziobodor",
                        style: TextStyle(
                            fontSize: 12, color: NeedlincColors.black2)),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
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
                          onPressed: () {},
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
    );
  }
}
