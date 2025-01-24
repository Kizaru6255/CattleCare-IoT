import 'package:flutter/material.dart';
import 'package:cow_1/presentation/ui/widgets/SizeDrawer.dart';

class ShedRegistration extends StatelessWidget {
  const ShedRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // Center the title vertically
          title:
              Text("Shed Registration"), // Your centered title text goes here
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
                        //Name

                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Shed Name', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Shed Length

                        Text(
                          "Shed Length",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '100"', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Shed Width

                        Text(
                          "Shed Width",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '80"', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Location

                        Text(
                          "Location",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText:
                                'Give Location', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Phone No

                        Text(
                          "Phone No",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '01*********', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Email

                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText:
                                'youremailid@gmail.com', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //No of Cow

                        Text(
                          "No of Cow",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '85', // This sets the hint text
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //Upload picture

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
