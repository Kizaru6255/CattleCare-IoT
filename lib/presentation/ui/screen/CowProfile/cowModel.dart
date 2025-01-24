import 'package:cloud_firestore/cloud_firestore.dart';

class CowModel {
  final String id;  // Add the document ID field
  final String cattleNumber;
  final String purchaseDate;
  final String origin;
  final int age;
  final double weight;
  final double milkYield;
  final String color;
  final String milkStatus;
  final String owner;
  final double breedingRate;
  final String provableHeatDate;
  final String heatStatus;
  final String healthStatus;
  final String semenPushStatus;
  final String semenPushDate;
  final String pregnantStatus;
  final String pregnantDate;
  final String deliveryStatus;
  final String image;

  CowModel({
    required this.id,  // Include id in the constructor
    required this.image,
    required this.cattleNumber,
    required this.purchaseDate,
    required this.origin,
    required this.age,
    required this.weight,
    required this.milkYield,
    required this.color,
    required this.milkStatus,
    required this.owner,
    required this.breedingRate,
    required this.provableHeatDate,
    required this.heatStatus,
    required this.healthStatus,
    required this.semenPushStatus,
    required this.semenPushDate,
    this.pregnantStatus = 'Unknown',
    required this.pregnantDate,
    required this.deliveryStatus,
  });

  // Factory constructor to create a CowModel instance from Firestore document
  factory CowModel.fromFirestore(DocumentSnapshot doc) {
    // Helper function to parse string to double or int
    double parseDouble(String value) => double.tryParse(value) ?? 0.0;
    int parseInt(String value) => int.tryParse(value) ?? 0;

    // Accessing nested fields in 'basicInfo' and 'reproduction'
    final basicInfo = doc['basicInfo'] as Map<String, dynamic>;
    final reproduction = doc['reproduction'] as Map<String, dynamic>;

    // Helper function to convert Timestamp to String
    String timestampToString(Timestamp? timestamp) {
      if (timestamp == null) return '';
      return timestamp.toDate().toString(); // Converts Timestamp to DateTime and then to String
    }

    return CowModel(
      id: doc.id,  // Store the document ID
      cattleNumber: basicInfo['cattleId'] ?? 'Unknown',
      image: basicInfo['imageUrl'] ?? 'Unknown',
      purchaseDate: timestampToString(doc['createdAt'] as Timestamp?), // Using createdAt as purchaseDate
      origin: basicInfo['origin'] ?? 'Unknown',
      age: parseInt(basicInfo['age'] ?? '0'),
      weight: parseDouble(basicInfo['weight'] ?? '0.0'),
      milkYield: parseDouble(basicInfo['milkYield'] ?? '0.0'),
      color: basicInfo['color'] ?? 'Unknown',
      milkStatus: basicInfo['milkStatus'] ?? 'Unknown',
      owner: basicInfo['owner'] ?? 'Unknown',
      breedingRate: parseDouble(basicInfo['breedingRate'] ?? '0.0'),
      provableHeatDate: reproduction['provableHeatDate'] ?? 'Unknown',
      heatStatus: reproduction['heatStatus'] ?? 'Unknown',
      healthStatus: reproduction['healthStatus'] ?? 'Unknown',
      semenPushStatus: reproduction['semenPushStatus'] ?? 'Unknown',
      semenPushDate: reproduction['semenPushDate'] ?? 'Unknown',
      pregnantStatus: reproduction['pregnantStatus'] ?? 'Unknown',
      pregnantDate: reproduction['pregnantDate'] ?? 'Unknown',
      deliveryStatus: reproduction['deliveryStatus'] ?? 'Unknown',
    );
  }

  // Add the toMap method to convert the CowModel instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'cattleId': cattleNumber,
      'imageUrl': image,
      'createdAt': FieldValue.serverTimestamp(),  // Use server timestamp
      'origin': origin,
      'age': age,
      'weight': weight,
      'milkYield': milkYield,
      'color': color,
      'milkStatus': milkStatus,
      'owner': owner,
      'breedingRate': breedingRate,
      'reproduction': {
        'provableHeatDate': provableHeatDate,
        'heatStatus': heatStatus,
        'healthStatus': healthStatus,
        'semenPushStatus': semenPushStatus,
        'semenPushDate': semenPushDate,
        'pregnantStatus': pregnantStatus,
        'pregnantDate': pregnantDate,
        'deliveryStatus': deliveryStatus,
      },
    };
  }
}
