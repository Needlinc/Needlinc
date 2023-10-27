import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:needlinc/needlinc/backend/user-account/upload-post.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

import '../widgets/snack-bar.dart';

class MarketPlacePostPage extends StatefulWidget {
  const MarketPlacePostPage({Key? key}) : super(key: key);

  @override
  State<MarketPlacePostPage> createState() => _MarketPlacePostPageState();
}

class _MarketPlacePostPageState extends State<MarketPlacePostPage> {

  Uint8List? imagePost;
  TextEditingController productDescription = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  bool notLoading = true;
  bool pickedImage = false;

  String selectedCategory = "";

  final categories = [
    "Home Appliances",
    "Electronics",
    "Food stuffs",
    "Mobile Phones",
    "Computers",
    "Books",
    "cosmetics",
    "Bags",
    "Foot wears",
    "Vehicles",
    "Stationeries",
    "Wrist Watches",
    "Cleaning materials",
    "House Furnitures",
    "Pets",
    "Clothes",
    "Aesthetics",
  ];

  Future _selectFile(context, bool imageFrom) async {
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
      showSnackBar(context, "Failed to select image: $e");
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
          InkWell(
            onTap: () async {
              notLoading = false;
              setState(() {});
              if(imagePost != null && productDescription != null && productNameController.text != null && productPriceController.text != null && selectedCategory != null){
                UploadPost().MarketPlacePost(context: context, image: imagePost, description: productDescription.text, productName: productNameController.text, price: productPriceController.text, category: selectedCategory);
                Navigator.pop(context);
              } else {
                notLoading = true;
                // Handle the case where at least one field is empty
                String errorMessage = 'The following fields are empty:';

                if (imagePost == null) {
                  errorMessage += ' Image';
                }
                if (productDescription == null) {
                  errorMessage += ' Description';
                }
                if (productNameController.text.isEmpty) {
                  errorMessage += ' Product Name';
                }
                if (productPriceController.text.isEmpty) {
                  errorMessage += ' Product Price';
                }
                if (selectedCategory == null) {
                  errorMessage += ' Category';
                }

                showSnackBar(context, errorMessage);
              }
            },
            child: Container(
              padding: EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0, bottom: 0.0),
              margin: EdgeInsets.only(top: 15.0, right: 15.0),
                child: Text("Upload", style: GoogleFonts.spaceGrotesk(color: NeedlincColors.white, decoration: TextDecoration.underline,),
                ),
                decoration: BoxDecoration(
                  color: NeedlincColors.blue1,
                  borderRadius: BorderRadius.circular(10.0)
                ),
            ),
          )
        ],
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel),
      ),
    ),
      body: notLoading ? SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Row(
                children: [
                  imagePost != null ? Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.all(100),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(imagePost!),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  )
                  :
                  InkWell(
                    onTap: (){
                      _selectFile(context, true);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: EdgeInsets.all(100),
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "data:image/png;base64,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",
                          ),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: NeedlincColors.black3,
                      borderRadius: BorderRadius.circular(9.0)
                    ),
                    child: TextField(
                          maxLines: 8,
                          keyboardType: TextInputType.multiline,
                          controller: productDescription,
                          decoration: InputDecoration(
                            hintText: 'Product description...',
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
                ],
              ),
              InkWell(
                onTap: (){
                  _selectFile(context, false);
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
                  _selectFile(context, true);
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
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black), // Customize border as needed
                        borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                      ),
                      child: TextField(
                        controller: productNameController,
                        decoration: InputDecoration(
                          hintText: 'Product Name',
                          contentPadding: EdgeInsets.all(12.0), // Adjust padding as needed
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue, // Border color when focused
                              width: 2.0, // Border width when focused
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black), // Customize border as needed
                        borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(12.0), // Adjust padding as needed
                            child: Text(
                              '₦', // Naira symbol
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number, // Allow only numeric input
                              controller: productPriceController,
                              decoration: InputDecoration(
                                hintText: 'Price',
                                contentPadding: EdgeInsets.all(12.0), // Adjust padding as needed
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue, // Border color when focused
                                    width: 2.0, // Border width when focused
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text('Select Category:'),
                    SizedBox(height: 6.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: categories.map((category) {
                        return ChoiceChip(
                          label: Text(
                              category,
                            style: TextStyle(
                              color: selectedCategory == category ? Colors.white : Colors.black,
                            ),
                          ),
                          selected: selectedCategory == category,
                          onSelected: (selected) {
                            setState(() {
                              selectedCategory = selected ? category : "";
                              showSnackBar(context, 'Selected Category: $selectedCategory');
                            });
                          },
                          backgroundColor: selectedCategory == category ? Colors.blue : null, // Set the background color to blue when selected
                          selectedColor: NeedlincColors.blue1, // Specify the selected color
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
          :
      Center(child: CircularProgressIndicator()),
    );
  }
}
