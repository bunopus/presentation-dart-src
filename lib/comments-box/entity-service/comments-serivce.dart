import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/entity-service/entities-service.dart';
import 'package:presentation_dart_src/comments-box/models/comment.dart';

@Injectable()
class CommentsService extends EntitiesService<Comment> {

  @override
  String get url => 'json/comments.json';

  @override
  Comment deserializeEntity(Map entity) => new Comment.fromMap(entity);
}