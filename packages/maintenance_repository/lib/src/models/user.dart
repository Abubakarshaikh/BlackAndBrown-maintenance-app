import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String number;
  final String photo;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.photo,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? number,
    String? photo,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'number': number,
      'photo': photo,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      number: map['number'] ?? '',
      photo: map['photo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, number: $number, photo: $photo)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      number,
      photo,
    ];
  }
}
