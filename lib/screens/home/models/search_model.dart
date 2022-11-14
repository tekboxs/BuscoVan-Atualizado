// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SearchModel {
  final String driverName;
  final String route;
  final String driverPhone;
  SearchModel({
    required this.driverName,
    required this.route,
    required this.driverPhone,
  });

  SearchModel copyWith({
    String? driverName,
    String? route,
    String? driverPhone,
  }) {
    return SearchModel(
      driverName: driverName ?? this.driverName,
      route: route ?? this.route,
      driverPhone: driverPhone ?? this.driverPhone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'driverName': driverName,
      'route': route,
      'driverPhone': driverPhone,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      driverName: map['nome'] as String,
      route: map['selectedRoute'] as String,
      driverPhone: map['numeroCelular'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SearchModel(driverName: $driverName, route: $route, driverPhone: $driverPhone)';

  @override
  bool operator ==(covariant SearchModel other) {
    if (identical(this, other)) return true;

    return other.driverName == driverName &&
        other.route == route &&
        other.driverPhone == driverPhone;
  }

  @override
  int get hashCode =>
      driverName.hashCode ^ route.hashCode ^ driverPhone.hashCode;
}
