import { Controller } from "stimulus"

export default class extends Controller {
  template = `<li>Free slot at $time</li>`;
  dateOptions = {hour: '2-digit', minute: '2-digit', day: '2-digit', month: 'short', year: 'numeric'};

  connect() {
    this.load()
  }

  load() {
    fetch('/slots/free')
      .then(response => response.json())
      .then(data => this.jsonToHtml(data))
      .then(html => {
        this.element.innerHTML = html
      })
  }

  jsonToHtml(data) {
    return data.map(item => {
      const formattedDate = (new Date(item.scheduled_at)).toLocaleString('en-US', this.dateOptions)
      return this.template.replace('$time', formattedDate)
    }).join('');
  }
}
