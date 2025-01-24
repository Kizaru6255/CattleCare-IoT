import 'package:cow_1/presentation/ui/screen/addCow.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditCow extends StatefulWidget {
  final String cowId; // Pass the cow document ID
  final Map<String, dynamic> cowData; // Pass the existing cow data

  const EditCow({Key? key, required this.cowId, required this.cowData})
      : super(key: key);

  @override
  State<EditCow> createState() => _EditCowState();
}

class _EditCowState extends State<EditCow> {
  int selectedButtonIndex = 0;

  // Controllers for form data
  late Map<String, TextEditingController> basicInfoControllers;
  late Map<String, TextEditingController> reproductionControllers;

  @override
void initState() {
  super.initState();

  // Safely access 'basicInfo' and 'reproduction' fields, providing default empty values if they're null
  final basicInfo = widget.cowData['basicInfo'] ?? {};
  final reproduction = widget.cowData['reproduction'] ?? {};
   print('Basic Info: $basicInfo'); 
   
  // Initialize controllers with existing cow data
  basicInfoControllers = {
    'imageUrl': TextEditingController(text: basicInfo['imageUrl'] ?? ''),
    'origin': TextEditingController(text: basicInfo['origin'] ?? ''),
    'cattleId': TextEditingController(text: basicInfo['cattleId'] ?? ''),
    'age': TextEditingController(text: basicInfo['age'] ?? ''),
    'dob': TextEditingController(text: basicInfo['dob'] ?? ''),
    'color': TextEditingController(text: basicInfo['color'] ?? ''),
    'breedingRate': TextEditingController(text: basicInfo['breedingRate'] ?? ''),
    'weight': TextEditingController(text: basicInfo['weight'] ?? ''),
    'milkYield': TextEditingController(text: basicInfo['milkYield'] ?? ''),
  };

  reproductionControllers = {
    'provableHeatDate': TextEditingController(text: reproduction['provableHeatDate'] ?? ''),
    'heatStatus': TextEditingController(text: reproduction['heatStatus'] ?? ''),
    'actualHeatDate': TextEditingController(text: reproduction['actualHeatDate'] ?? ''),
    'semenPushStatus': TextEditingController(text: reproduction['semenPushStatus'] ?? ''),
    'semenPushDate': TextEditingController(text: reproduction['semenPushDate'] ?? ''),
    'pregnantStatus': TextEditingController(text: reproduction['pregnantStatus'] ?? ''),
    'pregnantDate': TextEditingController(text: reproduction['pregnantDate'] ?? ''),
    'deliveryStatus': TextEditingController(text: reproduction['deliveryStatus'] ?? ''),
    'deliveryDate': TextEditingController(text: reproduction['deliveryDate'] ?? ''),
  };
}


  Future<void> _updateCowData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    try {
      Map<String, String> basicInfoData = {
        for (var entry in basicInfoControllers.entries) entry.key: entry.value.text,
      };

      Map<String, String> reproductionData = {
        for (var entry in reproductionControllers.entries) entry.key: entry.value.text,
      };

      // Update the cow data in Firestore
      await FirebaseFirestore.instance
          .collection('users') // Top-level collection
          .doc(userId) // Current user's document
          .collection('cows') // Subcollection for cows
          .doc(widget.cowId) // Cow document ID
          .update({
        'basicInfo': basicInfoData,
        'reproduction': reproductionData,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cow updated successfully!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdbe3e7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Cow"),
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
              selectedButtonIndex == 1
                  ? ReproductionForm(controllers: reproductionControllers)
                  : BasicInfoForm(controllers: basicInfoControllers),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _updateCowData,
                  child: const Text("UPDATE"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
