import 'package:cow_1/presentation/ui/screen/InventoryList/Cubit/ListInventory_Cubit.dart';
import 'package:cow_1/presentation/ui/screen/InventoryList/Cubit/ListInventory_State.dart';
import 'package:cow_1/presentation/ui/widgets/LoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InventoryList extends StatefulWidget {
  InventoryList({Key? key}) : super(key: key);

  @override
  State<InventoryList> createState() => _InventoryListState();
}

class _InventoryListState extends State<InventoryList> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });

      // Update the text in the currentDate controller with the selected date.
      currentDate.text = picked.toString().split(' ')[0];

      print("Current date is : ");
      print(currentDate.text);
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;
      });

      // Update the text in the currentDate controller with the selected date.
      lastDate.text = picked.toString().split(' ')[0];
      print("Last date is : ");
      print(lastDate.text);
    }
  }

  TextEditingController currentDate = TextEditingController(
    text: DateTime.now().toString().split(' ')[0],
  );

  TextEditingController lastDate = TextEditingController(
    text: DateTime.now().toString().split(' ')[0],
  );

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI(); // Call the method to fetch data when the widget is initialized.
  }

  Future<void> fetchDataFromAPI() async {
    // Make an HTTP GET request to the provided URL
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/allAddInventory'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // Use the data to update your state (e.g., store it in a List)
      // Example:
      List<Map<String, dynamic>> inventoryData = List.from(data);

      // Update your state or call the Cubit method to update the state.
      // Example: cubit.fetchInventoryData(inventoryData);
    } else {
      // Handle errors, e.g., show an error message or retry the request.
      print('Failed to fetch data: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Inventory List"),
      ),
      body: BlocProvider(
        create: (context) => ListInventoryCubit(),
        child: Builder(
          builder: (context) {
            final cubit = BlocProvider.of<ListInventoryCubit>(context);

            return BlocConsumer<ListInventoryCubit, ListInventoryState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: LoadingIndicator(),
                  );
                } else if (state is GetAllData) {
                  final data = state.listInventory;
                  if (data != null && data.isNotEmpty) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From Date",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 156,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color: Color(0xff54A800), width: 2),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/calender.svg"),
                                          Container(
                                            height: 50,
                                            width: 120,
                                            child: TextField(
                                              controller: currentDate,
                                              onTap: () => _selectDate(context),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To Date",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 156,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color: Color(0xff54A800), width: 2),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/calender.svg"),
                                          Container(
                                            height: 50,
                                            width: 120,
                                            child: TextField(
                                              controller: lastDate,
                                              onTap: () =>
                                                  _selectDate2(context),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(70, 48)),
                                      ),
                                      onPressed: () {
                                        print(currentDate.text);
                                        print("||||||||||||||||");
                                        print(lastDate.text);
                                      },
                                      child: Text("Filter")),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                columnWidths: {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(3),
                                  2: FlexColumnWidth(3),
                                  3: FlexColumnWidth(3),
                                },
                                border: TableBorder.all(),
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                    ),
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              'Type',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              'Date',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              'Unit Price',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              'Quantity',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  for (int i = 0; i < 30; i++)
                                    TableRow(
                                      children: [
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                (i < data.length)
                                                    ? data[i][
                                                            'crop_type_name'] ??
                                                        '---'
                                                    : '---',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                (i < data.length)
                                                    ? data[i]['created_at'] ??
                                                        '---'
                                                    : '---',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                (i < data.length)
                                                    ? data[i]['crop_price_per_kg'] +
                                                            " taka" ??
                                                        '---'
                                                    : '---',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                (i < data.length)
                                                    ? data[i]['crop_quantity'] +
                                                            "kg" ??
                                                        '---'
                                                    : '---',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              )),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("There is no Data"),
                    );
                  }
                } else {
                  return Container();
                }
              },
              listener: (context, state) {
                // Do something when the state changes.
              },
            );
          },
        ),
      ),
    );
  }
}















//