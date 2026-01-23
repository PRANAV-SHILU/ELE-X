function showAll() {
  var items = document.querySelectorAll(".product");

  items.forEach(function (item) {
    item.classList.remove("hidden");
  });
}

function filterCategory(category) {
  var items = document.querySelectorAll(".product");

  items.forEach(function (item) {
    if (item.classList.contains(category)) {
      item.classList.remove("hidden");
    } else {
      item.classList.add("hidden");
    }
  });
}

document.addEventListener("DOMContentLoaded", () => {
  const hamburger = document.getElementById("hamburger");
  const menu = document.getElementById("menu");

  if (hamburger && menu) {
    hamburger.addEventListener("click", () => {
      hamburger.classList.toggle("active");
      menu.classList.toggle("active");
    });
  }
});
