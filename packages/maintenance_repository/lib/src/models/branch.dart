import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Branch extends Equatable {
  final String id;
  final String branchName;
  final bool isChecked;
  Branch({
    String? id,
    required this.branchName,
    required this.isChecked,
  }) : id = id ?? const Uuid().v4();

  Branch copyWith({
    String? id,
    String? branchName,
    bool? isChecked,
  }) {
    return Branch(
      id: id ?? this.id,
      branchName: branchName ?? this.branchName,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'branchName': branchName,
      'isChecked': isChecked,
    };
  }

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      id: map['id'] ?? '',
      branchName: map['branchName'] ?? '',
      isChecked: map['isChecked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Branch.fromJson(String source) => Branch.fromMap(json.decode(source));

  @override
  String toString() =>
      'Branch(id: $id, branchName: $branchName, isChecked: $isChecked)';

  @override
  List<Object> get props => [id, branchName, isChecked];
}

List<Branch> branchSample = [
  Branch(branchName: "Autobahn", isChecked: true),
  Branch(branchName: "Hairder Chowk", isChecked: true),
  Branch(branchName: "Wadhu Wah", isChecked: true),
  Branch(branchName: "Garrison Qasim Chowk", isChecked: true),
  Branch(branchName: "Latifabad Unit 7", isChecked: true),
  Branch(branchName: "Main qasimabad", isChecked: true),
  Branch(branchName: "Gymkhana", isChecked: true),
  Branch(branchName: "Naseem Nagar", isChecked: true),
  Branch(branchName: "Saddar", isChecked: true),
  Branch(branchName: "Hirabad", isChecked: true),
  Branch(branchName: "Autobahn 2", isChecked: true),
  Branch(branchName: "Latifabad Unit 9", isChecked: true),
  Branch(branchName: "Saddar 2", isChecked: true),
  Branch(branchName: "Alamdar Chowk", isChecked: true),
  Branch(branchName: "Afandi Town", isChecked: true),
];
