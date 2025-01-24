import 'package:cow_1/presentation/ui/screen/milkDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddMilk extends StatelessWidget {
  const AddMilk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();

    // Format the date as a string
    String formattedDate = "${now.day}-${now.month}-${now.year}";

    return Scaffold(
      backgroundColor: Color(0xffd7e5e8),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Milk"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xff48C282),
            height: 60,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cattle Id no 201",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      "Friesian",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 220,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/calender.svg"),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                '<',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.green),
                              ),
                              Text(
                                ' $formattedDate ',
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                '>',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.green),
                              ),
                            ],
                          ),
                          Divider(color: Colors.green),
                          Expanded(
                              // ------------------------------   Milk Quantity Input ----------------------
                              child: Center(
                                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 110,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Center(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      decoration: InputDecoration(
                                        hintText: "Quantity",
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 20),
                                        contentPadding: EdgeInsets
                                            .zero, // Remove default TextField padding
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 45,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                  ),
                                  child: Center(
                                    child: Text("Ltr",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ))
                            ],
                          )))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Save",
                              style: TextStyle(fontSize: 25),
                            )),
                        SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(MilkDetails());
                            },
                            child: Text(
                              "View",
                              style: TextStyle(fontSize: 25),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
