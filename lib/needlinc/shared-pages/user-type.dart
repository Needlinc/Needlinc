import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/business-pages/business-main.dart';
import 'package:needlinc/needlinc/client-pages/client-main.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/EnterApp.dart';



class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                if (snapshot.data?['userCategory'] == 'User' ||
                    snapshot.data?['userCategory'] == 'Blogger') {
                  return ClientMainPages(currentPage: 0);
                }
                else if (snapshot.data?['userCategory'] == 'Business' ||
                    snapshot.data?['userCategory'] == 'Freelancer') {
                  return BusinessMainPages(currentPage: 0);
                }
                else if (snapshot.data?['userCategory'] == 'null') {
                  return const CategoryPage();
                }
              }
              else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          catch (error){
            Center(child: Text('$error'),);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                 padding: const EdgeInsets.all(10.0),
                 child: const Center(
                   child: Text(
                       "There is a problem with your account, try creating a new account again or reaching us via needlinc@gmail.com to help you out, we want to see that you have no problem trying to use needlinc to meet your needs, thank you."),
                 ),
               ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamedAndRemoveUntil('//', (route) => false);
                  FirebaseAuth.instance.currentUser!.delete();
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: NeedlincColors.blue1)
                  ),
                  child: const Text(
                    "Go back"
                  ),
                ),
              )
            ],
          );
        }
      )
    );
  }
}
