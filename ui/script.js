$(function () {
  $(".container").hide()
  window.addEventListener("message", function (event) {
    var item = event.data;
    if (item.resource === "Bilbutik") {
      if (item.open) {
        $(".container").fadeIn(100)
      } else {
        $(".container").fadeOut(100)
      }
    }
  });
});

$(document).on('keydown', function(e) {
  if (e.key === "Escape") {
    closeMenu()
  }
});

const closeMenu = () => {
  $.post('https://Bilbutik/close', JSON.stringify({}))
}