
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User{

  User(
      this.login,
      this.id,
      this.node_id,
      this.avatar_url,
      this.gravatar_id,
      this.url,
      this.html_url,
      this.followers_url,
      this.following_url,
      this.gists_url,
      this.starred_url,
      this.subscriptions_url,
      this.organizations_url,
      this.repos_url,
      this.events_url,
      this.received_events_url,
      this.type,
      this.site_admin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.twitter_username,
      this.public_repos,
      this.public_gists,
      this.followers,
      this.following,
      this.created_at,
      this.updated_at);

  String login;
  int id;
  String node_id;
  String avatar_url;
  String gravatar_id;
  String url;
  String html_url;
  String followers_url;
  String following_url;
  String gists_url;
  String starred_url;
  String subscriptions_url;
  String organizations_url;
  String repos_url;
  String events_url;
  String received_events_url;
  String type;
  bool site_admin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  bool? hireable;
  String? twitter_username;
  int? public_repos;
  int? public_gists;
  int? followers;
  int? following;
  DateTime? created_at;
  DateTime? updated_at;



  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}