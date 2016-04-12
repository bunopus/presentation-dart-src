import 'package:angular2/core.dart';
import './tab.dart';

@Component(
  selector: 'tabs',
  template:'''
    <div class="menu">
      <div class="tabs">
        <div *ngFor="#tab of tabs" (click)="selectTab(tab)" [class.active]="tab.active" class="tab">
          <div class="tab-title">{{tab.title}}</div>
        </div>
      </div>
    </div>
    <ng-content></ng-content>
  ''',
  directives: const[Tab],
  styleUrls: const['tabs.css']
)
class Tabs implements AfterContentInit {

  @ContentChildren(Tab) QueryList<Tab> tabs;

  Tab get active => tabs.firstWhere((Tab t) => t.active, orElse: null);

  ngAfterContentInit() {
    if(tabs.isEmpty){
      return;
    }

    var activeTab = tabs.firstWhere((Tab tab) => tab.active,
        orElse: () => null);

    if (activeTab == null) {
      selectTab(tabs.first);
    }
  }

  selectTab(Tab tab) {
    tabs.forEach((Tab tab) => tab.active = false);
    tab.active = true;
    tab.initContainer();
  }
}
