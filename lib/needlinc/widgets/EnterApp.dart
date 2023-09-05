import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/freelancer-pages/freelancer-main.dart';
import '../client-pages/client-main.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This UI is not mine to make"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add your logic for Client sign-in here
                Navigator.push(context, MaterialPageRoute(builder: (context) => ClientMainPages(currentPage: 0)));
              },
              child: Text("Sign In as Client"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your logic for Freelancer sign-in here
                Navigator.push(context, MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 0)));
              },
              child: Text("Sign In as Freelancer"),
            ),
          ],
        ),
      ),
    );
  }
}
