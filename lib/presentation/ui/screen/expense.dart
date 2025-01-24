import 'package:flutter/material.dart';
import 'package:cow_1/presentation/ui/widgets/SizeDrawer.dart';

class Expense extends StatelessWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // Center the title vertically
          title: Text("Expense"), // Your centered title text goes here
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
                        //Shed Name

                        Text(
                          "Shed Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Shed - 01', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Type of Food

                        Text(
                          "Type of food",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Grass', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Quantity

                        Text(
                          "Quantity",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '500 kg', // This sets the hint text
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
