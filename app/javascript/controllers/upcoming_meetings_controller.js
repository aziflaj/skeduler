import { Controller } from "stimulus"

export default class extends Controller {
  template = `<li>Meeting with <a href="mailto:$guest_email">$guest_email</a> at $time</li>`;
  dateOptions = {hour: '2-digit', minute: '2-digit', day: '2-digit', month: 'short', year: 'numeric'};

  connect() {
    this.load()
  }

  load() {
    fetch('/slots/upcoming')
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
        .replace(/\$guest_email/g, item.guest_email)
    }).join('');
  }
}
