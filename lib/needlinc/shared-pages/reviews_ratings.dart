import 'package:flutter/material.dart';

class Reviews_Ratings extends StatefulWidget {
  const Reviews_Ratings({super.key});

  @override
  State<Reviews_Ratings> createState() => _Reviews_RatingsState();
}

class _Reviews_RatingsState extends State<Reviews_Ratings> {
  final List<String> items = List.generate(6, (index)=>"You just left a review in JOnh Doe's profile");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blue,
        title: const Text(
            "Reviews/Ratings",
          style: TextStyle(
            //color: Colors.blue,
            fontSize: 14,
          ),
        ),
        elevation: 0.0,
      ),

      body:Container(
        color: Colors.white,
        padding: EdgeInsets.all(3.0),
        child: Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Divider(thickness: 2.0),
                    ListTile(
                      title: Text(items[index], maxLines: 2, overflow: TextOverflow.ellipsis,),
                      onTap: () {
                        //TODO: Implement 
                      },
                    ),
                  ],
                ),
              );
            }

          ),
        ),
      ),
    );
  }
}