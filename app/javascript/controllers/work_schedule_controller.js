import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("読み込まれた！");
  }
}
