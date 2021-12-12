class Campaign{
  final int idcampaign;
  String namacampaign;
  int target;
  String desc;
  String extension_campaign;
  final int campaign_owner;
  int isurgent;

  Campaign({
    required this.idcampaign,
    required this.namacampaign,
    required this.target,
    required this.desc,
    required this.extension_campaign,
    required this.campaign_owner,
    required this.isurgent
  });

  factory Campaign.fromJson(Map<String, dynamic> json){
    return Campaign(
      idcampaign: json['idcampaign'],
      namacampaign: json['namacampaign'] as String,
      target: json['target'],
      desc: json['desc'],
      extension_campaign: json['extension_campaign'],
      campaign_owner: json['campaign_owner'],
      isurgent: json['isurgent'],
    );
  }

}

List<Campaign> CPs = [];

