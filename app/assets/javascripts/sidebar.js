// The JQuery code to show and hide the sidebar at the click of a button.
$(document).ready(function(){
  $("button").click(function(){
    $("div.well").toggle();
  });
});
