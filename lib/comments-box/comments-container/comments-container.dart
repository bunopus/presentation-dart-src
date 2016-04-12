import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/entity-service/comments-serivce.dart';
import 'package:presentation_dart_src/comments-box/entity-container/entity-container.dart';
import 'package:presentation_dart_src/comments-box/entity-service/entities-service.dart';
import 'package:presentation_dart_src/comments-box/entity-container/entity-container-interface.dart';
import 'package:presentation_dart_src/comments-box/date-formatter.dart';


@Component(
    selector: 'comments-container',
    template: '''
      <entity-container>
        <div template="#item" class="entry">
          <img class="avatar" src="{{ item.avatarUrl }}">
          <div class="entry-body">
              {{ item.description }}
              <div class="author">{{ item.author }} wrote at {{ formatDate(item.postedAt) }}</div>
          </div>
        </div>
      </entity-container>
    ''',
    providers: const [const Provider(EntitiesService, useClass: CommentsService)],
    directives: const [EntityContainer],
    styleUrls: const['../entity-container/entity-container.css']
)

class CommentsContainer extends Object with DateFormatter implements EntityContainerInterface  {

  @ViewChild(EntityContainer) EntityContainer container;

  CommentsContainer() {}

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
