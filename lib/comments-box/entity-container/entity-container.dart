import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/models/entity.dart';
import 'package:presentation_dart_src/comments-box/entity-service/entities-service.dart';
import 'package:presentation_dart_src/comments-box/entity-container/entity-container-interface.dart';
import 'package:presentation_dart_src/limited-list.dart';
import 'package:presentation_dart_src/constants.dart';
import 'dart:async';


@Component(
    selector: 'entity-container',
    templateUrl: 'entity-container.html',
    styleUrls: const ['entity-container.css']
)

class EntityContainer implements OnInit, EntityContainerInterface {

  @ContentChild(TemplateRef) TemplateRef contentTpl;

  EntitiesService _service;
  LimitedList<Entity> entities;
  bool isLoading;

  StreamSubscription<Entity> _sub;

  EntityContainer(EntitiesService this._service) {
  }

  @override
  ngOnInit() {
    getEntries();
  }

  void getEntries(){
    _setEntries(_service.getEntities);
  }

  void getSortedEntries(bool asc){
    _setEntries(() => _service.getSorted(asc: asc));
  }

  void _setEntries(Function entitiesGetter) {
    isLoading = true;
    entitiesGetter().then((List<Entity> entriesFromServer) {
      entities = new LimitedList.fromList(entriesFromServer, limit: CONST.entitiesToShow);
    }).whenComplete(() => isLoading = false);
  }

  @override
  void stream(bool on) {
    if(_sub == null){
      _sub =_service.stream.listen((Entity ent) {
        entities.add(ent);
      });
      _sub.pause();
    }
    if(on){
      _sub.resume();
    } else {
      _sub.pause();
    }
  }
}
