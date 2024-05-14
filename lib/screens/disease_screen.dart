import 'dart:io';

import 'package:agro_ai/screens/complete_processing.dart';
import 'package:agro_ai/utils/constants.dart';
import 'package:agro_ai/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key});

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  File? _selectedImage;
  @override
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (await Permission.camera.request().isGranted &&
          await Permission.storage.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
      } else {
        // You can request multiple permissions at once.
        await [
          Permission.camera,
          Permission.storage,
        ].request();
      }

      // // You can request multiple permissions at once.
      // Map<Permission, PermissionStatus> statuses = await [
      //   Permission.camera,
      //   Permission.storage,
      // ].request();
      // print(statuses[Permission.location]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PrimaryText(
          text: 'Predict Disease',
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
              text: 'Get informed advice on fertilizer based on soil',
              color: Constants.grey700,
              maxLines: 2,
            ),
            const SizedBox(
              height: 25,
            ),
            PrimaryText(
              text: 'Upload Image',
              color: Constants.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            _selectedImage != null
                ? Stack(
                    children: [
                      Container(
                        // padding: EdgeInsets.all(8),
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        right: 6,
                        child: PopupMenuButton(
                          constraints: const BoxConstraints(),
                          position: PopupMenuPosition.under,
                          onSelected: (value) {
                            if (value == 'camera') {
                              _pickImageFromCamera();
                            } else if (value == 'gallery') {
                              _pickImageFromGallery();
                            }
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 3),
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Colors.grey.withOpacity(.3),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.cyan.shade800,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          itemBuilder: (context) {
                            return <PopupMenuEntry>[
                              PopupMenuItem(
                                value: 'camera',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.cyan.shade800,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    const PrimaryText(
                                      text: 'Take a Photo',
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'gallery',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.photo_library_outlined,
                                      color: Colors.cyan.shade800,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    const PrimaryText(
                                      text: 'Choose From Gallery',
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ];
                          },
                        ),
                        // child: GestureDetector(
                        //   onTap: () {},

                        // ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pickImageFromCamera();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.cyan.shade800,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const PrimaryText(
                                fontWeight: FontWeight.w500,
                                text: 'Take a Photo',
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: Colors.cyan.shade800,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pickImageFromGallery();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.cyan.shade800,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const PrimaryText(
                                fontWeight: FontWeight.w500,
                                text: 'Choose from gallery',
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Icon(
                                Icons.photo_library_outlined,
                                size: 25,
                                color: Colors.cyan.shade800,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const ProcessComplete());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Constants.black,
                backgroundColor: Colors.cyan.shade800,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const PrimaryText(
                text: 'Submit',
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}
