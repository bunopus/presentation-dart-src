import 'package:params/annotation.dart';
import 'package:presentation_dart_src/comments-box/models/entity.dart';

class Comment extends Entity {
  @ModelParameter()
  String description;

  @override
  final $container$;
  Comment():this.$container$ = {};
  Comment.fromMap(this.$container$);
}