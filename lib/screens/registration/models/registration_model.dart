// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegistrationModel {
  final String cpf;
  final String email;
  final String nome;
  final String numeroCelular;
  final String senha;
  final String ultimoNome;
  RegistrationModel({
    required this.cpf,
    required this.email,
    required this.nome,
    required this.numeroCelular,
    required this.senha,
    required this.ultimoNome,
  });

  RegistrationModel copyWith({
    String? cpf,
    String? email,
    String? nome,
    String? numeroCelular,
    String? senha,
    String? ultimoNome,
  }) {
    return RegistrationModel(
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      nome: nome ?? this.nome,
      numeroCelular: numeroCelular ?? this.numeroCelular,
      senha: senha ?? this.senha,
      ultimoNome: ultimoNome ?? this.ultimoNome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cpf': cpf,
      'email': email,
      'nome': nome,
      'numeroCelular': numeroCelular,
      'senha': senha,
      'ultimoNome': ultimoNome,
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      cpf: map['cpf'] as String,
      email: map['email'] as String,
      nome: map['nome'] as String,
      numeroCelular: map['numeroCelular'] as String,
      senha: map['senha'] as String,
      ultimoNome: map['ultimoNome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) =>
      RegistrationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistrationModel(cpf: $cpf, email: $email, nome: $nome, numeroCelular: $numeroCelular, senha: $senha, ultimoNome: $ultimoNome)';
  }

  @override
  bool operator ==(covariant RegistrationModel other) {
    if (identical(this, other)) return true;

    return other.cpf == cpf &&
        other.email == email &&
        other.nome == nome &&
        other.numeroCelular == numeroCelular &&
        other.senha == senha &&
        other.ultimoNome == ultimoNome;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
        email.hashCode ^
        nome.hashCode ^
        numeroCelular.hashCode ^
        senha.hashCode ^
        ultimoNome.hashCode;
  }
}
