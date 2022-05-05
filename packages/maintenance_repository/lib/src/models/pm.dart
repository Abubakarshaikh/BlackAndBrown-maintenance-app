import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:maintenance_repository/maintenance_repository.dart';

class Pm extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final int phoneNumber;
  final String desc;
  final String coordinate;
  final String startingTime;
  final String endingTime;
  final String department;
  final String branch;
  final List<CheckLists> checkLists;
  const Pm({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.desc,
    required this.coordinate,
    required this.startingTime,
    required this.endingTime,
    required this.department,
    required this.branch,
    required this.checkLists,
  });

  Pm copyWith({
    String? id,
    String? email,
    String? fullName,
    int? phoneNumber,
    String? desc,
    String? coordinate,
    String? startingTime,
    String? endingTime,
    String? department,
    String? branch,
    List<CheckLists>? checkLists,
  }) {
    return Pm(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      desc: desc ?? this.desc,
      coordinate: coordinate ?? this.coordinate,
      startingTime: startingTime ?? this.startingTime,
      endingTime: endingTime ?? this.endingTime,
      department: department ?? this.department,
      branch: branch ?? this.branch,
      checkLists: checkLists ?? this.checkLists,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'desc': desc,
      'coordinate': coordinate,
      'startingTime': startingTime,
      'endingTime': endingTime,
      'department': department,
      'branch': branch,
      'checkLists': checkLists.map((x) => x.toMap()).toList(),
    };
  }

  factory Pm.fromMap(Map<String, dynamic> map) {
    return Pm(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber']?.toInt() ?? 0,
      desc: map['desc'] ?? '',
      coordinate: map['coordinate'] ?? '',
      startingTime: map['startingTime'] ?? '',
      endingTime: map['endingTime'] ?? '',
      department: map['department'] ?? '',
      branch: map['branch'] ?? '',
      checkLists: List<CheckLists>.from(
          map['checkLists']?.map((x) => CheckLists.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pm.fromJson(String source) => Pm.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pm(id: $id, email: $email, fullName: $fullName, phoneNumber: $phoneNumber, desc: $desc, coordinate: $coordinate, startingTime: $startingTime, endingTime: $endingTime, department: $department, branch: $branch, checkLists: $checkLists)';
  }

  @override
  List<Object> get props {
    return [
      id,
      email,
      fullName,
      phoneNumber,
      desc,
      coordinate,
      startingTime,
      endingTime,
      department,
      branch,
      checkLists,
    ];
  }
}
