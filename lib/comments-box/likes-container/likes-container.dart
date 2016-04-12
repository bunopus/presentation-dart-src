import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/entity-container/entity-container.dart';
import 'package:presentation_dart_src/comments-box/entity-service/likes-serivce.dart';
import 'package:presentation_dart_src/comments-box/entity-service/entities-service.dart';
import 'package:presentation_dart_src/comments-box/entity-container/entity-container-interface.dart';
import 'package:presentation_dart_src/comments-box/date-formatter.dart';


@Component(
    selector: 'likes-container',
    template: '''
       <entity-container>
        <div template="#item" class="entry">
          <img class="avatar" src="{{ item.avatarUrl }}">
          <div class="entry-body">
              <img src="img/like.png" class="plain" style="height: 40px">
              <div class="author">{{ item.author }} likes it at {{ formatDate(item.postedAt) }}</div>
          </div>
        </div>
      </entity-container>
    ''',
    providers: const [const Provider(EntitiesService, useClass: LikesService)],
    directives: const [EntityContainer],
    styleUrls: const['../entity-container/entity-container.css']
)

class LikesContainer extends Object with DateFormatter implements EntityContainerInterface {
  @ViewChild(EntityContainer) EntityContainer container;

  LikesContainer() {}

  @override
  void getEntries() {
    container?.getEntries();
  }

  @override
  void getSortedEntries(bool asc) {
    container?.getSortedEntries(asc);
  }

  @override
  void stream(bool on) {
    container?.stream(on);
  }
}
