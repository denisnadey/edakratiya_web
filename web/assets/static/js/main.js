"use strict";

function floatCart() {
  var fCart = document.getElementsByClassName("float-cart")[0];
  var sideCart = document.getElementsByClassName("sidebar-cart")[0];
  fCart.addEventListener("click", function (event) {
    sideCart.classList.add("side-open");
  });
}

function mobilemenu() {
  var burgerWrap = document.getElementsByClassName("burger-wrap")[0];
  var burger = document.getElementsByClassName("burger")[0];
  var mobileMenu = document.getElementsByClassName("menu-mobile")[0];
  burgerWrap.addEventListener("click", function (event) {
    burger.classList.toggle("burger-open");
    mobileMenu.classList.toggle("mobile-menu-open");
  });
}

function startCategoryMenu() {
  var elementExists = document.getElementById("menu-anchor-row");
  var element2Exists = document.getElementById("category_0");

  if (elementExists && element2Exists) {
    setTimeout(mobilemenu, 100);
    setTimeout(sticky, 100);
    setTimeout(scrollspy, 100);
    setTimeout(floatCart, 100);
  } else {
    setTimeout(startCategoryMenu, 100);
  }
}

function sticky() {
  console.log("sticky enable");
  var vasteElement = document.getElementsByClassName("vaste-white")[0];
  var vasteHeightElement = document.getElementById("menu-anchor-row")
    .clientHeight;
  console.log(vasteHeightElement);
  window.addEventListener("scroll", function () {
    tagmenu();
  });

  function tagmenu() {
    var header = document.getElementById("tag-menu"); // var sticky = header.offsetTop;

    var sticky = window.innerHeight / 2; //console.log(sticky);

    if (window.pageYOffset > sticky) {
      vasteElement.setAttribute(
        "style",
        "height: ".concat(vasteHeightElement, "px;")
      );
      if (header) {
        header.classList.add("sticky-menu");
      }
    } else {
      vasteElement.setAttribute("style", "height: 0px;");
      if (header) {
        header.classList.remove("sticky-menu");
      }
    }
  }
}

function scrollspy() {
  console.log("scrollspy enable");
  var scrollLink = document.querySelectorAll('.menu-anchor-row a[href^="#"]');
  var section = document.querySelectorAll(".scrollspy");
  var sections = {};
  var identCounter = 0;
  scrollLink.forEach(function (item) {
    item.addEventListener("click", function (e) {
      var targetBlock = document.querySelector(e.target.hash);
      e.preventDefault();
      window.scrollTo({
        top: targetBlock.offsetTop,
        behavior: "smooth",
      });
    });
  });
  Array.prototype.forEach.call(section, function (e) {
    sections[e.id] = e.offsetTop;
  });
  window.addEventListener("scroll", function () {
    var activeElement = document.getElementsByClassName(".active-tag");
    var scrollPosition =
      document.documentElement.scrollTop || document.body.scrollTop;
    scrollPosition = scrollPosition + window.innerHeight / 2;

    if (window.matchMedia("(max-width: 954px)").matches) {
      // use for scroll spy
    }

    for (identCounter in sections) {
      if (sections[identCounter] <= scrollPosition) {
        document.querySelector(".active-tag").setAttribute("class", "item-row");
        document
          .querySelector("a[href*=" + identCounter + "]")
          .setAttribute("class", "item-row active-tag");
      }
    }
  });
}

function include(url) {
  var script = document.createElement("script");
  script.src = url;
  document.getElementsByTagName("head")[0].appendChild(script);
} // убираем пеовоначальный hash

var loc = window.location.href,
  index = loc.indexOf("#");

if (index > 0) {
  window.location = loc.substring(0, index);
}

if (window.matchMedia("(max-width: 954px)").matches) {
  var popup_filter = document.getElementById("popup-filter");
  var cart_x = document.getElementById("cartx");
  var html_tag = document.getElementsByTagName("html")[0];
  var priceblock = document.getElementsByClassName("priceblock")[0];
  var popup = document.getElementsByClassName("popup")[0];
}
async function responseToMap(url) {
  console.log(url.toString());
  let response = await fetch(url.toString(), { mode: "no-cors" });

  if (response.ok) {
    // если HTTP-статус в диапазоне 200-299
    // получаем тело ответа (см. про этот метод ниже)
    return await response.body;
  } else {
    alert("Ошибка HTTP: " + response.status);
    return null;
  }
}
function setCookie(name, value, days) {
  var expires = "";
  if (days) {
    var date = new Date();
    date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
    expires = "; expires=" + date.toUTCString();
  }
  document.cookie = name + "=" + (value || "") + expires + "; path=/";
}
function slider(counter) {
  counter = 0;
  console.log("glide пытается запустится");
  var elementExists = document.getElementById("glide");

  if (counter == 15) {
    console.log(
      "\u043A\u0430\u0436\u0435\u0442\u0441\u044F \u0435\u0433\u043E \u0437\u0434\u0435\u0441\u044C \u043D\u0435\u0442 \u0442\u0430\u043A \u043A\u0430\u043A counter ".concat(
        counter,
        ", \u0430 \u044D\u0442\u043E \u0443\u0436\u0435 \u043C\u043D\u043E\u0433\u043E"
      )
    );
  } else {
    if (elementExists) {
      new Glide("#glide", {
        type: "carousel",
        perView: 3,
        focusAt: "center",
        gap: 40,
        rewindDuration: 2000,
        animationDuration: 1000,
        breakpoints: {
          1200: {
            perView: 1,
          },
          640: {
            perView: 1,
          },
        },
      }).mount();
      console.log("ура заработала тарантайка");
    } else {
      counter++;
      setTimeout(slider, 100, counter);
    }
  }
}

function actived(elem) {
  var a = document.getElementsByClassName("size");
  var i;

  for (i = 0; i < a.length; i++) {
    a[i].classList.remove("active");
  }

  elem.classList.add("active");
} // forEach IE 11

if ("NodeList" in window && !NodeList.prototype.forEach) {
  console.info("polyfill for IE11");

  NodeList.prototype.forEach = function (callback, thisArg) {
    thisArg = thisArg || window;

    for (var i = 0; i < this.length; i++) {
      callback.call(thisArg, this[i], i, this);
    }
  };
} // closest IE 11

(function () {
  if (!Element.prototype.closest) {
    Element.prototype.closest = function (css) {
      var node = this;

      while (node) {
        if (node.matches(css)) return node;
        else node = node.parentElement;
      }

      return null;
    };
  }
})(); // matches IE 11

(function () {
  if (!Element.prototype.matches) {
    Element.prototype.matches =
      Element.prototype.matchesSelector ||
      Element.prototype.webkitMatchesSelector ||
      Element.prototype.mozMatchesSelector ||
      Element.prototype.msMatchesSelector;
  }
})(); //Array.form IE 11

if (!Array.from) {
  Array.from = function (object) {
    "use strict";

    return [].slice.call(object);
  };
}
