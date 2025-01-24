import 'dart:io';

import 'package:cow_1/presentation/ui/screen/shedDetails.dart';
import 'package:cow_1/presentation/ui/utility/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class AddCow extends StatefulWidget {
  const AddCow({Key? key}) : super(key: key);

  @override
  State<AddCow> createState() => _AddCowState();
}

class _AddCowState extends State<AddCow> {
  int selectedButtonIndex = 0;

  // Controllers for form data
  final Map<String, TextEditingController> basicInfoControllers = {
    'imageUrl': TextEditingController(),
    'origin': TextEditingController(),
    'cattleId': TextEditingController(),
    'age': TextEditingController(),
    'dob': TextEditingController(),
    'color': TextEditingController(),
    'breedingRate': TextEditingController(),
    'weight': TextEditingController(),
    'milkYield': TextEditingController(),
  };

  final Map<String, TextEditingController> reproductionControllers = {
    'provableHeatDate': TextEditingController(),
    'heatStatus': TextEditingController(),
    'actualHeatDate': TextEditingController(),
    'semenPushStatus': TextEditingController(),
    'semenPushDate': TextEditingController(),
    'pregnantStatus': TextEditingController(),
    'pregnantDate': TextEditingController(),
    'deliveryStatus': TextEditingController(),
    'deliveryDate': TextEditingController(),
  };

  String selectedGender = 'Female'; // Default gender
  DateTime selectedDob = DateTime.now();

  // Function to calculate age
  String calculateAge(DateTime dob) {
    final today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age.toString();
  }

