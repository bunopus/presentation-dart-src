import 'package:params/annotation.dart';

class Entity extends Object with Serialize {
  @ModelParameter()
  String author;

  @ModelParameter()
  String avatarUrl;

  @ModelParameter()
  DateTime postedAt;

  @override
  final $container$;
  Entity():this.$container$ = {};
  Entity.fromMap(this.$container$);
}