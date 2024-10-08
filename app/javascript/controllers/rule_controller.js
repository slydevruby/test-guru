import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    select: String,
    index: Number
  }  
  static targets = ['category', 'test', 'level', 'parameter']

  changeVisible(target, visible_select) {

    this.selects.forEach( el => {
      if (el != target && el != visible_select) { 
        el.classList.add('hide'); 
      }
    });
   
    visible_select.classList.remove('hide');
  }
      
  change_rule(e) {
    var event = new Event('change');

    if (e.target.value.toLowerCase() === 'category') {
      this.changeVisible(e.target, this.categoryTarget) 
      this.categoryTarget.dispatchEvent(event);    
    } else if (e.target.value.toLowerCase() === 'test') {
      this.testTarget.dispatchEvent(event);    
      this.changeVisible(e.target, this.testTarget)
    } else {
      this.changeVisible(e.target, this.levelTarget)
    }
 
  }

  change_foo(e) {
    this.parameterTarget.value = e.target.value
  }
  connect() { 
    if (this.selectValue === 'category') {
       this.categoryTarget.classList.remove('hide')
       this.categoryTarget.selectedIndex = this.indexValue
       
    } else if (this.selectValue === 'test') {
       this.testTarget.classList.remove('hide')
       this.testTarget.selectedIndex = this.indexValue
    } else {
       this.levelTarget.classList.remove('hide')
       this.levelTarget.selectedIndex = this.indexValue

    }
    this.selects = this.element.querySelectorAll('[data-rule-target]');
  }
}
