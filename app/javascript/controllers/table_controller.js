// table_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  
  click(e){
    Turbolinks.visit(this.url)
  }

  get url() {
    return this.targets.find('url').href
  }
  
}