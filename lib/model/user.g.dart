// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['login'] as String,
      json['id'] as int,
      json['node_id'] as String,
      json['avatar_url'] as String,
      json['gravatar_id'] as String,
      json['url'] as String,
      json['html_url'] as String,
      json['followers_url'] as String,
      json['following_url'] as String,
      json['gists_url'] as String,
      json['starred_url'] as String,
      json['subscriptions_url'] as String,
      json['organizations_url'] as String,
      json['repos_url'] as String,
      json['events_url'] as String,
      json['received_events_url'] as String,
      json['type'] as String,
      json['site_admin'] as bool,
      json['name'] as String?,
      json['company'] as String?,
      json['blog'] as String?,
      json['location'] as String?,
      json['email'] as String?,
      json['hireable'] as bool?,
      json['twitter_username'] as String?,
      json['public_repos'] as int?,
      json['public_gists'] as int?,
      json['followers'] as int?,
      json['following'] as int?,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.node_id,
      'avatar_url': instance.avatar_url,
      'gravatar_id': instance.gravatar_id,
      'url': instance.url,
      'html_url': instance.html_url,
      'followers_url': instance.followers_url,
      'following_url': instance.following_url,
      'gists_url': instance.gists_url,
      'starred_url': instance.starred_url,
      'subscriptions_url': instance.subscriptions_url,
      'organizations_url': instance.organizations_url,
      'repos_url': instance.repos_url,
      'events_url': instance.events_url,
      'received_events_url': instance.received_events_url,
      'type': instance.type,
      'site_admin': instance.site_admin,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'hireable': instance.hireable,
      'twitter_username': instance.twitter_username,
      'public_repos': instance.public_repos,
      'public_gists': instance.public_gists,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
