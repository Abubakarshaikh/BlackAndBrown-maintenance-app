import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class WorkOrder extends Equatable {
  final String id;
  final String title;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String desc;
  final String initialCoordinate;
  final String endingCoordinates;
  final DateTime startingTime;
  final DateTime endingTime;
  final String department;
  final String branch;
  final String workType;
  final List<Work> works;
  const WorkOrder({
    required this.id,
    required this.title,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.desc,
    required this.initialCoordinate,
    required this.endingCoordinates,
    required this.startingTime,
    required this.endingTime,
    required this.department,
    required this.branch,
    required this.workType,
    required this.works,
  });

  WorkOrder copyWith({
    String? id,
    String? title,
    String? email,
    String? fullName,
    String? phoneNumber,
    String? desc,
    String? initialCoordinate,
    String? endingCoordinates,
    DateTime? startingTime,
    DateTime? endingTime,
    String? department,
    String? branch,
    String? workType,
    List<Work>? works,
  }) {
    return WorkOrder(
      id: id ?? this.id,
      title: title ?? this.title,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      desc: desc ?? this.desc,
      initialCoordinate: initialCoordinate ?? this.initialCoordinate,
      endingCoordinates: endingCoordinates ?? this.endingCoordinates,
      startingTime: startingTime ?? this.startingTime,
      endingTime: endingTime ?? this.endingTime,
      department: department ?? this.department,
      branch: branch ?? this.branch,
      workType: workType ?? this.workType,
      works: works ?? this.works,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'desc': desc,
      'initialCoordinate': initialCoordinate,
      'endingCoordinates': endingCoordinates,
      'startingTime': startingTime.millisecondsSinceEpoch,
      'endingTime': endingTime.millisecondsSinceEpoch,
      'department': department,
      'branch': branch,
      'workType': workType,
      'works': works.map((x) => x.toMap()).toList(),
    };
  }

  factory WorkOrder.fromMap(Map<String, dynamic> map) {
    return WorkOrder(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      desc: map['desc'] ?? '',
      initialCoordinate: map['initialCoordinate'] ?? '',
      endingCoordinates: map['endingCoordinates'] ?? '',
      startingTime: DateTime.fromMillisecondsSinceEpoch(map['startingTime']),
      endingTime: DateTime.fromMillisecondsSinceEpoch(map['endingTime']),
      department: map['department'] ?? '',
      branch: map['branch'] ?? '',
      workType: map['workType'] ?? '',
      works: List<Work>.from(map['works']?.map((x) => Work.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkOrder.fromJson(String source) =>
      WorkOrder.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WorkOrder(id: $id, title: $title, email: $email, fullName: $fullName, phoneNumber: $phoneNumber, desc: $desc, initialCoordinate: $initialCoordinate, endingCoordinates: $endingCoordinates, startingTime: $startingTime, endingTime: $endingTime, department: $department, branch: $branch, workType: $workType, works: $works)';
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      email,
      fullName,
      phoneNumber,
      desc,
      initialCoordinate,
      endingCoordinates,
      startingTime,
      endingTime,
      department,
      branch,
      workType,
      works,
    ];
  }

  static WorkOrder fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;
    return WorkOrder(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      email: data['email'] ?? '',
      fullName: data['fullName'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      desc: data['desc'] ?? '',
      initialCoordinate: data['initialCoordinate'] ?? '',
      endingCoordinates: data['endingCoordinates'] ?? '',
      startingTime: DateTime.fromMillisecondsSinceEpoch(data['startingTime']),
      endingTime: DateTime.fromMillisecondsSinceEpoch(data['endingTime']),
      department: data['department'] ?? '',
      branch: data['branch'] ?? '',
      workType: data['workType'] ?? '',
      works: List<Work>.from(data['works']?.map((x) => Work.fromMap(x))),
    );
  }
}

class Work extends Equatable {
  final String title;
  final List<String> status;
  const Work({
    required this.title,
    required this.status,
  });

  Work copyWith({
    String? title,
    List<String>? status,
  }) {
    return Work(
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'status': status,
    };
  }

  factory Work.fromMap(Map<String, dynamic> map) {
    return Work(
      title: map['title'] ?? '',
      status: List<String>.from(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Work.fromJson(String source) => Work.fromMap(json.decode(source));

  @override
  String toString() => 'Work(title: $title, status: $status)';

  @override
  List<Object> get props => [title, status];
}
