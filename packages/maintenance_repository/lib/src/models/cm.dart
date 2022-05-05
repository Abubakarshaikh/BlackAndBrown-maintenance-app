import 'dart:convert';

import 'package:equatable/equatable.dart';

class Cm extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String desc;
  final String initialCoordinate;
  final DateTime startingTime;
  final DateTime endingTime;
  final String department;
  final String branch;
  final String complainerName;
  final String findings;
  final String materialRequirement;
  const Cm({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.desc,
    required this.initialCoordinate,
    required this.startingTime,
    required this.endingTime,
    required this.department,
    required this.branch,
    required this.complainerName,
    required this.findings,
    required this.materialRequirement,
  });

  Cm copyWith({
    String? id,
    String? email,
    String? fullName,
    String? phoneNumber,
    String? desc,
    String? initialCoordinate,
    DateTime? startingTime,
    DateTime? endingTime,
    String? department,
    String? branch,
    String? complainerName,
    String? findings,
    String? materialRequirement,
  }) {
    return Cm(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      desc: desc ?? this.desc,
      initialCoordinate: initialCoordinate ?? this.initialCoordinate,
      startingTime: startingTime ?? this.startingTime,
      endingTime: endingTime ?? this.endingTime,
      department: department ?? this.department,
      branch: branch ?? this.branch,
      complainerName: complainerName ?? this.complainerName,
      findings: findings ?? this.findings,
      materialRequirement: materialRequirement ?? this.materialRequirement,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'desc': desc,
      'initialCoordinate': initialCoordinate,
      'startingTime': startingTime.millisecondsSinceEpoch,
      'endingTime': endingTime.millisecondsSinceEpoch,
      'department': department,
      'branch': branch,
      'complainerName': complainerName,
      'findings': findings,
      'materialRequirement': materialRequirement,
    };
  }

  factory Cm.fromMap(Map<String, dynamic> map) {
    return Cm(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      desc: map['desc'] ?? '',
      initialCoordinate: map['initialCoordinate'] ?? '',
      startingTime: DateTime.fromMillisecondsSinceEpoch(map['startingTime']),
      endingTime: DateTime.fromMillisecondsSinceEpoch(map['endingTime']),
      department: map['department'] ?? '',
      branch: map['branch'] ?? '',
      complainerName: map['complainerName'] ?? '',
      findings: map['findings'] ?? '',
      materialRequirement: map['materialRequirement'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cm.fromJson(String source) => Cm.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cm(id: $id, email: $email, fullName: $fullName, phoneNumber: $phoneNumber, desc: $desc, initialCoordinate: $initialCoordinate, startingTime: $startingTime, endingTime: $endingTime, department: $department, branch: $branch, complainerName: $complainerName, findings: $findings, materialRequirement: $materialRequirement)';
  }

  @override
  List<Object> get props {
    return [
      id,
      email,
      fullName,
      phoneNumber,
      desc,
      initialCoordinate,
      startingTime,
      endingTime,
      department,
      branch,
      complainerName,
      findings,
      materialRequirement,
    ];
  }
}
