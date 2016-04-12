import 'package:angular2/core.dart';
import 'dart:async';
import 'package:presentation_dart_src/comments-box/models/entity.dart';
import 'package:presentation_dart_src/constants.dart';
import 'dart:html';
import 'dart:convert';

@Injectable()
abstract class EntitiesService<T extends Entity> {

  String get url;
  T deserializeEntity(Map entity);

  final StreamController<T> _controller = new StreamController();
  Stream<T> get stream => _controller.stream;
  List<T> _entities;
  Timer _streamTimer;


  EntitiesService(){
    _controller.onListen = (){
      if(_entities == null) {
        _getData(new Duration()).then((List<T> enty) {
          _entities = enty;
          startEntitiesStreamLoop();
        });
      }
    };
    _controller.onCancel = (){
      if(!_controller.hasListener){
        _streamTimer.cancel();
      }
    };
  }

  void startEntitiesStreamLoop() {
    int index = 0;
    _streamTimer = new Timer.periodic(CONST.loopDelay, (Timer t) {
      if (index >= _entities.length) {
        index = 0;
      };
      _controller.add(_entities[index]);
      index++;
    });
  }

  Future<List<T>> getEntities() {
    return _getData().then((List<T> entities) => entities.sublist(0, CONST.entitiesToShow));
  }

  Future<List<T>> getSorted({bool asc: true}) {
    return _getData(new Duration(seconds: 1)).then((List<T> entities) {
      entities.sort((a, b) {
        var sort = a.postedAt.compareTo(b.postedAt);
        return asc ? sort: -sort;
      });
      return entities.sublist(0, CONST.entitiesToShow);
    });
  }

  Future<List<T>> _getData([Duration delay = CONST.serverDelay]) async {
    try {
      //imitate server
      await new Future.delayed(delay);
      List<T> retVal = [];
      var entitiesRaw = await HttpRequest.getString(url);
      List<Map> entitiesDecoded = JSON.decode(entitiesRaw);
      entitiesDecoded.forEach((Map entity){
        retVal.add(deserializeEntity(entity));
      });
      return retVal;
    } catch (e) {
      print('Couldn\'t open ${url}');
      return null;
    }
  }


}

