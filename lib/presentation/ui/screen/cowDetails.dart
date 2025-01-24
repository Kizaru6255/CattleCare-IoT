import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'CowProfile/cowModel.dart';

class CowDetails extends StatefulWidget {
  final CowModel cow; // Assume Cow is a model containing the cow's details

  CowDetails({Key? key, required this.cow}) : super(key: key);
  @override
  State<CowDetails> createState() => _CowDetailsState();
}

class _CowDetailsState extends State<CowDetails> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cattle Number ${widget.cow.cattleNumber}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: AspectRatio(
                    aspectRatio: 16 / 12,
                    child: widget.cow.image == ''
                        ? Image.asset("assets/images/c.jpg", fit: BoxFit.fill)
                        : Image.network(
                            widget.cow.image,
                            fit: BoxFit.fill,
                          )),
              ),
              const SizedBox(height: 10),
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: selectedButtonIndex == 0
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: const Text("Basic Info"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: selectedButtonIndex == 1
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: const Text("Reproduction"),
                      ),
                    ),
                  ],
                ),
              ),
              selectedButtonIndex == 0
                  ? BasicInfo(cow: widget.cow)
                  : Container(),
              selectedButtonIndex == 1
                  ? Reproduction(cow: widget.cow)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicInfo extends StatelessWidget {
  final CowModel cow;

  BasicInfo({required this.cow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/cal.svg"),
          const SizedBox(width: 20),
          const Text("Purchase Date"),
          const Spacer(),
          Expanded(
              child: Text(cow.purchaseDate,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/origin.svg"),
          const SizedBox(width: 20),
          const Text("Origin"),
          const Spacer(),
          Expanded(
              child: Text(cow.origin,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/cake.svg"),
          const SizedBox(width: 20),
          const Text("Age"),
          const Spacer(),
          Expanded(
              child: Text(cow.age.toString(),
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/weight.svg"),
          const SizedBox(width: 20),
          const Text("Weight"),
          const Spacer(),
          Expanded(
              child: Text(cow.weight.toString(),
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/milk.svg"),
          const SizedBox(width: 20),
          const Text("Milk Yield"),
          const Spacer(),
          Expanded(
              child: Text(cow.milkYield.toString(),
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/color.svg"),
          const SizedBox(width: 20),
          const Text("Color"),
          const Spacer(),
          Expanded(
              child:
                  Text(cow.color, style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/milk.svg"),
          const SizedBox(width: 20),
          const Text("Milk Status"),
          const Spacer(),
          Expanded(
              child: Text(cow.milkStatus,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/owner.svg"),
          const SizedBox(width: 20),
          const Text("Ownership"),
          const Spacer(),
          Expanded(
              child:
                  Text(cow.owner, style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/breeding.svg"),
          const SizedBox(width: 20),
          const Text("Breeding Rate"),
          const Spacer(),
          Expanded(
              child: Text(cow.breedingRate.toString(),
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
      ],
    );
  }
}

class Reproduction extends StatelessWidget {
  final CowModel cow;

  Reproduction({required this.cow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/cowi.svg"),
          const SizedBox(width: 20),
          const Text("Provable heat date"),
          const Spacer(),
          Expanded(
              child: Text(cow.provableHeatDate,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/status.svg"),
          const SizedBox(width: 20),
          const Text("Heat Status"),
          const Spacer(),
          Expanded(
              child: Text(cow.heatStatus,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/status.svg"),
          const SizedBox(width: 20),
          const Text("Health Status"),
          const Spacer(),
          Expanded(
              child: Text(cow.healthStatus,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/spm.svg"),
          const SizedBox(width: 20),
          const Text("Semen Push Status"),
          const Spacer(),
          Expanded(
              child: Text(cow.semenPushStatus,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/spm.svg"),
          const SizedBox(width: 20),
          const Text("Semen Push Date"),
          const Spacer(),
          Expanded(
              child: Text(cow.semenPushDate,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/cowi.svg"),
          const SizedBox(width: 20),
          const Text("Pregnant Status"),
          const Spacer(),
          Expanded(
              child: Text(cow.pregnantStatus,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/cowi.svg"),
          const SizedBox(width: 20),
          const Text("Pregnant Date"),
          const Spacer(),
          Expanded(
              child: Text(cow.pregnantDate,
                  style: const TextStyle(color: Colors.black))),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          SvgPicture.asset("assets/images/cowDetails/cowi.svg"),
          const SizedBox(width: 20),
          const Text("Delivery Status"),
          const Spacer(),
          Expanded(
              child: Text(cow.deliveryStatus,
                  style: const TextStyle(color: Colors.black))),
        ]),
      ],
    );
  }
}

// // Assuming Cow is a model that contains the relevant data
// class Cow {
//   final String cattleNumber;
//   final String purchaseDate;
//   final String origin;
//   final int age;
//   final double weight;
//   final double milkYield;
//   final String color;
//   final String milkStatus;
//   final String owner;
//   final double breedingRate;
//   final String gender;
//   final String provableHeatDate;
//   final String heatStatus;
//   final String healthStatus;
//   final String semenPushStatus;
//   final String semenPushDate;
//   final String pregnantStatus;
//   final String pregnantDate;
//   final String deliveryStatus;

//   Cow({
//     required this.cattleNumber,
//     required this.purchaseDate,
//     required this.origin,
//     required this.age,
//     required this.weight,
//     required this.milkYield,
//     required this.color,
//     required this.milkStatus,
//     required this.owner,
//     required this.breedingRate,
//     required this.gender,
//     required this.provableHeatDate,
//     required this.heatStatus,
//     required this.healthStatus,
//     required this.semenPushStatus,
//     required this.semenPushDate,
//     required this.pregnantStatus,
//     required this.pregnantDate,
//     required this.deliveryStatus,
//   });
// }
