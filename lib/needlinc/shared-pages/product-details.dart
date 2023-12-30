import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import '../widgets/image-viewer.dart';

class ProductDetailsPage extends StatelessWidget {
    ProductDetailsPage({userDetails, required this.productDetails});
    Map<String, dynamic>? userDetails, productDetails;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: NeedlincColors.white,
      child: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImageViewer(
                imageUrls: ["${productDetails!["image"]}"],
                initialIndex: 0,
               ),
              ),
             );
            },
            child: Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("${productDetails!["image"]}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                    productDetails!['name'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: NeedlincColors.black1,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        "₦ ${productDetails!['price']}",
                        style: const TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: NeedlincColors.black1
                        )),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set the background color
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Set the border radius
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white, // Set the icon color
                        ),
                        SizedBox(width: 8), // Add some space between the icon and text
                        Text(
                          'Purchase',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white, // Set the text color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0.0),
            child: Text(
              productDetails!['description'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: NeedlincColors.black1,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
