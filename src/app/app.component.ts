import { Component } from '@angular/core';
import * as firebase from 'firebase';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html'
})
export class AppComponent {
  constructor() {
    firebase.initializeApp(environment.firebase);
  }
}
