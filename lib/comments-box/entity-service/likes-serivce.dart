import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/entity-service/entities-service.dart';
import 'package:presentation_dart_src/comments-box/models/like.dart';

@Injectable()
class LikesService extends EntitiesService<Like> {

  @override
  String get url => '/json/likes.json';

  @override
  Like deserializeEntity(Map entity) => new Like.fromMap(entity);
}