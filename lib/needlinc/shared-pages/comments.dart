import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors/colors.dart';

class CommentsPage extends StatefulWidget {
  final Map<String, dynamic> post;
  const CommentsPage({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  Map<String, dynamic>? userDetails;
  Map<String, dynamic>? productDetails;

  @override
    void initState() {
    userDetails = widget.post['userDetails'];
    productDetails = widget.post['postDetails'];
      // TODO: implement initState
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
          color: NeedlincColors.white,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 4)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "${userDetails!['profilePicture']}",
                          ),
                          fit: BoxFit.cover,
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
                             Text("${userDetails!['userName']}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                             Text("🟢 Now", style: TextStyle(fontSize: 9)),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
                          ],
                        ),
                         Text("~${userDetails!['userCategory']}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                         Text("📍${userDetails!['address']}", style: TextStyle(fontSize: 12, color: NeedlincColors.black2))
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
                      IconButton(onPressed: (){}, icon: const Icon(Icons.maps_ugc, size: 20, color: NeedlincColors.blue1,)),
                      const Text("200", style: TextStyle(fontSize: 10))
                    ],
                  ),
                  const SizedBox(width: 10.0,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border, size: 20,)),
                  const SizedBox(width: 10.0,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: 20,))
                ],
              ),
              const Divider(thickness: 2, color: NeedlincColors.black2,),
              //TODO Individual comment
              Expanded(
                child: ListView.builder(
                  itemCount: productDetails!['comments'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                        //    Navigator.push(context, MaterialPageRoute(builder: (context) => NeedlincMainPage(currentPage: 4)));
                          },
                        child: Container(
                          padding: const EdgeInsets.all(17),
                          margin: const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "${productDetails!['comments'][index]['comment']['profilePicture']}",
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: NeedlincColors.black3,
                            shape: BoxShape.circle,
                          ),
                        ),
                       ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text("${productDetails!['comments'][index]['comment']['userName']}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                         Text("🟢 Now", style: TextStyle(fontSize: 9)),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
                                      ],
                                    ),
                                     Text("~${productDetails!['comments'][index]['comment']['userCategory']}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                     Text("📍${productDetails!['comments'][index]['comment']['address']}", style: TextStyle(fontSize: 12, color: NeedlincColors.black2))
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                                child: Text("${productDetails!['comments'][index]['comment']['message']}", style: TextStyle(fontSize: 13),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50.0, right: 5.0),
                            child: Row(
                              children: [
                                IconButton(onPressed: () {},
                                    icon:  Icon(
                                      productDetails!['comments'][index]['comment']['hearts'] == 0 ?
                                      Icons.favorite_border
                                      :
                                      Icons.favorite, size: 22, color: NeedlincColors.red,)),
                                Text("${productDetails!['comments'][index]['comment']['hearts']}", style: const TextStyle(fontSize: 15))
                              ],
                            )
                        ),
                      ],
                    );
                  },
                ),
              ),
              //TODO Write a comment textfield
              Row(
                children: [
                  Container(
                    width: 292,
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                            maxLength: 200,
                            maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                            decoration: const InputDecoration(
                              hintText: 'Drop a comment...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 1),
                            ),
                            onSubmitted: (value) {

                              print('Performing search for: $value');

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.send), color: NeedlincColors.blue1, padding: const EdgeInsets.all(2.0),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
