import 'package:flutter/material.dart';
import 'needlinc/colors/colors.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
            "Emeka John",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 13
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.blue,
            onPressed: (){},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow"),
                      fit: BoxFit.fill),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Emeka John",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                      "070 8786 0987",
                    style: TextStyle(
                        fontSize: 13,
                    ),
                  ),
                  Text(
                      "debra.holt@example.com",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: 130,
            height: 35,
            child: ElevatedButton(
                onPressed: (){},
                child: Text("Edit Profile"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(NeedlincColors.blue1),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.blue)
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Information",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                  ),
                ),
                Divider(),
                Text(
                  "Your Posts",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[300],
                  ),
                ),
                Divider(),
                Text(
                  "Saved & Favourited",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[300],
                  ),
                ),
                Divider(),
                Text(
                  "Contracts",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[300],
                  ),
                ),
                Divider(),
                Text(
                  "Transaction History",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[300],
                  ),
                ),
                Divider(),
                Text(
                  "Privacy Settings",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[300],
                  ),
                ),
                Divider(),
                Text(
                  "Reviews/Ratings",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[300],
                  ),
                ),
                Divider(),
                Text(
                  "Help/Support",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[300],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
