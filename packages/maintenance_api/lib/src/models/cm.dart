import 'dart:convert';
import 'package:equatable/equatable.dart';

class CorrectiveMaintenance extends Equatable {
  final String id;
  final DateTime dateTime;
  final String branch;
  final String typeComplaint;
  final String complainerName;
  final String technicianName;
  final String complaintDesc;
  final List<String> photos;
  const CorrectiveMaintenance({
    required this.id,
    required this.dateTime,
    required this.branch,
    required this.typeComplaint,
    required this.complainerName,
    required this.technicianName,
    required this.complaintDesc,
    required this.photos,
  });

  CorrectiveMaintenance copyWith({
    String? id,
    DateTime? dateTime,
    String? branch,
    String? typeComplaint,
    String? complainerName,
    String? technicianName,
    String? complaintDesc,
    List<String>? photos,
  }) {
    return CorrectiveMaintenance(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      branch: branch ?? this.branch,
      typeComplaint: typeComplaint ?? this.typeComplaint,
      complainerName: complainerName ?? this.complainerName,
      technicianName: technicianName ?? this.technicianName,
      complaintDesc: complaintDesc ?? this.complaintDesc,
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'branch': branch,
      'typeComplaint': typeComplaint,
      'complainerName': complainerName,
      'technicianName': technicianName,
      'complaintDesc': complaintDesc,
      'photos': photos,
    };
  }

  factory CorrectiveMaintenance.fromMap(Map<String, dynamic> map) {
    return CorrectiveMaintenance(
      id: map['id'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      branch: map['branch'],
      typeComplaint: map['typeComplaint'],
      complainerName: map['complainerName'],
      technicianName: map['technicianName'],
      complaintDesc: map['complaintDesc'],
      photos: List<String>.from(map['photos']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CorrectiveMaintenance.fromJson(String source) =>
      CorrectiveMaintenance.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      dateTime,
      branch,
      typeComplaint,
      complainerName,
      technicianName,
      complaintDesc,
      photos,
    ];
  }
}
