import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/widgets/main-page.dart';
import '../colors/colors.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
          color: NeedlincColors.white,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 4)));
                    },
                    child: Container(
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
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border, size: 22,)),
                      Text("1.2K", style: TextStyle(fontSize: 10))
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.comment, size: 20, color: NeedlincColors.blue1,)),
                      Text("200", style: TextStyle(fontSize: 10))
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border, size: 20,)),
                  SizedBox(width: 10.0,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 20,))
                ],
              ),
              Divider(thickness: 2, color: NeedlincColors.black2,),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 4)));
                          },
                        child: Container(
                          padding: EdgeInsets.all(17),
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
                       ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("WOW!, I love this post soooo much, thank you so much and congratulations on your promotion sir", style: TextStyle(fontSize: 13),),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 280,
                    margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: NeedlincColors.blue1),
                      color: NeedlincColors.black3,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            maxLength: 250,
                            decoration: InputDecoration(
                              hintText: 'Drop a comment...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 1),
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
                  IconButton(onPressed: (){}, icon: Icon(Icons.send), color: NeedlincColors.blue1,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
