import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class Contracts extends StatefulWidget {
  @override
  State<Contracts> createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  Color color1 = NeedlincColors.blue1;
  Color color2 = NeedlincColors.blue3;
  Color color3 = NeedlincColors.blue3;
  Color color4 = NeedlincColors.blue3;
  final List<String> items = List.generate(6, (index)=>"You just set an appointment with John Doe-an electrician");
  @override

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: const Text(
            "Contracts",
          style: TextStyle(
            //color: Colors.blue,
            fontSize: 14,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(7.0),
        child: Column(
          children: [
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed:() {
                        //Implement
                      },
                      child: Container(
                        child: Text("All", style: TextStyle(color: Colors.white)),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          color: color1,
                        ),
                      ),
                    ),
                    
                    TextButton(
                      onPressed: () {
                        //  TODO: Implement
                      },
                      child: Container(
                        child: Text("Active", style: TextStyle(color: Colors.white)),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          color: color2,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed:() {
                        //TODO: Implement
                      },
                      child: Container(
                        child: Text("Finished", style: TextStyle(color: Colors.white)),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          color: color3,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed:() {
                        // TODO: Implement
                      },
                      child: Container(
                        child: Text("Cancelled", style: TextStyle(color: Colors.white)),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          color: color4,
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),

            Divider(height: 2.0, color: NeedlincColors.blue2, thickness: 2.0, indent: screenSize.width * 0.05, endIndent: screenSize.width * 0.05,),
            
            Expanded(
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
          ],
        ),
      ),
    );
  }
}