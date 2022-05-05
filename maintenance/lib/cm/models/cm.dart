import 'dart:convert';

import 'package:equatable/equatable.dart';

class CMModel extends Equatable {
  final String findings;
  final String complainerName;
  final String materialRequirement;
  const CMModel({
    this.findings = '',
    this.complainerName = '',
    this.materialRequirement = '',
  });

  CMModel copyWith({
    String? findings,
    String? complainerName,
    String? materialRequirement,
  }) {
    return CMModel(
      findings: findings ?? this.findings,
      complainerName: complainerName ?? this.complainerName,
      materialRequirement: materialRequirement ?? this.materialRequirement,
    );
  }

  @override
  List<Object> get props => [findings, complainerName, materialRequirement];

  Map<String, dynamic> toMap() {
    return {
      'findings': findings,
      'complainerName': complainerName,
      'materialRequirement': materialRequirement,
    };
  }

  factory CMModel.fromMap(Map<String, dynamic> map) {
    return CMModel(
      findings: map['findings'] ?? '',
      complainerName: map['complainerName'] ?? '',
      materialRequirement: map['materialRequirement'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CMModel.fromJson(String source) =>
      CMModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CMModel(findings: $findings, complainerName: $complainerName, materialRequirement: $materialRequirement)';
}
