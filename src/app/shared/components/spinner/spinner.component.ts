import {Component, Input} from '@angular/core';

@Component({
  selector: 'spinner',
  template: `
    <div [hidden]="!isRunning" class="spinner">
      <div class="spinner-inner-wrapper" [ngClass]="{'spinner-small': isSmall}">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
      </div>
    </div>
  `,
  styleUrls: ['./spinner.component.scss']
})
export class SpinnerComponent {

  @Input() isRunning: boolean;
  @Input() isSmall: string;
}
