import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:needlinc/needlinc/colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/gender.dart';
import 'package:needlinc/needlinc/widgets/TextFieldBorder.dart';
import 'package:needlinc/needlinc/widgets/login-background.dart';
import '../../backend/authentication/sign-up.dart';
import '../user-type.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool addPhoto = false;
  bool notLoading = true;
  Uint8List? profilePicture;

  String saveUserInformation(){
    // Storing data in local storage
   SignUp(
       context,
       fullNameController.text.trim(),
       userNameController.text.trim(),
       emailController.text,
       passwordController.text.trim(),
       profilePicture!
   ).signUpWithEmailPassword();
   return 'Success';
  }

  void _ShowAddPhoto() {
    setState(() {
      addPhoto = true;
    });
  }

  void _HideAddPhoto() {
    setState(() {
      addPhoto = false;
    });
  }

  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool passToggle = true, confirmToggle = true;

  //This modal shows image selection either from gallery or camera
  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Wrap(
              children: [
                SizedBox(height: 10),
                ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                    ),
                    title: const Text(
                      'Gallery',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      _selectFile(true);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(
                    Icons.photo_camera,
                  ),
                  title: const Text(
                    'Camera',
                    style: TextStyle(),
                  ),
                  onTap: () {
                    _selectFile(false);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _selectFile(bool imageFrom) async {
    try {
      XFile? imageFile = await ImagePicker().pickImage(
          source: imageFrom ? ImageSource.gallery : ImageSource.camera
      );
      if (imageFile != null){
        profilePicture = await imageFile.readAsBytes();
        setState(() {

        });
      }
    } on PlatformException catch (e) {
      // TODO
      print('Failed to select image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notLoading ? Stack(
        children: [
          backGround(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Column(
              children: [
                // Top arrow
                Row(
                  mainAxisAlignment: addPhoto
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: [
                    // Back arrow
                    IconButton(
                      onPressed: () {
                        if (addPhoto == false) {
                          Navigator.pop(context);
                        }
                        _HideAddPhoto();
                      },
                      icon: Icon(
                        Icons
                            .arrow_back_ios_new, // Specify the icon you want to use
                        size: 30, // Adjust the icon size as needed
                        color: NeedlincColors.white, // Customize the icon color
                      ),
                    ),
                    // Page title
                    Visibility(
                      visible: addPhoto,
                      child: Text(
                        'NEEDLINC',
                        style: TextStyle(
                            color: NeedlincColors.white, fontSize: 12),
                      ),
                    ),
                    // Skip button
                    Visibility(
                      visible: addPhoto,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserType()));
                        },
                        child: Text(
                          '',
                          style: TextStyle(
                              color: NeedlincColors.white, fontSize: 21),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50),
                // main Card
                Column(
                  children: [
                    Text(
                      addPhoto ? 'Add Profile photo' : 'NEEDLINC',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: NeedlincColors.white,
                      ),
                    ),
                    // body
                    SizedBox(height: 10),
                    Visibility(
                      visible: !addPhoto,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(27, 30, 27, 24),
                        decoration: BoxDecoration(
                          color: NeedlincColors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: NeedlincColors.grey,
                              offset: Offset(0, 3),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Form(
                          key: _formField,
                          child: Column(
                            children: [
                              // Create New Account
                              Text(
                                'Create New Account',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 12),
                              // Enter Full Name
                              TextFormField(
                                controller: fullNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter full name";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter Full Name',
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                                  focusedBorder: Borders.FocusedBorder,
                                  enabledBorder: Borders.EnabledBorder,
                                ),
                              ),
                              SizedBox(height: 8),
                              // Enter User Name
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: userNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Username";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter User Name',
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                                  focusedBorder: Borders.FocusedBorder,
                                  enabledBorder: Borders.EnabledBorder,
                                ),
                              ),
                              SizedBox(height: 8),
                              // Email
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Email";
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                                  focusedBorder: Borders.FocusedBorder,
                                  enabledBorder: Borders.EnabledBorder,
                                ),
                              ),
                              SizedBox(height: 8),
                              // Create Password
                              TextFormField(
                                obscureText: passToggle,
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Password";
                                  } else if (passwordController.text.length < 8) {
                                    return "Password must be more than 8 characters";
                                  }
                                },
                                decoration: InputDecoration(
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(passToggle)
                                        passToggle = !passToggle;
                                      });
                                    },
                                    child: Icon(passToggle
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  hintText: 'Create Password',
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                                  focusedBorder: Borders.FocusedBorder,
                                  enabledBorder: Borders.EnabledBorder,
                                ),
                              ),
                              SizedBox(height: 8),
                              // Confirm Password
                              TextFormField(
                                obscureText: confirmToggle,
                                controller: confirmPassController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "confirm Password";
                                  } else if (confirmPassController.text !=
                                      passwordController.text) {
                                    return "Passwords not match";
                                  }
                                },
                                decoration: InputDecoration(
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        confirmToggle = !confirmToggle;
                                      });
                                    },
                                    child: Icon(confirmToggle
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  hintText: 'Confirm Password',
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                                  focusedBorder: Borders.FocusedBorder,
                                  enabledBorder: Borders.EnabledBorder,
                                ),
                              ),
                              SizedBox(height: 17),
                              // create new account button
                              ElevatedButton(
                                onPressed: () {
                                  if (_formField.currentState!.validate()) {
                                    _ShowAddPhoto();
                                  }
                                },
                                child: Text('Create New Account'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: NeedlincColors.blue1,
                                  fixedSize: Size(double.maxFinite, 30),
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // picture container
                    Visibility(
                      visible: addPhoto,
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        Container(
                            height: 210,
                            width: 210,
                            decoration: BoxDecoration(
                              color: NeedlincColors.white,
                              borderRadius: BorderRadius.circular(150),
                              boxShadow: [
                                BoxShadow(
                                  color: NeedlincColors.grey,
                                  offset: Offset(0, 3),
                                  blurRadius: 3.0,
                                  spreadRadius: 1.0,
                                )
                              ],
                            ),
                            child: profilePicture == null
                                ? 
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/1.png"),
                                    ),
                                    borderRadius: BorderRadius.circular(200)
                                  ),
                                  
                                )
                                : CircleAvatar(
                              radius: 60,
                              backgroundImage: MemoryImage(profilePicture!),
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: NeedlincColors.blue1,
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: NeedlincColors.white,
                              width: 5,
                            ),
                          ),
                          child: Align(
                            child: InkWell(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Icon(Icons.add,
                                  size: 35,
                                  weight: 50,
                                  color: NeedlincColors.white),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
                // Next button
                Visibility(
                  visible: addPhoto,
                  child: Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 15, bottom: 55),
                      child: ElevatedButton(
                        onPressed: () async {
                          notLoading = false;
                          setState(() {});
                          await saveUserInformation();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gender()));
                          notLoading = true;
                          emailController.clear();
                          fullNameController.clear();
                          userNameController.clear();
                          passwordController.clear();
                          confirmPassController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: NeedlincColors.blue1,
                          padding: EdgeInsets.all(16),
                        ),
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
          :
          Center(child: CircularProgressIndicator(),)
    );
  }
}