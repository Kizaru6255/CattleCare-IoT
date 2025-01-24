import 'package:cow_1/presentation/ui/widgets/SizeDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VaccinAndMedicine extends StatefulWidget {
  VaccinAndMedicine({Key? key}) : super(key: key);

  @override
  State<VaccinAndMedicine> createState() => _VaccinAndMedicineState();
}

class _VaccinAndMedicineState extends State<VaccinAndMedicine> {
  bool isVaccineSelected = true;
  bool isMedicineSelected = false;

  void toggleSelectionVaccine() {
    setState(() {
      isVaccineSelected = true;
      isMedicineSelected = false;
    });
  }

  void toggleSelection() {
    setState(() {
      isMedicineSelected = true;
      isVaccineSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // Center the title vertically
          title:
              Text("Vaccin & Medicine"), // Your centered title text goes here
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Date
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: Color(0xff54A800), width: 2),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/calender.svg", // Replace with your SVG asset path
                                  width: 24, // Adjust the width as needed
                                  height: 24, // Adjust the height as needed
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //Cow Id

                        Text(
                          "Cow Id",
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

                        //  Disease

                        Text(
                          "Disease",
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

                        Row(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    isVaccineSelected
                                        ? Colors.white
                                        : Color(0xffD2D2D2)),
                                side: MaterialStateProperty.all(
                                    BorderSide(color: Colors.green)),
                              ),
                              onPressed: () {
                                toggleSelectionVaccine();
                              },
                              child: Text("VACCINE"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    isMedicineSelected
                                        ? Colors.white
                                        : Color(0xffD2D2D2)),
                                side: MaterialStateProperty.all(
                                    BorderSide(color: Colors.green)),
                              ),
                              onPressed: () {
                                toggleSelection();
                              },
                              child: Text("Medicine"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // if Vaccine button click

                        isVaccineSelected
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vaccine Name",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText:
                                          'COVID', // This sets the hint text
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Dose No.",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: '1', // This sets the hint text
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Next Vaccine Date",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Color(0xff54A800), width: 2),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/calender.svg", // Replace with your SVG asset path
                                            width:
                                                24, // Adjust the width as needed
                                            height:
                                                24, // Adjust the height as needed
                                          ),
                                          Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )

                            // if Medicine button click

                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Disease",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText:
                                          'Grass', // This sets the hint text
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
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

  _selectDate(BuildContext context) {}
}
