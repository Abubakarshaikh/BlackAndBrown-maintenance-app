import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class CheckLists extends Equatable {
  final String id;
  final String title;
  final bool status;
  final bool isExpanded;
  final List<CheckListNested> checkListNested;
  CheckLists({
    String? id,
    required this.title,
    required this.status,
    required this.isExpanded,
    required this.checkListNested,
  }) : id = id ?? const Uuid().v4();

  CheckLists copyWith({
    String? id,
    String? title,
    bool? status,
    bool? isExpanded,
    List<CheckListNested>? checkListNested,
  }) {
    return CheckLists(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      isExpanded: isExpanded ?? this.isExpanded,
      checkListNested: checkListNested ?? this.checkListNested,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'title': title,
      // 'status': status,
      // 'is_expanded': isExpanded,
      'check_list_nested': checkListNested.map((x) => x.toMap()).toList(),
    };
  }

  factory CheckLists.fromMap(Map<String, dynamic> map) {
    return CheckLists(
      title: map['title'],
      status: map['status'],
      isExpanded: map['is_expanded'],
      checkListNested: List<CheckListNested>.from(
          map['check_list_nested'].map((x) => CheckListNested.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckLists.fromJson(String source) =>
      CheckLists.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      title,
      status,
      isExpanded,
      checkListNested,
    ];
  }
}

class CheckListNested extends Equatable {
  final String id;
  final String title;
  final bool status;
  final List<SelectChip> selectChips;
  CheckListNested({
    String? id,
    required this.title,
    required this.status,
    required this.selectChips,
  }) : id = id ?? const Uuid().v4();

  CheckListNested copyWith({
    String? id,
    String? title,
    bool? status,
    List<SelectChip>? selectChips,
  }) {
    return CheckListNested(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      selectChips: selectChips ?? this.selectChips,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'title': title,
      // 'status': status,
      'select_chips': selectChips.map((x) => x.toMap()).toString(),
    };
  }

  factory CheckListNested.fromMap(Map<String, dynamic> map) {
    return CheckListNested(
      title: map['title'],
      status: map['status'],
      selectChips: List<SelectChip>.from(
          map['select_chips']?.map((x) => SelectChip.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckListNested.fromJson(String source) {
    return CheckListNested.fromMap(json.decode(source));
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title, status, selectChips];
}

class SelectChip extends Equatable {
  final String id;
  final String title;
  final bool status;
  SelectChip({
    String? id,
    required this.title,
    required this.status,
  }) : id = id ?? const Uuid().v4();

  SelectChip copyWith({
    String? id,
    String? title,
    bool? status,
  }) {
    return SelectChip(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'title': title,
      // 'status': status,
    };
  }

  factory SelectChip.fromMap(Map<String, dynamic> map) {
    return SelectChip(
      title: map['title'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectChip.fromJson(String source) =>
      SelectChip.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title, status];
}
