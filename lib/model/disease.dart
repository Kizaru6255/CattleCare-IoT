class Disease {
  final String name;
  final String information;
  final List<String> symptoms;
  final List<String> remedies;
  final Map<String, dynamic> causes;
  final List<String> prevention;

  Disease({
    required this.name,
    required this.information,
    required this.symptoms,
    required this.remedies,
    required this.causes,
    required this.prevention,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      name: json['name'],
      information: json['information'],
      symptoms: List<String>.from(json['symptoms']),
      remedies: List<String>.from(json['remedies']),
      causes: Map<String, dynamic>.from(json['causes']),
      prevention: List<String>.from(json['prevention']),
    );
  }

  static List<Disease> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Disease.fromJson(json)).toList();
  }
}
