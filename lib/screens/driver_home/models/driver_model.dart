// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DriverModel {
  final String cpf;
  final String? image;
  final String email;
  final List? routes;
  final String nome;
  final String numeroCelular;
  final String senha;
  final String ultimoNome;
  DriverModel({
    required this.cpf,
    this.image,
    required this.email,
    required this.routes,
    required this.nome,
    required this.numeroCelular,
    required this.senha,
    required this.ultimoNome,
  });

  DriverModel copyWith({
    String? cpf,
    String? image,
    String? email,
    List? routes,
    String? nome,
    String? numeroCelular,
    String? senha,
    String? ultimoNome,
  }) {
    return DriverModel(
      cpf: cpf ?? this.cpf,
      image: image ?? this.image,
      email: email ?? this.email,
      routes: routes ?? this.routes,
      nome: nome ?? this.nome,
      numeroCelular: numeroCelular ?? this.numeroCelular,
      senha: senha ?? this.senha,
      ultimoNome: ultimoNome ?? this.ultimoNome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cpf': cpf,
      'image': image,
      'email': email,
      'routes': routes,
      'nome': nome,
      'numeroCelular': numeroCelular,
      'senha': senha,
      'ultimoNome': ultimoNome,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      cpf: (map['cpf'] ?? "") as String,
      image: map['image'],
      email: (map['email'] ?? "") as String,
      routes: (map['rotas'] ?? []),
      nome: (map['nome'] ?? "") as String,
      numeroCelular: (map['numeroCelular'] ?? "") as String,
      senha: (map['senha'] ?? "") as String,
      ultimoNome: (map['ultimoNome'] ?? "") as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DriverModel(cpf: $cpf, image: $image, email: $email, routes: $routes, nome: $nome, numeroCelular: $numeroCelular, senha: $senha, ultimoNome: $ultimoNome)';
  }

  @override
  bool operator ==(covariant DriverModel other) {
    if (identical(this, other)) return true;

    return other.cpf == cpf &&
        other.image == image &&
        other.email == email &&
        other.routes == routes &&
        other.nome == nome &&
        other.numeroCelular == numeroCelular &&
        other.senha == senha &&
        other.ultimoNome == ultimoNome;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
        image.hashCode ^
        email.hashCode ^
        routes.hashCode ^
        nome.hashCode ^
        numeroCelular.hashCode ^
        senha.hashCode ^
        ultimoNome.hashCode;
  }
}
