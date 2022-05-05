import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maintenance_repository/src/models/filter.dart';

class MaintenanceRepository {
  Future<HomeModel> loadHomeModel() async {
    final fromJson = await _loadAsset(
        "packages/maintenance_repository/json/home_model.json");
    return HomeModel.fromJson(fromJson);
  }

  Future<List<CheckLists>> getCheckLists({required String dept}) async {
    final String fromJson =
        await _loadAsset("packages/maintenance_repository/json/$dept.json");
    final fromModel = jsonDecode(fromJson) as List<dynamic>;
    return List.from(fromModel.map((checkList) {
      return CheckLists.fromMap(checkList);
    }).toList());
  }

  Future<String> _loadAsset(String path) {
    return rootBundle.loadString(path);
  }

  Future<void> addCm({required Cm cm}) async {
    final _collection = FirebaseFirestore.instance.collection('cm');
    // await _collection.doc(cm.id).set(cm.toMap());
    await _collection.add(cm.toMap());
  }

  Future<void> addPm({required WorkOrder workOrder}) async {
    final _collection = FirebaseFirestore.instance.collection('work_order');
    await _collection.add(workOrder.toMap());
  }

  Future<void> addHcl({required Hcl hcl}) async {
    final _collection = FirebaseFirestore.instance.collection('hcl');
    await _collection.add(hcl.toMap());
  }

  Future<void> addWorkOrder({required WorkOrder workOrder}) async {
    final _collection = FirebaseFirestore.instance.collection('work_order');
    await _collection.add(workOrder.toMap());
  }

  Stream<List<WorkOrder>> loadWorkOrders() {
    return FirebaseFirestore.instance
        .collection('work_order').orderBy('endingTime', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return WorkOrder.fromSnapshot(doc);
      }).toList();
    });
  }

  Stream<List<WorkOrder>> updatedWorkOrders({required Filter filter}) {
    return FirebaseFirestore.instance
        .collection('work_order')
        .orderBy('endingTime', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return WorkOrder.fromSnapshot(doc);
      }).where((workorder1) {
        return filter.workType == "All" ||
            workorder1.workType == filter.workType;
      }).where((workorder2) {
        return filter.branches
            .firstWhere((filter) => filter.branchName == workorder2.branch)
            .isChecked;
      }).where((workorder3) {
        if (filter.dateTimeRanges == null) return true;
        List<DateTime> days = [];
        for (int i = 0;
            i <=
                filter.dateTimeRanges!.end
                    .difference(filter.dateTimeRanges!.start)
                    .inDays;
            i++) {
          days.add(filter.dateTimeRanges!.start.add(Duration(days: i)));
        }
        return days.any((t) {
          return workorder3.startingTime.toString().substring(
                  0, workorder3.startingTime.toString().indexOf(' ')) ==
              t.toString().substring(0, t.toString().indexOf(' '));
        });
      }).toList();
    });
  }
}
