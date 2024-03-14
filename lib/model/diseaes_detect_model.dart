import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiseaseDetect {
  String id;
  String name;
  DiseaseDetect({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory DiseaseDetect.fromMap(Map<String, dynamic> map) {
    return DiseaseDetect(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseDetect.fromJson(String source) => DiseaseDetect.fromMap(json.decode(source) as Map<String, dynamic>);
}
