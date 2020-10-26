document.addEventListener('DOMContentLoaded', function () {
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
