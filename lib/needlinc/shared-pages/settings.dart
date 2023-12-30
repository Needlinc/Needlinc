import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/colors/colors.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isSwitched = false;  
  bool _isSwitched1 = false;
  bool _isSwitched2 = false;
  bool _isSwitched3 = false;
  bool _isSwitched4 = false;
  bool _isSwitched5 = false;
  bool _isSwitched6 = false;
  bool _isSwitched7 = false;
  @override
  Widget build(BuildContext context) {
     Size screenSize = MediaQuery.of(context).size;
     double Height = screenSize.height;
     double Width = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: const Text(
            "Settings",
          style: TextStyle(
            //color: Colors.blue,
            fontSize: 14,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.only(),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Height * 0.03),
            Text("Display"),
            Center(
              child: Container(
                padding: EdgeInsets.all(3.0),
                width: Width * 0.95,
                height: Height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Switch Themes"),
                    Switch(
                      value: _isSwitched,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched = value;
                        });
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: NeedlincColors.blue2,
                    width: 2.0,
                  ),
                ) 
              ),
            ),

            SizedBox(height: Height * 0.03),

            Text("Notifications"),
            SizedBox(height: Height * 0.01),
            Center(
              child: Container(
                padding: EdgeInsets.all(3.0),
                width: Width * 0.95,
                height: Height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Allow Notifications"),
                    Switch(
                      value: _isSwitched1,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched1 = value;
                        });
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: NeedlincColors.blue2,
                    width: 2.0,
                  ),
                ) 
              )
              ),

            SizedBox(height: Height * 0.004),

            Center(
              child: Container(
                padding: EdgeInsets.all(3.0),
                width: Width * 0.95,
                height: Height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Chat Notifications"),
                    Switch(
                      value: _isSwitched2,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched2 = value;
                        });
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: NeedlincColors.blue2,
                    width: 2.0,
                  ),
                ) 
              ),
            ),
            SizedBox(height: Height * 0.004),

            Center(
              child: Container(
                padding: EdgeInsets.all(3.0),
                width: Width * 0.95,
                height: Height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Booking Notifications"),
                    Switch(
                      value: _isSwitched3,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched3 = value;
                        });
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: NeedlincColors.blue2,
                    width: 2.0,
                  ),
                ) 
              ),
            ),

            SizedBox(height: Height * 0.004),

            Center(
              child: Container(
                padding: EdgeInsets.all(3.0),
                width: Width * 0.95,
                height: Height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Enable Push Notitfications"),
                    Switch(
                      value: _isSwitched4,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched4 = value;
                        });
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: NeedlincColors.blue2,
                    width: 2.0,
                  ),
                ) 
              )
            ),

            SizedBox(height: Height * 0.03),

            Text("App Permissons"),
            Text("This allows you to control which permissions on the aopp"),
            Center(
              child:Container(
                padding: EdgeInsets.all(3.0),
                width: Width * 0.95,
                height: Height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Contacts"),
                    Switch(
                      value: _isSwitched5,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched5 = value;
                        });
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: NeedlincColors.blue2,
                    width: 2.0,
                  ),
                )
              )
            ),
               
            Center(
              child: Container(
                padding: EdgeInsets.all(3.0),
                width: Width * 0.95,
                height: Height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Photos"),
                    Switch(
                      value: _isSwitched6,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched6 = value;
                        });
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: NeedlincColors.blue2,
                    width: 2.0,
                  ),
                )
              )
            ),

            Center(
              child: Container(
                padding: EdgeInsets.all(3.0),
                width: Width * 0.95,
                height: Height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Location"),
                    Switch(
                      value: _isSwitched7,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched7 = value;
                        });
                      },
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: NeedlincColors.blue2,
                    width: 2.0,
                  ),
                )
              )
            ),//location
            SizedBox(height: Height * 0.03),
            Text("Account"),
            SizedBox(height: Height * 0.02),
            Container(
              
            ),// change Password
            Container(), //Deactivate account
            SizedBox(height: Height * 0.02,),
            Container(),//Upgrade to Professional account
            SizedBox(height: Height * 0.2),
            Container(),// Leave Feedback
            SizedBox(height: Height * 0.02),
            Container(),//Delete Account

          ],
        ),
      ),
    );
  }
}