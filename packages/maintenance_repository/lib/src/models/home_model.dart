import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String id;
  final DateTime initialTime;
  final String initialCoordinate;
  final String selectedBranch;
  final String selectedDepartment;
  final String selectedMaintenance;
  final List<String> branches;
  final List<String> departments;
  final List<String> maintenance;
  const HomeModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.id,
    required this.initialTime,
    required this.initialCoordinate,
    required this.selectedBranch,
    required this.selectedDepartment,
    required this.selectedMaintenance,
    required this.branches,
    required this.departments,
    required this.maintenance,
  });

  HomeModel copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? id,
    DateTime? initialTime,
    String? initialCoordinate,
    String? selectedBranch,
    String? selectedDepartment,
    String? selectedMaintenance,
    List<String>? branches,
    List<String>? departments,
    List<String>? maintenance,
  }) {
    return HomeModel(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      id: id ?? this.id,
      initialTime: initialTime ?? this.initialTime,
      initialCoordinate: initialCoordinate ?? this.initialCoordinate,
      selectedBranch: selectedBranch ?? this.selectedBranch,
      selectedDepartment: selectedDepartment ?? this.selectedDepartment,
      selectedMaintenance: selectedMaintenance ?? this.selectedMaintenance,
      branches: branches ?? this.branches,
      departments: departments ?? this.departments,
      maintenance: maintenance ?? this.maintenance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'id': id,
      'initialTime': initialTime.millisecondsSinceEpoch,
      'initialCoordinate': initialCoordinate,
      'selectedBranch': selectedBranch,
      'selectedDepartment': selectedDepartment,
      'selectedMaintenance': selectedMaintenance,
      'branches': branches,
      'departments': departments,
      'maintenance': maintenance,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      fullName: map['full_name'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      initialTime: DateTime.fromMillisecondsSinceEpoch(map['initial_time'] ?? ''),
      initialCoordinate: map['initial_coordinate'] ?? '',
      selectedBranch: map['selected_branch'],
      selectedDepartment: map['selected_department'],
      selectedMaintenance: map['selected_maintenance'],
      branches: List<String>.from(map['branches']),
      departments: List<String>.from(map['departments']),
      maintenance: List<String>.from(map['maintenance']),
    );
  }



  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) => HomeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomeModel(fullName: $fullName, phoneNumber: $phoneNumber, email: $email, id: $id, initialTime: $initialTime, initialCoordinate: $initialCoordinate, selectedBranch: $selectedBranch, selectedDepartment: $selectedDepartment, selectedMaintenance: $selectedMaintenance, branches: $branches, departments: $departments, maintenance: $maintenance)';
  }

  @override
  List<Object> get props {
    return [
      fullName,
      phoneNumber,
      email,
      id,
      initialTime,
      initialCoordinate,
      selectedBranch,
      selectedDepartment,
      selectedMaintenance,
      branches,
      departments,
      maintenance,
    ];
  }
}

// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class HomeModel extends Equatable {
//   final String fullName;
//   final String selectedBranch;
//   final String selectedDepartment;
//   final String selectedMaintenance;
//   final List<String> branches;
//   final List<String> departments;
//   final List<String> maintenance;
//   const HomeModel({
//     required this.fullName,
//     required this.selectedBranch,
//     required this.selectedDepartment,
//     required this.selectedMaintenance,
//     required this.branches,
//     required this.departments,
//     required this.maintenance,
//   });

//   HomeModel copyWith({
//     String? fullName,
//     String? selectedBranch,
//     String? selectedDepartment,
//     String? selectedMaintenance,
//     List<String>? branches,
//     List<String>? departments,
//     List<String>? maintenance,
//   }) {
//     return HomeModel(
//       fullName: fullName ?? this.fullName,
//       selectedBranch: selectedBranch ?? this.selectedBranch,
//       selectedDepartment: selectedDepartment ?? this.selectedDepartment,
//       selectedMaintenance: selectedMaintenance ?? this.selectedMaintenance,
//       branches: branches ?? this.branches,
//       departments: departments ?? this.departments,
//       maintenance: maintenance ?? this.maintenance,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'fullName': fullName,
//       'selected_branch': selectedBranch,
//       'selected_department': selectedDepartment,
//       'selected_maintenance': selectedMaintenance,
//       'branches': branches,
//       'departments': departments,
//       'maintenance': maintenance,
//     };
//   }

//   factory HomeModel.fromMap(Map<String, dynamic> map) {
//     return HomeModel(
//       fullName: map['full_name'],
//       selectedBranch: map['selected_branch'],
//       selectedDepartment: map['selected_department'],
//       selectedMaintenance: map['selected_maintenance'],
//       branches: List<String>.from(map['branches']),
//       departments: List<String>.from(map['departments']),
//       maintenance: List<String>.from(map['maintenance']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory HomeModel.fromJson(String source) =>
//       HomeModel.fromMap(json.decode(source));

//   @override
//   bool get stringify => true;

//   @override
//   List<Object> get props {
//     return [
//       fullName,
//       selectedBranch,
//       selectedDepartment,
//       selectedMaintenance,
//       branches,
//       departments,
//       maintenance,
//     ];
//   }
// }
