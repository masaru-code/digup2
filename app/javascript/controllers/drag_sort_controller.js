import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
    const draggable = this.data.get('draggable');
    if (draggable == 'enable') {
      this.sortable = Sortable.create(this.element, {
        onEnd: this.end.bind(this)
      })
    }
  }

  end(event) {
    const id = event.item.dataset.id
    const data = new FormData()
    data.append("position", event.newIndex + 1)

    Rails.ajax({
      url: this.data.get("url").replace(":id", id),
      type: 'PATCH',
      data: data
    })
  }
}