import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
class PM extends Equatable {
  final String id;
  final String title;
  final DateTime dateTime;
  final String branch;
  final String technicianName;
  final int technicianNum;
  final String remarks;
  final List<String> photos;
  PM({
    String? id,
    required this.title,
    required this.dateTime,
    required this.branch,
    required this.technicianName,
    required this.technicianNum,
    required this.remarks,
    required this.photos,
  }) : id = id ?? const Uuid().v4();

  PM copyWith({
    String? id,
    String? title,
    DateTime? dateTime,
    String? branch,
    String? technicianName,
    int? technicianNum,
    String? remarks,
    List<String>? photos,
  }) {
    return PM(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      branch: branch ?? this.branch,
      technicianName: technicianName ?? this.technicianName,
      technicianNum: technicianNum ?? this.technicianNum,
      remarks: remarks ?? this.remarks,
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'branch': branch,
      'technicianName': technicianName,
      'technicianNum': technicianNum,
      'remarks': remarks,
      'photos': photos,
    };
  }

  factory PM.fromMap(Map<String, dynamic> map) {
    return PM(
      id: map['id'],
      title: map['title'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      branch: map['branch'],
      technicianName: map['technicianName'],
      technicianNum: map['technicianNum'],
      remarks: map['remarks'],
      photos: List<String>.from(map['photos']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PM.fromJson(String source) => PM.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      title,
      dateTime,
      branch,
      technicianName,
      technicianNum,
      remarks,
      photos,
    ];
  }
}
