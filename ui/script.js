$(function () {
  $(".container").hide()
  window.addEventListener("message", function (event) {
    var item = event.data;
    if (item.resource === "Bilbutik") {
      if (item.open) $(".container").fadeIn(100);
      if (item.close) $(".container").fadeOut(100);
      if (item.loadList) $.post('https://Bilbutik/loadList', JSON.stringify({}));
      if (item.list) loadList(item.list);
    }
  });
});

$(document).on('keydown', function(e) {
  if (e.key === "Escape") {
    closeMenu();
  }
});

const closeMenu = () => {
  $.post('https://Bilbutik/close', JSON.stringify({}))
};

const loadList = (list) => {
  $(".carlist").empty()
  list.forEach((veh) => {
    $(".carlist").append(
      `<div class="car">
        <h1>${veh.vehicle}</h1>
        <h2>Pris: ${veh.price}</h2>
        <h3>Køb med:<br>/buycar ${veh.plate}</h3>
      </div>`
      )
  })
}