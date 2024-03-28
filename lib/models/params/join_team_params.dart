class JoinTeamParams {
  String? phone;
  String? name;
  String? job;
  JoinTeamParams({this.phone, this.name,this.job});
  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "job": job,

  };
}