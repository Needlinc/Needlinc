import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../colors/colors.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  Uint8List? profilePicture;

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
                const SizedBox(height: 10),
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
          source: imageFrom ? ImageSource.gallery : ImageSource.camera);
      if (imageFile != null) {
        profilePicture = await imageFile.readAsBytes();
        setState(() {});
      }
    } on PlatformException catch (e) {
      // TODO
      print('Failed to select image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: NeedlincColors.blue1),
        backgroundColor: NeedlincColors.white,
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text(
          'John Doe',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 15,
          ),
        ),
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: profilePicture == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage("assets/Logo.png"),
                                        opacity: 0.5,
                                        fit: BoxFit.cover),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage: MemoryImage(profilePicture!),
                                  foregroundColor:
                                      NeedlincColors.grey.withOpacity(0.5),
                                )),
                      Container(
                        width: 45,
                        height: 45,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: NeedlincColors.blue1.withOpacity(0.8),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: NeedlincColors.white,
                            width: 5,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: const Icon(Icons.add,
                              size: 35,
                              weight: 50,
                              color: NeedlincColors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
