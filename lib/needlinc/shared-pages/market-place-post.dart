import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class MarketPlacePostPage extends StatefulWidget {
  const MarketPlacePostPage({Key? key}) : super(key: key);

  @override
  State<MarketPlacePostPage> createState() => _MarketPlacePostPageState();
}

String productName = "";
String productPrice = "";
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



class _MarketPlacePostPageState extends State<MarketPlacePostPage> {
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
            padding: EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0, bottom: 0.0),
            margin: EdgeInsets.only(top: 15.0, right: 15.0),
              child: Text("Upload", style: GoogleFonts.spaceGrotesk(color: NeedlincColors.white, decoration: TextDecoration.underline,),
              ),
              decoration: BoxDecoration(
                color: NeedlincColors.blue1,
                borderRadius: BorderRadius.circular(10.0)
              ),
          )
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
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.all(100),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                        onChanged: (value) {
                          setState(() {
                            productName = value;
                          });
                        },
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
                              onChanged: (value) {
                                setState(() {
                                  productPrice = value;
                                });
                              },
                              keyboardType: TextInputType.number, // Allow only numeric input
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
                              print('Selected Category: $selectedCategory');
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
      ),
    );
  }
}
