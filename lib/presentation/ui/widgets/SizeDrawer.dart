import 'package:cow_1/presentation/ui/screen/AddInventory.dart';
import 'package:cow_1/presentation/ui/screen/InventoryList/InventoryList.dart';
import 'package:cow_1/presentation/ui/screen/addDevice.dart';
import 'package:cow_1/presentation/ui/screen/CowProfile/cowProfile.dart';
import 'package:cow_1/presentation/ui/screen/expense.dart';
import 'package:cow_1/presentation/ui/screen/landing_page.dart';
import 'package:cow_1/presentation/ui/screen/shedDetails.dart';
import 'package:cow_1/presentation/ui/screen/addCow.dart';
import 'package:cow_1/presentation/ui/screen/shedRegistration.dart';
import 'package:cow_1/presentation/ui/screen/vaccine&medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SizeDrawer extends StatelessWidget {
  const SizeDrawer({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    try {
      // Perform logout
      await FirebaseAuth.instance.signOut();
      Get.to(const LandingPage());
      // Get.offAllNamed('/login'); // Navigate to the login screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                 Center(
                 child:  UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                user?.photoURL ??
                    "https://via.placeholder.com/150", // Placeholder if no photo
              ),
            ),
            accountName: Text(
              user?.displayName ?? "Guest User",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              user?.email ?? "No Email",
              style: const TextStyle(fontSize: 16),
            ),
          ),),
                ListTile(
                  leading: const Icon(
                    Icons.add_home,
                    color: Colors.green,
                  ),
                  title: const Text("Shed Registration"),
                  onTap: () {
                    Get.to(const ShedRegistration());
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.sensors,
                    color: Colors.green,
                  ),
                  title: const Text("Shed Details"),
                  onTap: () {
                    Get.to(ShedDetails());
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/addCow.svg",
                    height: 30,
                    width: 30,
                  ),
                  title: const Text("Add Cow"),
                  onTap: () {
                    Get.to(const AddCow());
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/deviceAdd.svg",
                    height: 28,
                    width: 28,
                  ),
                  title: const Text("Add Device"),
                  onTap: () {
                    Get.to(const AddDevice());
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/expense.svg",
                    height: 28,
                    width: 28,
                  ),
                  title: const Text("Expense"),
                  onTap: () {
                    Get.to(const Expense());
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/inventory.svg",
                    height: 28,
                    width: 28,
                  ),
                  title: const Text("Add Inventory"),
                  onTap: () {
                    Get.to(const AddInventory());
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/images/cowMukh.png",
                    height: 35,
                  ),
                  title: const Text("Cow Profile"),
                  onTap: () {
                    Get.to(CowProfile());
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/images/cowMukh.png",
                    height: 35,
                  ),
                  title: const Text("Inventory list"),
                  onTap: () {
                    Get.to(InventoryList());
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/images/cowMukh.png",
                    height: 35,
                  ),
                  title: const Text("Vaccin & Medicine"),
                  onTap: () {
                    Get.to(VaccinAndMedicine());
                  },
                ),
                SizedBox(
                  height: 80,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text("Logout"),
                  onTap: () {
                    _logout(context);
                    Get.to(VaccinAndMedicine());
                  },
                ),
                const Divider(),
              ],
            ),
          ),
          // const Divider(),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: ListTile(
          //     leading: const Icon(
          //       Icons.logout,
          //       color: Colors.red,
          //     ),
          //     title: const Text("Logout"),
          //     onTap: () {
          //       _logout(context);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
