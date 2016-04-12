import 'package:angular2/core.dart';
import 'package:presentation_dart_src/tabs-component/tabs.dart';
import 'package:presentation_dart_src/tabs-component/tab.dart';
import 'package:presentation_dart_src/comments-box/comments-container/comments-container.dart';
import 'package:presentation_dart_src/comments-box/likes-container/likes-container.dart';


@Component(
    selector: 'comments-box',
    templateUrl: 'comments-box.html',
    styleUrls: const ['comments-box.css'],
    directives: const [Tabs, Tab, CommentsContainer, LikesContainer]
)

class CommentsBox {
  bool sortedAsc = true;
  bool streamOn = false;

  bool sorting;
  bool likes;
  bool stream;

  @ViewChild(Tabs) Tabs tabs;

  CommentsBox(@Attribute('sorting') String srtg, @Attribute('likes') String lks, @Attribute('stream') String strm) {
    sorting = _fromString(srtg);
    likes = _fromString(lks);
    stream = _fromString(strm);
  }

  bool _fromString(String inp) => inp == 'true' ? true : false;

  void sort(){
    tabs.active?.sort(sortedAsc);
    sortedAsc = !sortedAsc;
  }

  void streamingSwitch(){
    streamOn = !streamOn;
    tabs.active?.stream(streamOn);
  }
}
