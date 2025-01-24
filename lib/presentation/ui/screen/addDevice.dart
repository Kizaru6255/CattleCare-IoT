import 'package:flutter/material.dart';
import 'package:cow_1/presentation/ui/widgets/SizeDrawer.dart';

class AddDevice extends StatelessWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // Center the title vertically
          title: Text("Add Device"), // Your centered title text goes here
        ),
        drawer: SizeDrawer(),
        body: Container(
          color: Color(0xffdbe3e7),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Device ID

                        Text(
                          "Device ID",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '0058745', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Device Code

                        Text(
                          "Device Code",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '02151456416', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Shade ID

                        Text(
                          "Shade ID",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText:
                                'Shade ID - 01', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Submit Button
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text("SUBMIT"))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
