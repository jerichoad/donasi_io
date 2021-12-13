class Donasi{
  final int idaccount;
  final int idcampaign;
  
  int nominal;
  String komentar;
  final List? accounts;
  final List? campaigns;

  Donasi({
    required this.idaccount,
    required this.idcampaign,
    required this.nominal,
    required this.komentar,
    required this.accounts,
    required this.campaigns,
  });

  factory Donasi.fromJson(Map<String, dynamic> json){
    return Donasi(
      idaccount: json['idaccount'],
      idcampaign: json['idcampaign'],
      nominal: json['nominal'],
      komentar: json['komentar'],
      accounts: json['accounts'],
      campaigns: json['campaigns'],
    );
  }

}

List<Donasi> DNs = [];

