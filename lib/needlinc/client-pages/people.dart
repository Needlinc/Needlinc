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
        title: const Text(
          "FREELANCERS",
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
              ],
            ),
          ),
          const SizedBox(height: 10), // Add spacing

          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
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
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: const TextStyle(color: NeedlincColors.white),
      ),
    );
  }

  Widget _buildFreelancerCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "John Doe",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Text("~Electrician",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    const Text("📍John Paul's kitchen, eziobodor",
                        style: TextStyle(
                            fontSize: 12, color: NeedlincColors.black2)),
                    const SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
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
                          onPressed: () {},
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
    );
  }
}
