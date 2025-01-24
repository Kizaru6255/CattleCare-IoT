import 'package:cow_1/permissions/permission.dart';
import 'package:cow_1/presentation/ui/screen/Splash_Screen/Quality.dart';
import 'package:cow_1/presentation/ui/utility/image_base_url.dart';
import 'package:cow_1/presentation/ui/widgets/SizeDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShedDetails extends StatefulWidget {
  ShedDetails({Key? key}) : super(key: key);

  @override
  _ShedDetailsState createState() => _ShedDetailsState();
}

class _ShedDetailsState extends State<ShedDetails> {
  List<String> sensorNames = [
    'Temperature',
    'Humidity',
    'Light Density',
    'Ammonia',
  ];
  @override
void initState() {
  super.initState();
  requestPermissions(); // Request permissions when the widget is initialized
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Shed Name")),
      ),
      drawer: SizeDrawer(),
      body: Center(
        child: ListView.builder(
          itemCount: 4, // Number of cards you want to display
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  EnvironmentQuality(
                    sensorType: sensorNames[index],
                    imageURL: ImageURL.Shedpage[index],
                  ),
                );
              },
              child: Card(
                  margin:
                      EdgeInsets.only(left: 20, top: 15, bottom: 0, right: 20),
                  child: SizedBox(
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  height: 40,
                                  ImageURL.Shedpage[index],
                                  fit: BoxFit.fill),
                              Text(
                                sensorNames[index],
                                style: TextStyle(
                                    fontSize: 25, color: Color(0xff373737)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "32 ℃ ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color(0xff00741E),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("9:00 AM 02-05-23",
                                    style: TextStyle(
                                        color: Color(0xff00741E),
                                        fontWeight: FontWeight.bold))
                              ],
                            )),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
