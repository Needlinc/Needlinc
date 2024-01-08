import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import '../widgets/image-viewer.dart';

class ProductDetailsPage extends StatefulWidget {

  Map<String, dynamic>? userDetails, productDetails;

   ProductDetailsPage({super.key, required this.userDetails, required this.productDetails});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  bool showFullDescription = true;

  @override
  Widget build(BuildContext context) {
    List<dynamic> imagesArray = widget.productDetails!["images"] as List<dynamic>; // Get the dynamic list
    List<String> images = imagesArray.map((e) => e.toString()).toList(); // Convert to List<String>
    return  Scaffold(
        appBar: AppBar(
        backgroundColor: NeedlincColors.white,
        foregroundColor: NeedlincColors.blue1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ImageViewer(
                    imageUrls: images,
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
                      image: NetworkImage("${widget.productDetails!["images"][0]}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: NeedlincColors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              widget.productDetails!['name'],
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.productDetails!['description'],
                              maxLines: showFullDescription ? null : 2,
                              overflow: showFullDescription
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showFullDescription = !showFullDescription;
                                  });
                                },
                                child: Text(
                                  showFullDescription ? 'See Less' : 'See More',
                                  style: const TextStyle(
                                    color: NeedlincColors.blue1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Price and Buy button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₦ ${widget.productDetails!['price']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Implement the logic to handle the buy button press
                                    // You can navigate to a checkout page or show a confirmation dialog.
                                  },
                                  label: const Text(
                                    'Buy Now',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: NeedlincColors.blue1,
                                    foregroundColor: NeedlincColors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Previous posts of user',
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
               previousPosts(context: context, description: widget.productDetails!['description'], price: widget.productDetails!['price'], picture: widget.productDetails!['images'])
            ],
          ),
        ),
      ),
    );
  }
}

// Previous Post list container
Padding previousPosts({required BuildContext context, String? description, String? price, List<dynamic>? picture}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0.5),
    child: InkWell(
      onTap: () {},
      child: Column(
        children: [
          for(int index = 0; index < 5; index++)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (description != null)
                        Container(
                          width: MediaQuery.of(context).size.width * .85,
                          child: Text(
                            description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      const SizedBox(height: 6),
                      if (price != null)
                        Text(
                          '₦${price}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                  if (picture!.length != 0)
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("${
                            picture[0]
                          }"),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}