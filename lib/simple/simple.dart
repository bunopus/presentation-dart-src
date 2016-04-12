import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/comments-box.dart';


@Component(
    selector: 'simple',
    templateUrl: 'simple.html',
    directives:  const [CommentsBox]
)

class Simple {
}
