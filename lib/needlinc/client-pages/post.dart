import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import '../widgets/dropdown-menu.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: NeedlincColors.black3,
                  borderRadius: BorderRadius.circular(9.0)
                ),
                child: TextField(
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
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
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 8.0, top: 10.0),
                child: DropdownMenuWidget(),
              ),
              Container(
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
              Container(
                width: 320,
                  child: Divider(color: NeedlincColors.black2,)
              ),
              Container(
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
              Container(
                margin: EdgeInsets.only(top: 150.0),
                alignment: Alignment.bottomRight,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("POST"),
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
        ),
      ),
    );
  }
}
