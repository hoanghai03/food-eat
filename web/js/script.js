
/* --------- preload --------- */

let loader = document.getElementById("preload");
function rmPreloadMask() {
    loader.style.display = "none";
}
setTimeout(function () {
    loader.style.animation = "fade-out 1s ease";
}, 1000)
setTimeout(rmPreloadMask, 2000);


/* --------- detecting scroll --------- */
var header = document.getElementsByTagName('header')[0];
window.onscroll = function () {
    if (window.scrollY != 0) {
        header.classList.add('isFixed');
    } else {
        header.classList.remove('isFixed');
    }
}

/* --------- open & close menu --------- */

let mask = document.getElementById('mask');
let mask__wrapper = document.querySelector("#mask .mask__wrapper");
let bars = document.getElementById('bars');
let close_menu = document.getElementById('close-menu');

bars.onclick = () => {
    mask.style.display = "block";
    setTimeout(function () {
        mask__wrapper.style.right = 0;
    }, 1);
}
close_menu.onclick = () => {
    mask__wrapper.style.right = "-100%";
    setTimeout(function () {
        mask.style.display = "none";
    }, 300)
}

/* --------- scroll into view --------- */


let menu = document.querySelector('#scroll-menu');
let features = document.querySelector('#scroll-intro');
let about = document.querySelector('#scroll-about');
let contact = document.querySelector('#scroll-contact');

menu.onclick = () => {
    document.querySelector('.content__menu').scrollIntoView({behavior: 'smooth'});
}
features.onclick = () => {
    document.querySelector('.content__intro').scrollIntoView({behavior: 'smooth'});
}
about.onclick = () => {
    document.querySelector('.about').scrollIntoView({behavior: 'smooth'});
}
contact.onclick = () => {
    document.querySelector('.contact').scrollIntoView({behavior: 'smooth'});
}



/* --------- open cart --------- */

var cart = document.getElementById('cart');

cart.onclick = function () {
    window.location.href = "cart.jsp";
}

/* --------- message add to cart --------- */

let addToCart = document.querySelectorAll(".content .content__food .content__mask");
for (let a = 0; a < addToCart.length; a++) {
    addToCart[a].onclick = function () {
        swal({
            text: 'Đã thêm vào giỏ hàng',
            icon: 'success'
        })
    }
}


