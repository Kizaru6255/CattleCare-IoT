import 'package:cow_1/presentation/ui/utility/image_base_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnvironmentQuality extends StatelessWidget {
  final String sensorType;
  final String imageURL;

  const EnvironmentQuality({
    Key? key,
    required this.sensorType,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Quality")),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Option 1"),
                  value: "option1",
                ),
                PopupMenuItem(
                  child: Text("Option 2"),
                  value: "option2",
                ),
                // Add more options as needed
              ];
            },
            onSelected: (value) {
              // Handle the selected option here
              if (value == "option1") {
                // Do something for option 1
              } else if (value == "option2") {
                // Do something for option 2
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 0, right: 20),
            child: SizedBox(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 55,
                        width: 50,
                        child: SvgPicture.asset(imageURL, fit: BoxFit.fill)),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      sensorType,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.only(
                          left: 20, top: 20, bottom: 0, right: 20),
                      child: SizedBox(
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  SvgPicture.asset(ImageURL.clock,
                                      fit: BoxFit.cover, height: 30),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "6:00 AM",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height:
                                        10, // Set the desired diameter of the circle
                                    width:
                                        10, // Set the desired diameter of the circle
                                    decoration: BoxDecoration(
                                      shape: BoxShape
                                          .circle, // This sets the shape to a circle
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 2.0, // Border width
                                      ),
                                      color: Colors.green, // Background color
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "0.00",
                                    style: TextStyle(
                                        color: Color(0xff09B256),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
