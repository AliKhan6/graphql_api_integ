class Data {
  String? id;
  String? userId;
  String? firstName;
  String? backgroundColor;
  String? blockNumber;
  String? instagram;
  int? followedUsers;
  int? followingUsers;
  List<String>? tags;

  Data({
    this.id,
    this.userId,
    this.firstName,
    this.backgroundColor,
    this.blockNumber,
    this.instagram,
    this.followedUsers,
    this.followingUsers,
    this.tags,
  });

  Data.fromJson(json) {
    id = json["id"];
    userId = json["userId"];
    firstName = json["firstName"];
    backgroundColor = json["backgroundColor"];
    blockNumber = json["blockNumber"];
    instagram = json["instagram"];
    followedUsers = json["followedUsersCount"];
    followingUsers = json["followingUsersCount"];
    if (json["tags"].isNotEmpty) {
      tags = [];
      json["tags"].forEach((v) {
        tags!.add(v);
      });
    }
  }
}
