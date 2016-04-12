import 'package:angular2/core.dart';
import 'package:presentation_dart_src/comments-box/entity-container/entity-container-interface.dart';

@Component(
  selector: 'tab',
  template: '''
    <div [hidden]="!active">
      <ng-content></ng-content>
    </div>
  '''
)
class Tab {
  @Input('tabTitle') String title;
  @Input() bool active = false;
  @ContentChild('container') EntityContainerInterface container;

  void initContainer(){
    container?.getEntries();
  }

  void sort(bool asc){
    container?.getSortedEntries(asc);
  }

  void stream(bool on){
    container?.stream(on);
  }
}