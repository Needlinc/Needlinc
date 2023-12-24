import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../colors/colors.dart';
import '../widgets/TextFieldBorder.dart';

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

  // Create a global key that uniquely identifies the Form widget
  final _formField = GlobalKey<FormState>();

  TextEditingController photoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    // Initialize controllers with previous data (replace with your actual data)
    photoController.text = 'assets/Logo.png';
    nameController.text = "John Doe";
    phoneNumberController.text = "123-456-7890";
    bioController.text = "Flutter Developer";
    emailController.text = "john.doe@example.com";
    genderController.text = "Male";
    locationController.text = "Owerri, Imo State";
    dobController.text = "01/01/1990";
    super.initState();
  }

  List<DateTime?> _selectedDates = [DateTime.now()];
  List<DateTime?>? selectADate;
  bool changeDOB = false;

  void _handleDateSelection(List<DateTime?> selectedDates) {
    setState(() {
      selectADate = _selectedDates;
      _selectedDates =
          selectedDates; // Hide the calendar after a date is selected
    });
  }

  void showCalendar() {
    setState(() {
      changeDOB = true;
    });
  }

  void hideCalendar() {
    setState(() {
      changeDOB = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: NeedlincColors.blue1),
        backgroundColor: NeedlincColors.white,
        leading: InkWell(
          onTap: () {
            if (changeDOB == false) {
              Navigator.pop(context);
            }
            hideCalendar();
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
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
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: changeDOB
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the border radius as needed
                        ),
                        elevation: 4.0, // Add elevation for a shadow effect
                        child: Column(
                          children: [
                            CalendarDatePicker2(
                              config: CalendarDatePicker2Config(),
                              value: _selectedDates,
                              onValueChanged: _handleDateSelection,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // Close the edit profile page
                          if (changeDOB == false) {
                            Navigator.pop(context);
                          }
                          hideCalendar();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: NeedlincColors.blue1,
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  )
                : Form(
                    key: _formField,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile Photo
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  width: 180,
                                  height: 180,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: profilePicture == null
                                      ? Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    photoController.text),
                                                opacity: 0.5,
                                                fit: BoxFit.cover),
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 60,
                                          backgroundImage:
                                              MemoryImage(profilePicture!),
                                          foregroundColor: NeedlincColors.grey
                                              .withOpacity(0.5),
                                        ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: NeedlincColors.blue1,
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
                        const SizedBox(height: 10),
                        // Name
                        TextFormField(
                          controller: nameController,
                          maxLength: 30,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: Borders.FocusedBorder,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Number
                        TextFormField(
                          controller: phoneNumberController,
                          maxLength: 11,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: Borders.FocusedBorder,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Bio
                        TextFormField(
                          controller: bioController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: Borders.FocusedBorder,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Email
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: Borders.FocusedBorder,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Gender
                        TextFormField(
                          controller: genderController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: Borders.FocusedBorder,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Location
                        TextFormField(
                          controller: locationController,
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusedBorder: Borders.FocusedBorder,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // DOB
                        TextFormField(
                          controller: dobController,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: Borders.FocusedBorder,
                            suffix: InkWell(
                              onTap: () {
                                showCalendar();
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            // Add your logic for Client sign-in here
                            if (_formField.currentState!.validate()) {
                              // Save logic goes here
                              Navigator.pop(context);
                            }
                            // Close the edit profile page
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: NeedlincColors.blue1,
                            padding: const EdgeInsets.all(16),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
