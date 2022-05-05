import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_repository/maintenance_repository.dart';

class Filter extends Equatable {
  final String workType;
  final DateTimeRange? dateTimeRanges;
  final List<Branch> branches;
  const Filter({
    required this.workType,
    this.dateTimeRanges,
    required this.branches,
  });

  Filter copyWith({
    String? workType,
    DateTimeRange? dateTimeRanges,
    List<Branch>? branches,
  }) {
    return Filter(
      workType: workType ?? this.workType,
      dateTimeRanges: dateTimeRanges ?? this.dateTimeRanges,
      branches: branches ?? this.branches,
    );
  }

  @override
  List<Object?> get props => [workType, dateTimeRanges, branches];
}
