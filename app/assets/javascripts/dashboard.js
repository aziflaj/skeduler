document.addEventListener('DOMContentLoaded', function () {
  loadData().then(() => populateViews());

  const tabs = document.querySelectorAll('.tabs');
  M.Tabs.init(tabs);

  const fabs = document.querySelectorAll('.fixed-action-btn');
  M.FloatingActionButton.init(fabs);

  const modals = document.querySelectorAll('.modal');
  M.Modal.init(modals);

  const datepickers = document.querySelectorAll('.datepicker');
  M.Datepicker.init(datepickers);

  const timepickers = document.querySelectorAll('.timepicker');
  M.Timepicker.init(timepickers);
});

const loadData = async () => {
  const free_slots_response = await fetch('/slots/free');
  const upcoming_meetings_response = await fetch('/slots/upcoming');

  window.slots = {
    upcoming: await upcoming_meetings_response.json(),
    free: await free_slots_response.json(),
  };
};

const populateViews = () => {
  const slots = window.slots;

  populateUpcomingMeetings(slots.upcoming);
  populateFreeSlots(slots.free);
};

const populateUpcomingMeetings = (data) => {
  const template = `<li>Meeting with <a href="mailto:$guest_email">$guest_email</a> at $time</li>`;
  const dateOptions = {hour: '2-digit', minute: '2-digit', day: '2-digit', month: 'short', year: 'numeric'};

  document.querySelector('ul.upcoming-meetings').innerHTML = data.map(item => {
    const formattedDate = (new Date(item.scheduled_at)).toLocaleString('en-US', dateOptions)
    return template.replace('$time', formattedDate)
      .replace(/\$guest_email/g, item.guest_email)
  }).join('');
};

const populateFreeSlots = (data) => {
  const template = `<li>Free slot at $time</li>`;
  const dateOptions = {hour: '2-digit', minute: '2-digit', day: '2-digit', month: 'short', year: 'numeric'};

  document.querySelector('ul.free-slots').innerHTML = data.map(item => {
    const formattedDate = (new Date(item.scheduled_at)).toLocaleString('en-US', dateOptions)
    return template.replace('$time', formattedDate)
  }).join('');
};
