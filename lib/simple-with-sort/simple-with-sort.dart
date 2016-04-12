import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/comments-box.dart';


@Component(
    selector: 'simple-with-sort',
    templateUrl: 'simple-with-sort.html',
    directives:  const [CommentsBox]
)

class SimpleWithSort {
}
