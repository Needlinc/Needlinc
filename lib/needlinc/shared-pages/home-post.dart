import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import '../backend/user-account/upload-post.dart';
import '../widgets/check-box.dart';
import '../widgets/snack-bar.dart';

class HomePostPage extends StatefulWidget {
  const HomePostPage({Key? key}) : super(key: key);

  @override
  State<HomePostPage> createState() => _HomePostPageState();
}

class _HomePostPageState extends State<HomePostPage> {

  Uint8List? imagePost;
  TextEditingController writeUp = TextEditingController();
  TextEditingController freelancerOption = TextEditingController();
  bool upLoading = true;


  Future _selectFile(bool imageFrom) async {
    try {
      XFile? imageFile = await ImagePicker().pickImage(
          source: imageFrom ? ImageSource.gallery : ImageSource.camera
      );
      if (imageFile != null){
        imagePost = await imageFile.readAsBytes();
        setState(() {});
      }
    } on PlatformException catch (e) {
      // TODO
      print('Failed to select image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: NeedlincColors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: NeedlincColors.black1
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 15.0, right: 15.0),
              child: Text("SAVE", style: GoogleFonts.spaceGrotesk(color: NeedlincColors.black1, decoration: TextDecoration.underline,),))
        ],
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel),
      ),
    ),
      body: upLoading ? SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              imagePost != null ?
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: MemoryImage(imagePost!)
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: NeedlincColors.black3,
                      borderRadius: BorderRadius.circular(9.0)
                    ),
                    child: Column(
                      children: [
                        TextField(
                              maxLines: 8,
                              keyboardType: TextInputType.multiline,
                              controller: writeUp,
                              decoration: InputDecoration(
                                hintText: 'Write A Post...',
                                border: OutlineInputBorder(
                                     borderSide: BorderSide.none
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                              ),
                              style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              :
              Container(
                margin: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: NeedlincColors.black3,
                    borderRadius: BorderRadius.circular(9.0)
                ),
                child: Column(
                  children: [
                    TextField(
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                      controller: writeUp,
                      decoration: InputDecoration(
                        hintText: 'Write A Post...',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 8.0, top: 10.0),
                child: CheckboxWidget(),
              ),
              InkWell(
                onTap: (){
                  _selectFile(false);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.camera_alt_outlined, color: NeedlincColors.blue2,),
                      Text("Add a photo", style: GoogleFonts.oxygen( fontSize: 16),),
                      Container(padding: EdgeInsets.only(left: 160.0),child: Icon(Icons.arrow_forward_ios_rounded,))
                    ],
                  ),
                ),
              ),
              Container(
                width: 320,
                  child: Divider(color: NeedlincColors.black2,)
              ),
              InkWell(
                onTap: (){
                  _selectFile(true);
                  },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.image_outlined, color: NeedlincColors.blue2,),
                      Text("Choose from gallery", style: GoogleFonts.oxygen( fontSize: 16),),
                      Container(padding: EdgeInsets.only(left: 100.0),child: Icon(Icons.arrow_forward_ios_rounded,))
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 150.0, bottom: 10.0),
                alignment: Alignment.bottomRight,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    upLoading = false;
                    setState(() {});
                    freelancerOption.text = "true";
                    if(imagePost != null && writeUp != null && freelancerOption != null) {
                      upLoading = await UploadPost().homePagePostForImageAndWriteUp(context, imagePost,writeUp.text, freelancerOption.text);
                      upLoading ? Navigator.pop(context) : null;
                    }
                    else if(imagePost != null && writeUp == null){
                      upLoading = await UploadPost().homePagePostForImage(context, imagePost, freelancerOption.text);
                      upLoading ? Navigator.pop(context) : null;
                    }
                    else if (imagePost == null && writeUp != null){
                      upLoading = await UploadPost().homePagePostForWriteUp(context, writeUp.text, freelancerOption.text);
                      upLoading ? Navigator.pop(context) : null;
                    }
                    else{
                      showSnackBar(context, "Empty fields");
                    }
                  },
                  child: upLoading ? Text("POST") : CircularProgressIndicator(),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(NeedlincColors.blue1),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      )
            :
        Center(child: CircularProgressIndicator()),
    );
  }
}
