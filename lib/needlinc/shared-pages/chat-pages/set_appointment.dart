import "package:flutter/material.dart";
import "package:needlinc/needlinc/colors/colors.dart";
import "package:intl/intl.dart"; // External package for Date Formatting
import "appointment_approval.dart";





//Main Screen User Interface
class Set_appointment extends StatefulWidget {

  @override
  State<Set_appointment> createState() => _Set_appointmentState();
}

class _Set_appointmentState extends State<Set_appointment> {
  DateTime? _date = DateTime.now(); // datetime variable
  String day = "Saturday"; //Initializing a default day
  String month = "July"; // Initializing a default month
  TimeOfDay? time = TimeOfDay(hour: 12, minute: 12);
  int Hour = 12;
  String timeZone = "AM";

// Show Date Picker method
  void _ShowDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value != null) {
        setState(() {
          _date = value;
          day = DateFormat('EEEE').format(_date ?? DateTime.now());
          month = DateFormat('MMMM').format(_date ?? DateTime.now());
        });
      } else {
        return;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; // This variable holds the screen size for the device.
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
      body: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 25.0),
            const Center(
              child: Text(
                "SET APPOINTMENT",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                ),
              ),
            ),

            SizedBox(height: 80.0),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 230.0,
                      height: 30.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${day}, ${_date?.day}th ${month}", style: TextStyle(fontSize: 13.0)),

                          //Clickable button that handles date selection
                          TextButton(
                            onPressed: _ShowDatePicker,
                            child: Icon(Icons.unfold_more_outlined, size:18 , color: Colors.black),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 2.0, color: Colors.black),
                      )
                  ),

                  //TODO; create a time picker widget
                  Container(
                      padding: EdgeInsets.only(left: 3.0),
                      width: 115,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${Hour.toString().padLeft(2,"0")} : ${time!.minute.toString().padLeft(2, "0")}", style: TextStyle(fontSize: 13),),
                          TextButton(
                            onPressed: () async{
                              Hour = time!.hour;
                              TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: time!,
                              );
                              if (newTime != null) {
                                setState(() {
                                  time = newTime;
                                  if (time!.hour > 12){
                                    Hour = time!.hour - 12;
                                    timeZone = "PM";
                                  }
                                });
                              }
                            },
                            child:  Icon(Icons.unfold_more_outlined, size:18 , color: Colors.black),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 2.0, color: Colors.black),
                      )
                  ),
                ]),

            SizedBox(height: 5),

            //PM, AM selection box
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  //padding: EdgeInsets.only(left: 5.0),
                    width: 70,
                    height: 30,
                    child: Center(child: Text(timeZone)),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 2.0, color: Colors.black),
                    )
                ),
              ],
            ),

            SizedBox(height: screenSize.height * 0.1 ),

            //UI for Already booked section
            Center(
              child: Container(
                height: screenSize.height * 0.25,
                width: screenSize.width * 0.9,
                padding: EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ALREADY BOOK", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                      SizedBox(height: screenSize.height * 0.02),
                      Text("Friday 9th. 7:30 pm"), //Hardcoded for now
                      Text("Saturday 10th. 5:25 pm"),
                      Text("Friday 23rd. 2:30 pm"),
                      Divider(height: 40,thickness: 5.0, indent: 2.0, endIndent: 2.0, color: Colors.grey ),
                    ]
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  color: NeedlincColors.blue3,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 70,
        height: 30,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Approval()));
          },
          child: Text(" NEXT"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          backgroundColor: NeedlincColors.blue1,
        ),
      ),
    );
  }
}