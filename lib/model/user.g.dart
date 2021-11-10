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
    };
