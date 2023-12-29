import "package:flutter/material.dart";
import "package:needlinc/needlinc/colors/colors.dart";
import "appointment_confirmation.dart";



class Approval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: NeedlincColors.blue1
        ),
        title: Text(
            "NeedLinc",
            style: TextStyle(color: NeedlincColors.blue1)
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed:() {},
              color: NeedlincColors.blue1
          ),
        ],
        backgroundColor: NeedlincColors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: screenSize.height * 0.15),
          Center(
            child: Container(
              height: screenSize.height * 0.20,
              width: screenSize.width * 0.9,
              padding: EdgeInsets.all(12),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 18
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "YOU HAVE AN APPOINTMENT. \nWITH "),
                      TextSpan(text: "JOHN DOE ",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(text: "AN ELECTRICIAN"),
                      TextSpan(text: "\nBY 7:30 PM ON THURSDAY, 8TH JUNE")
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                color: NeedlincColors.blue3,
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.1),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("EDIT"),
            style: ElevatedButton.styleFrom(
              backgroundColor: NeedlincColors.blue1,
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        width: 90,
        height: 30,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Confirmation()));
          },
          child: Text("APPROVE"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          backgroundColor: NeedlincColors.blue1,
        ),
      ),
    );
  }
}