  Future<void> _submitCowData() async {
    // Validate all fields
    Dialogs.showProgressBar(context);
    for (var entry in basicInfoControllers.entries) {
      if (entry.value.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${entry.key} is required')),
        );
        Navigator.pop(context);
        return; // Stop submission if a field is empty
      }
    }
    // Dialogs.showProgressBar(context);
    for (var entry in reproductionControllers.entries) {
      if (entry.value.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${entry.key} is required')),
        );
        Navigator.pop(context);
        return; // Stop submission if a field is empty
      }
    }

    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    Dialogs.showProgressBar(context);

    try {
      Map<String, String> basicInfoData = {
        for (var entry in basicInfoControllers.entries)
          entry.key: entry.value.text
      };

      Map<String, String> reproductionData = {
        for (var entry in reproductionControllers.entries)
          entry.key: entry.value.text
      };

      // Save data under the user's cows subcollection
      await FirebaseFirestore.instance
          .collection('users') // Top-level collection
          .doc(userId) // Current user's document
          .collection('cows') // Subcollection for cows
          .add({
        'basicInfo': basicInfoData,
        'reproduction': reproductionData,
        'createdAt': FieldValue.serverTimestamp(),
      });
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cow added successfully!')),
      );
      Get.offAll(ShedDetails());
      // Clear form fields and dispose controllers
      basicInfoControllers.values.forEach((controller) => controller.clear());
      reproductionControllers.values
          .forEach((controller) => controller.clear());

      // Pop the current screen
     
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Wrapper for _selectDate to match VoidCallback signature
  void _onDatePick() {
    _selectDate(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDob) {
      setState(() {
        selectedDob = picked;
        basicInfoControllers['dob']?.text =
            "${selectedDob.toLocal()}".split(' ')[0];
        basicInfoControllers['age']?.text = calculateAge(selectedDob);
      });
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Confirm Submission"),
              content: const Text("Are you sure you want to upload the data?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false), // Cancel
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true), // Confirm
                  child: const Text("Confirm"),
                ),
              ],
            );
          },
        ) ??
        false; // Return false if dialog is dismissed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdbe3e7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Cow"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: selectedButtonIndex == 0
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: const Text("Basic Info"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: selectedButtonIndex == 1
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: const Text("Reproduction"),
                      ),
                    ),
                  ],
                ),
              ),
              selectedButtonIndex == 0
                  ? BasicInfoForm(
                      controllers: basicInfoControllers,)
                      // onDatePick: _onDatePick)
                  : ReproductionForm(controllers: reproductionControllers),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final isConfirmed = await _showConfirmationDialog(context);
                    if (isConfirmed) {
                      _submitCowData();
                    }
                  },
                  child: const Text("SUBMIT"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicInfoForm extends StatefulWidget {
  final Map<String, TextEditingController> controllers;
  // final VoidCallback onDatePick;

  const BasicInfoForm({
    Key? key,
    required this.controllers,
    // required this.onDatePick,
  }) : super(key: key);

  @override
  _BasicInfoFormState createState() => _BasicInfoFormState();
}

class _BasicInfoFormState extends State<BasicInfoForm> {
  File? selectedImage;
  bool isUploading = false; // Tracks if the upload is in progress
  bool isUploaded = false; // Tracks if the upload is complete
  // TextEditingController imageurl = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  // Function to pick image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        isUploaded = false;
      });
    }
  }

  Future<String?> _uploadImage(File imageFile) async {
    try {
      // Create a reference to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef
          .child('cow_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Upload image to Firebase Storage
      await imageRef.putFile(imageFile);

      // Get the image URL after successful upload
      String imageUrl = await imageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image selection section
        GestureDetector(
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.camera),
                      title: Text("Take Photo"),
                      onTap: () {
                        _pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text("Choose from Gallery"),
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: selectedImage == null
                  ? Icon(Icons.camera_alt, size: 50)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: isUploading
              ? null
              : () async {
                  if (selectedImage != null) {
                    setState(() {
                      isUploading = true; // Start upload
                    });
                    String? imageUrl = await _uploadImage(selectedImage!);
                    setState(() {
                      isUploading = false; // End upload
                      if (imageUrl != null) {
                        isUploaded = true; // Mark upload as successful
                        widget.controllers['imageUrl']?.text = imageUrl;
                        print(
                            "Image URL: ${widget.controllers['imageUrl']?.text}");
                      }
                    });
                  }
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: isUploaded ? Colors.green : null,
          ),
          child: isUploading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(isUploaded ? "Uploaded" : "Upload"),
        ),
        const SizedBox(height: 20),

        // Form fields
        ...[
          {
            "label": "Origin",
            "hint": "Indian",
            "controller": widget.controllers['origin'],
          },
          {
            "label": "Cattle ID",
            "hint": "C20",
            "controller": widget.controllers['cattleId'],
          },
          {
            "label": "Age",
            "controller": widget.controllers['age'],
            "readOnly": true
          },
          {
            "label": "Date of Birth",
            "hint": "00/00/0000",
            "controller": widget.controllers['dob'],
          //   "widget": GestureDetector(
          //     // onTap: widget.,
          //     child: AbsorbPointer(
          //       child: TextField(
          //         controller: widget.controllers['dob'],
          //         decoration: const InputDecoration(
          //           hintText: 'Select Date of Birth',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //   ),
          },
          {
            "label": "Color",
            "hint": "Black 70% White 30%",
            "controller": widget.controllers['color'],
          },
          {
            "label": "Breeding Rate",
            "hint": "2",
            "controller": widget.controllers['breedingRate'],
          },
          {
            "label": "Weight",
            "hint": "660 kg",
            "controller": widget.controllers['weight'],
          },
          {
            "label": "Milk Yield",
            "hint": "8010 Liters",
            "controller": widget.controllers['milkYield'],
          },
        ].map(
          (field) {
            final controller = field["controller"] as TextEditingController?;
            final bool readOnly = field['readOnly'] == true;
            final Widget? widget = field['widget'] as Widget?;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  field["label"] as String,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                if (widget != null)
                  widget
                else
                  TextField(
                    controller: controller,
                    readOnly: readOnly,
                    decoration: InputDecoration(
                      hintText: field["hint"] as String?,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                const SizedBox(height: 10),
              ],
            );
          },
        ).toList(),
      ],
    );
  }
}

class ReproductionForm extends StatelessWidget {
  final Map<String, TextEditingController> controllers;

  const ReproductionForm({Key? key, required this.controllers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...[
          {
            "label": "Provable Heat Date",
            "controller": controllers['provableHeatDate']
          },
          {"label": "Heat Status", "controller": controllers['heatStatus']},
          {
            "label": "Actual Heat Date",
            "controller": controllers['actualHeatDate']
          },
          {
            "label": "Semen Push Status",
            "controller": controllers['semenPushStatus']
          },
          {
            "label": "Semen Push Date",
            "controller": controllers['semenPushDate']
          },
          {
            "label": "Pregnant Status",
            "controller": controllers['pregnantStatus']
          },
          {"label": "Pregnant Date", "controller": controllers['pregnantDate']},
          {
            "label": "Delivery Status",
            "controller": controllers['deliveryStatus']
          },
          {"label": "Delivery Date", "controller": controllers['deliveryDate']},
        ].map(
          (field) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                field["label"]! as String,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: field["controller"] as TextEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter ${field["label"]!}',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
