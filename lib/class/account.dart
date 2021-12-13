class Account{
  final int idaccount;
  String username;
  String nama;
  String email;
  String password;

  Account({
    required this.idaccount,
    required this.username,
    required this.nama,
    required this.email,
    required this.password,
  });

  factory Account.fromJson(Map<String, dynamic> json){
    return Account(
      idaccount: json['idaccount'],
      username: json['username'] as String,
      nama: json['nama'],
      email: json['email'],
      password: json['password'],
    );
  }

}

List<Account> ACc = [];

