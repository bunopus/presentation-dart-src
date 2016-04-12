import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/comments-box.dart';


@Component(
    selector: 'comments-and-likes',
    templateUrl: 'comments-and-likes.html',
    directives:  const [CommentsBox]
)

class CommentsAndLikes {
}
