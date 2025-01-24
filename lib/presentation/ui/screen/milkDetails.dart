
import 'package:flutter/material.dart';


class MilkDetails extends StatelessWidget {
  MilkDetails({Key? key}) : super(key: key);

  final List<int> noList = List.generate(30, (index) => index + 1);
  final List<String> nameList = List.generate(30, (index) => '$index-05-2023');
  final List<String> detailsList = List.generate(30, (index) => 'Details $index');
  final List<double> liter = List.generate(30, (index) => index+15.3);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Milk Details"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      Text("Cattle Id no 201",style: TextStyle(fontSize: 18,color: Colors.white),),
                      Text("Friesian",style: TextStyle(fontSize: 18,color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(6),
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
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Name',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Details',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            child: Text(
                              '${noList[i]}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${nameList[i]}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${liter[i]}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                ElevatedButton(onPressed: (){}, child: Text("Update"))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
