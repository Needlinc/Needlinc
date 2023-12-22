import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

import '../widgets/image-viewer.dart';

class ProductDetailsPage extends StatelessWidget {
    ProductDetailsPage({userDetails, required this.productDetails});
    Map<String, dynamic>? userDetails, productDetails;
  @override
  Widget build(BuildContext context) {
    return  ListView(
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
                          color: Colors.green
                      )),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: Text('Purchase'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    primary: NeedlincColors.black1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Set the border radius
                    ),
                  ),
                ),
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
    );
  }
}
