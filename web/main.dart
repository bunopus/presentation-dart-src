import 'package:angular2/platform/browser.dart';
import 'package:presentation_dart_src/simple/simple.dart';
import 'package:presentation_dart_src/simple-with-sort/simple-with-sort.dart';
import 'package:presentation_dart_src/comments-and-likes/comments-and-likes.dart';
import 'package:presentation_dart_src/comments-box/entity-service/comments-serivce.dart';
import 'package:presentation_dart_src/comments-box/entity-service/likes-serivce.dart';
import 'package:presentation_dart_src/comments-stream/comments-stream.dart';

main() {
  bootstrap(Simple, [CommentsService]);
  bootstrap(SimpleWithSort, [CommentsService]);
  bootstrap(CommentsAndLikes, [CommentsService, LikesService]);
  bootstrap(CommentsStream, [CommentsService]);
}
