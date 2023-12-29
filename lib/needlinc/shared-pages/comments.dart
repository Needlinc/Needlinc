import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:needlinc/needlinc/backend/user-account/upload-post.dart';
import 'package:needlinc/needlinc/widgets/snack-bar.dart';
import '../backend/user-account/functionality.dart';
import '../colors/colors.dart';
import '../widgets/image-viewer.dart';

class CommentsPage extends StatefulWidget {
  final Map<String, dynamic> post;
  final String sourceOption;

  const CommentsPage({Key? key, required this.post, required this.sourceOption}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  Map<String, dynamic>? userDetails, postDetails;
  List? hearts;
  String? image, profilePicture, writeUp, userName, userCategory, address, id, sourceOption;
  int? commentCount;
  TextEditingController commentController = TextEditingController();
  List heartList = [];
  List commentHeartList = [];
  List commentList = [];
  bool commentHeartTap = false;
  bool longPressComment = false;

  likeAndUnlike() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      // Step 1: Retrieve the current data

      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(sourceOption!)
          .doc(id)
          .get();
      // Step 2: Modify the 'comments' array within 'postDetails'
      Map<String, dynamic> data = await documentSnapshot.data() as Map<String, dynamic>? ?? {};

      Map<String, dynamic> postDetails = sourceOption == 'homePage' ?
      data['postDetails'] as Map<String, dynamic>? ?? {}
          :
      data['productDetails'] as Map<String, dynamic>? ?? {};

      List<dynamic> currentArray = (postDetails['hearts'] as List<dynamic>) ?? [];


      if (currentArray.contains(_auth.currentUser!.uid)) {
        // If the name is found, remove it from the set
        currentArray.remove(_auth.currentUser!.uid);

      } else {
        // If the name is not found, add it to the set
        currentArray.add(_auth.currentUser!.uid);
      }

      setState(() {
        heartList = currentArray;
      });

      postDetails['hearts'] = currentArray;

      // Step 3: Update Firestore with the modified data
      sourceOption == 'homePage' ?
      await FirebaseFirestore.instance.collection(sourceOption!).doc(id).update({'postDetails': postDetails})
          :
      await FirebaseFirestore.instance.collection(sourceOption!).doc(id).update({'productDetails': postDetails});

    } catch (e) {
      showSnackBar(context, 'Error');
    }
    return true;
  }



  commentLikeAndUnlike(int index) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      // Step 1: Retrieve the current data

      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(sourceOption!)
          .doc(id)
          .get();
      // Step 2: Modify the 'comments' array within 'postDetails'
      Map<String, dynamic> data = await documentSnapshot.data() as Map<String, dynamic>? ?? {};

      Map<String, dynamic> postDetails = sourceOption == 'homePage' ?
      data['postDetails'] as Map<String, dynamic>? ?? {}
          :
      data['productDetails'] as Map<String, dynamic>? ?? {};

      List<dynamic> commentsArray = (postDetails['comments'] as List<dynamic>) ?? [];
      List<dynamic> commentHeartsArray = commentsArray[index]['commentHearts'];

      if (commentHeartsArray.contains(_auth.currentUser!.uid)) {
        // If the name is found, remove it from the set
        commentHeartsArray.remove(_auth.currentUser!.uid);

      } else {
        // If the name is not found, add it to the set
        commentHeartsArray.add(_auth.currentUser!.uid);
      }

      setState(() {
        commentHeartList = commentsArray;
      });

      commentHeartTap = true;

      commentsArray[index]['commentHearts'] = commentHeartsArray;
      postDetails['comments'] = commentsArray;

      // Step 3: Update Firestore with the modified data
      sourceOption == 'homePage' ?
      await FirebaseFirestore.instance.collection(sourceOption!).doc(id).update({'postDetails': postDetails})
          :
      await FirebaseFirestore.instance.collection(sourceOption!).doc(id).update({'productDetails': postDetails});

    } catch (e) {
      showSnackBar(context, 'Error');
    }
    return true;
  }




  sendCommentMessageToServer({required BuildContext context, required String comment, required String sourceOption, required String id}) async {
    if(comment.isEmpty){
      showSnackBar(context, "Empty");
    }
    else {
      DateTime now = DateTime.now();
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;

      Map<String, dynamic> commentDetails = {
        'profilePicture': await getUserData('profilePicture'),
        'fullName': await getUserData('fullName'),
        'userName': await getUserData('userName'),
        'userCategory': await getUserData('userCategory'),
        'address': await getUserData('address'),
        'userId': await getUserData('userId'),
        'message': comment,
        'timeStamp': millisecondsSinceEpoch,
        'commentHearts': [],
      };

      setState(() {
        commentList.add(commentDetails);
        commentCount = commentList.length;
      });


      await UploadPost().uploadComments(
          context: context, message: comment, sourceOption: sourceOption, id: id);
      setState(() {
        commentController.text = '';
      });
    }
  }



  deleteCommentMessageFromServer({required BuildContext context, required int index}) async {

    try {
      // Step 1: Retrieve the current data

      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(sourceOption!)
          .doc(id)
          .get();
      // Step 2: Modify the 'comments' array within 'postDetails'
      Map<String, dynamic> data = await documentSnapshot.data() as Map<String, dynamic>? ?? {};

      Map<String, dynamic> postDetails = sourceOption == 'homePage' ?
      data['postDetails'] as Map<String, dynamic>? ?? {}
          :
      data['productDetails'] as Map<String, dynamic>? ?? {};

      List<dynamic> currentArray = (postDetails['comments'] as List<dynamic>) ?? [];

      setState(() {
        currentArray.removeAt(index);
      });

      setState(() {
        commentList = currentArray;
        commentCount = commentList.length;
      });

      // Step 3: Update Firestore with the modified data
      sourceOption == 'homePage' ?
      await FirebaseFirestore.instance.collection(sourceOption!).doc(id).update({'postDetails': postDetails})
          :
      await FirebaseFirestore.instance.collection(sourceOption!).doc(id).update({'productDetails': postDetails});
      showSnackBar(context, "Deleted");

    } catch (e) {
      showSnackBar(context, 'Error');
    }

  }

  @override
  void initState() {
    userDetails = widget.post['userDetails'];
    userName = userDetails!['userName'];
    profilePicture = userDetails!['profilePicture'];
    userCategory = userDetails!['userCategory'];
    address = userDetails!['address'];

    sourceOption = widget.sourceOption;
    postDetails = sourceOption == 'homePage' ? widget.post['postDetails'] : widget.post['productDetails'];
    image = postDetails!['image'];
    writeUp = sourceOption == 'homePage' ? postDetails!['writeUp'] : postDetails!['description'];
    commentCount = postDetails!['comments'].length;
    commentList = postDetails!['comments'];
    id = sourceOption == 'homePage' ? postDetails!['postId'] : postDetails!['productId'];
    hearts = postDetails!['hearts'];
    heartList = hearts!;

    // TODO: implement initState
    super.initState();
  }


  Widget displayHomePosts(){
    if(image != "null" && writeUp != "null"){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 12.0),
        color: NeedlincColors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () { },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          profilePicture!,
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: NeedlincColors.black3,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(userName!, style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),),
                          const Text("🟢 Now",
                              style: TextStyle(fontSize: 9)),
                          IconButton(onPressed: () {},
                              icon: const Icon(Icons.more_horiz))
                        ],
                      ),
                      Text(userCategory!, style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                      Text("📍$address", style: const TextStyle(
                          fontSize: 12,
                          color: NeedlincColors.black2))
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 65, bottom: 5),
              alignment: Alignment.topLeft,
              child: Text(
                writeUp!,
                style: const TextStyle(
                    fontSize: 18
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImageViewer(
                  imageUrls: [image!],
                  initialIndex: 0,
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.40,
                margin: const EdgeInsets.fromLTRB(40.0, 0.0, 10.0, 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      image!,
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: NeedlincColors.black3,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {
                      likeAndUnlike();
                    },
                        icon: heartList.contains(FirebaseAuth.instance.currentUser!.uid) ?
                        Icon(
                          Icons.favorite, size: 22,
                          color: NeedlincColors.red,)
                            :
                        Icon(
                          Icons.favorite_border, size: 22,)
                    ),
                    Text("${heartList.length}", style: const TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(width: 10.0,),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.maps_ugc_outlined, size: 20,)),
                    Text("${commentCount}", style: const TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border, size: 20,)),
                const SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.share, size: 20,))
              ],
            )
          ],
        ),
      );
    }
    if(image != "null" && writeUp == "null"){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 12.0),
        color: NeedlincColors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(
                    //   builder: (context) => BusinessMainPages(currentPage: 4),
                    // ));
                  },
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ImageViewer(
                        imageUrls: [image!],
                        initialIndex: 0,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            profilePicture!,
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: NeedlincColors.black3,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(userName!, style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),),
                          const Text("🟢 Now",
                              style: TextStyle(fontSize: 9)),
                          IconButton(onPressed: () {},
                              icon: const Icon(Icons.more_horiz))
                        ],
                      ),
                      Text(userCategory!, style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                      Text("📍$address", style: const TextStyle(
                          fontSize: 12,
                          color: NeedlincColors.black2))
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.40,
              margin: const EdgeInsets.fromLTRB(40.0, 0.0, 10.0, 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    image!,
                  ),
                  fit: BoxFit.cover,
                ),
                color: NeedlincColors.black3,
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {
                      likeAndUnlike();
                    },
                        icon: heartList.contains(FirebaseAuth.instance.currentUser!.uid) ?
                        Icon(
                          Icons.favorite, size: 22,
                          color: NeedlincColors.red,)
                            :
                        Icon(
                          Icons.favorite_border, size: 22,)
                    ),
                    Text("${heartList.length}", style: const TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(width: 10.0,),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.maps_ugc_outlined, size: 20,
                        color: NeedlincColors.blue2,),
                    ),
                    Text("${commentCount}", style: const TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border, size: 20,)),
                const SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.share, size: 20,))
              ],
            )
          ],
        ),
      );
    }
    if(image == "null" && writeUp != "null"){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 12.0),
        color: NeedlincColors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(
                    //   builder: (context) => BusinessMainPages(currentPage: 4),
                    // ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          profilePicture!,
                        ),
                        fit: BoxFit.fill,
                      ),
                      color: NeedlincColors.black3,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(userName!, style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),),
                          const Text("🟢 Now",
                              style: TextStyle(fontSize: 9)),
                          IconButton(onPressed: () {},
                              icon: const Icon(Icons.more_horiz))
                        ],
                      ),
                      Text(userCategory!, style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                      Text("📍$address", style: const TextStyle(
                          fontSize: 12,
                          color: NeedlincColors.black2))
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 65, bottom: 5),
              alignment: Alignment.topLeft,
              child: Text(
                writeUp!,
                style: const TextStyle(
                    fontSize: 18
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {
                      likeAndUnlike();
                    },
                        icon: heartList.contains(FirebaseAuth.instance.currentUser!.uid) ?
                        Icon(
                          Icons.favorite, size: 22,
                          color: NeedlincColors.red,)
                            :
                        Icon(
                          Icons.favorite_border, size: 22,)
                    ),
                    Text("${heartList.length}", style: const TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(width: 10.0,),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.maps_ugc_outlined, size: 20,),
                    ),
                    Text("${commentCount}", style: const TextStyle(fontSize: 15))
                  ],
                ),
                const SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border, size: 20,)),
                const SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.share, size: 20,))
              ],
            )
          ],
        ),
      );
    }
    return Center(child: CircularProgressIndicator(),);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          color: NeedlincColors.white,
          child: Container(
            margin: EdgeInsets.only(bottom: 35),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                displayHomePosts(),
                const Divider(thickness: 2, color: NeedlincColors.black2,),
                Row(
                  children: [
                    Container(
                      height: 65,
                      width: 292,
                      padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: NeedlincColors.blue1),
                        color: NeedlincColors.black3,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              maxLines: 8,
                              maxLength: 500,
                              controller: commentController,
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
                    Container(
                        child: IconButton(
                          onPressed: (){
                            sendCommentMessageToServer(context: context, comment: commentController.text, sourceOption: sourceOption!, id: id!);
                          }, icon: const Icon(Icons.send),
                          color: NeedlincColors.blue1,
                        )
                    )
                  ],
                ),
                //TODO Individual comment
                commentList.length != 0 ?
                Column(
                  children: [
                    for(int index = commentList.length -1; index >= 0; index--)
                      InkWell(
                        onLongPress: (){
                          deleteCommentMessageFromServer(context: context, index: index);
                        },
                        child: Row(
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
                                      "${commentList[index]['profilePicture']}",
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
                                            Text("${commentList[index]['userName']}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                            Text("🟢 Now", style: TextStyle(fontSize: 9)),
                                            IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
                                          ],
                                        ),
                                        Text("~${commentList[index]['userCategory']}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                        Text("📍${commentList[index]['address']}", style: TextStyle(fontSize: 12, color: NeedlincColors.black2))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                                    child: Text("${commentList[index]['message']}", style: TextStyle(fontSize: 13),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 50.0, right: 5.0),
                                child: commentHeartTap ?
                                Row(
                                  children: [
                                    IconButton(onPressed: () {
                                      commentLikeAndUnlike(index);

                                    },
                                        icon:  commentHeartList[index]['commentHearts'].contains(FirebaseAuth.instance.currentUser!.uid) ?
                                        Icon(
                                          Icons.favorite, size: 22,
                                          color: NeedlincColors.red,)
                                            :
                                        Icon(
                                          Icons.favorite_border, size: 22,)
                                    ),
                                    Text("${commentHeartList[index]['commentHearts'].length}", style: const TextStyle(fontSize: 15))
                                  ],
                                )
                                    :
                                Row(
                                  children: [
                                    IconButton(onPressed: () {
                                      commentLikeAndUnlike(index);
                                    },
                                        icon:  commentList[index]['commentHearts'].contains(FirebaseAuth.instance.currentUser!.uid) ?
                                        Icon(
                                          Icons.favorite, size: 22,
                                          color: NeedlincColors.red,)
                                            :
                                        Icon(
                                          Icons.favorite_border, size: 22,)
                                    ),
                                    Text("${commentList[index]['commentHearts'].length}", style: const TextStyle(fontSize: 15))
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                  ],
                )
                    :
                Center(
                  child: Container(
                    child: Text(
                        'Be the first to comment',
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}