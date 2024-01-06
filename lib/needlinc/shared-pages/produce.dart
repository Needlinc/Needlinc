import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class Product {
  String? picture;
  String? description;
  double? price;

  Product(
      {required this.picture, required this.description, required this.price});
}

class Produce extends StatefulWidget {
  final Product product;

  Produce({required this.product});

  @override
  _ProduceState createState() => _ProduceState();
}

class _ProduceState extends State<Produce> {
  bool showFullDescription = false;
  List<Product> previousProducts = [
    Product(picture: url, description: 'Previous Product 1', price: 29.99),
    Product(picture: url, description: 'Previous Product 2', price: 39.99),
    Product(picture: url, description: 'Previous Product 2', price: 39.99),
    Product(picture: url, description: 'Previous Product 2', price: 39.99),
    Product(picture: url, description: 'Previous Product 2', price: 39.99),
    Product(picture: url, description: 'Previous Product 2', price: 39.99),
    // Add more previous products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Image.network(
                widget.product.picture!,
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
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
                            const Text(
                              'John Doe',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.product.description!,
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
                                  'N${widget.product.price!.toStringAsFixed(2)}',
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
                    const SizedBox(height: 8.0),
                    // Use an Expanded widget to ensure the ListView takes remaining space
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: previousProducts.length,
                      itemBuilder: (context, index) {
                        return previousPosts(
                            previousProducts[index].description,
                            previousProducts[index].price,
                            url);
                      },
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

// Previous Post list container
Padding previousPosts(String? description, double? price, String? picture) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0.5),
    child: InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (description != null)
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const SizedBox(height: 6),
                  if (price != null)
                    Text(
                      'N${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
              if (picture != null)
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(picture),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    ),
  );
}

String longProductDescription = '''
Introducing the TechMaster Pro Series X1X Ultra Performance Laptop - Your Gateway to Limitless Possibilities!

Unleash the power of cutting-edge technology with the TechMaster Pro Series X1X. Packed with an Intel Core i9 processor, 32GB of RAM, and a lightning-fast 1TB SSD, this laptop is designed to handle your most demanding tasks with ease.

The stunning 15.6-inch 4K OLED display delivers breathtaking visuals, bringing your content to life with vibrant colors and razor-sharp clarity. Immerse yourself in a cinematic experience whether you're working on a graphic design project, editing high-resolution videos, or enjoying your favorite movies and games.

Equipped with the latest NVIDIA GeForce RTX 3080 graphics card, the TechMaster Pro Series X1X ensures seamless performance for graphics-intensive applications. Witness realistic graphics and enjoy smooth gameplay, taking your gaming and creative work to a whole new level.

Designed for productivity, the backlit keyboard and precision touchpad provide a comfortable and efficient typing experience. The laptop's sleek aluminum chassis not only looks stylish but also ensures durability, making it your reliable companion on the go.

Connectivity is never an issue with an array of ports, including Thunderbolt 4, USB-C, HDMI, and more. Stay productive with the TechMaster Pro Series X1X, whether you're in the office, at home, or on the road.

Experience the future of computing with the TechMaster Pro Series X1X - where performance meets elegance. Elevate your workflow, enhance your creativity, and conquer every task effortlessly.

Tech Specs:
- Processor: Intel Core i9
- RAM: 32GB DDR4
- Storage: 1TB SSD
- Display: 15.6-inch 4K OLED
- Graphics: NVIDIA GeForce RTX 3080
- Ports: Thunderbolt 4, USB-C, HDMI, and more

Get ready to redefine what's possible with the TechMaster Pro Series X1X Ultra Performance Laptop. Your journey to unparalleled performance starts here!
''';

String url =
    'https://th.bing.com/th/id/R.7f2bc68b1fa5cc45c51ed1b0934c536c?rik=9uKjT2TpMh2iyg&riu=http%3a%2f%2fwww.hdwallpaperspulse.com%2fwp-content%2fuploads%2f2016%2f05%2f28%2fmountain-beautiful-landscape-hd.jpeg&ehk=jT468bV4MzI8DkoGzy%2f%2bWe2T1lN6HTvoZe05S5IN%2fkQ%3d&risl=&pid=ImgRaw&r=0';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Product Detail Page',
      home: Produce(
        product: Product(
          picture: url,
          description: longProductDescription,
          price: 19.99,
        ),
      ),
    );
  }
}
