class JoinOurTeamJobs {
  List<String>? data;

  JoinOurTeamJobs({
    this.data,
  });

  factory JoinOurTeamJobs.fromJson(Map<String, dynamic> json) => JoinOurTeamJobs(
    data:json["data"] == null
    ? []: List<String>.from(json["data"].map((x) => x)),
  );
}
