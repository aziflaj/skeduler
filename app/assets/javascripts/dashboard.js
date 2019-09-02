document.addEventListener('DOMContentLoaded', function () {
  var tabs = document.querySelectorAll('.tabs');
  M.Tabs.init(tabs);

  var fabs = document.querySelectorAll('.fixed-action-btn');
  M.FloatingActionButton.init(fabs);
});


