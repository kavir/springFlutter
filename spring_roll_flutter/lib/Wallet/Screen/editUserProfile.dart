import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/constants/colors.dart';
import 'package:spring_roll_flutter/Wallet/Provider/editUserProfileProvider.dart';
// import 'package:image_picker/image_picker.dart';

class EditUserProfileScreen extends ConsumerStatefulWidget {
  const EditUserProfileScreen({super.key});

  @override
  ConsumerState<EditUserProfileScreen> createState() =>
      _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends ConsumerState<EditUserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  File? _profileImage;

  Future<void> _pickImage() async {
    // final picker = ImagePicker();
    // final pickedImage =
    //     await picker.pickImage(source: ImageSource.gallery); // or .camera

    // if (pickedImage != null) {
    //   setState(() {
    //     _profileImage = File(pickedImage.path);
    //   });
    // }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstNameController.text;
      final lastName = _lastNameController.text;
      final phone = _phoneController.text;

      print('First Name: $firstName');
      print('Last Name: $lastName');
      print('Phone: $phone');
      print('Profile Image Path: ${_profileImage?.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User Profile",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.secondary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? const Icon(Icons.camera_alt, size: 40)
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      color: AppColors.primary,
                    ), // White label text
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  // keyboardType: TextInputType.number,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter the receiver ID';
                  //   }
                  //   return null;
                  // },
                  style: TextStyle(
                    color: AppColors.primary,
                  ), // White text
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'last Name',
                    labelStyle: TextStyle(
                      color: AppColors.primary,
                    ), // White label text
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter the receiver ID';
                  //   }
                  //   return null;
                  // },
                  style: TextStyle(
                    color: AppColors.primary,
                  ), // White text
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: AppColors.primary,
                    ), // White label text
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter the receiver ID';
                  //   }
                  //   return null;
                  // },
                  style: TextStyle(
                    color: AppColors.primary,
                  ), // White text
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstNameController.text;
      final lastName = _lastNameController.text;
      final editedNumber = _phoneController.text;
      final image = _profileImage?.path ?? '';
      final senderId = ref.read(phoneNumberProvider.notifier).state;
      ref
          .read(editUserProfileProvider.notifier)
          .editUser(senderId, firstName, lastName, editedNumber, image);
    }
  }
}
