import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cow_1/presentation/ui/screen/CowProfile/cowModel.dart';
import 'package:cow_1/presentation/ui/screen/Splash_Screen/addMilk.dart';
import 'package:cow_1/presentation/ui/screen/cowDetails.dart';
import 'package:cow_1/presentation/ui/screen/updateCow.dart';
import 'package:cow_1/presentation/ui/widgets/SizeDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CowProfile extends StatefulWidget {
  const CowProfile({Key? key}) : super(key: key);

  @override
  _CowProfileState createState() => _CowProfileState();
}
class _CowProfileState extends State<CowProfile> {
  List<CowModel> cows = []; // Use CowModel here
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCows();
  }

  Future<void> _fetchCows() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cows')
          .get();

      List<CowModel> cowList =
          querySnapshot.docs.map((doc) => CowModel.fromFirestore(doc)).toList();

      setState(() {
        cows = cowList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching cows: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7E7E7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cow Profile"),
      ),
      drawer: const SizeDrawer(),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: cows.length,
                    itemBuilder: (context, index) {
                      final cow = cows[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 10.0, right: 10.0, bottom: 0.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 40,
                                    child: cow.image == ''
                                        ? Image.asset("assets/images/c.jpg",
                                            fit: BoxFit.fill)
                                        : Image.network(
                                            cow.image,
                                            fit: BoxFit.fill,
                                          )
                                    ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Cattle Id No ${cow.cattleNumber}"),
                                    // Text("Gender: ${cow.gender}")
                                  ],
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(() => CowDetails(cow: cow)); 
                                      },
                                      child: const Text("Details"),
                                    ),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Navigate to EditCow with cowId and cowData
                                        Get.to(() => EditCow(
                                          cowId: cow.id,  // Pass the cow's document ID
                                          cowData: cow.toMap(),  // Pass the cow's data as a Map
                                        ));
                                      },
                                      child: const Text("  Edit  "),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
