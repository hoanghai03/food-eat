<%-- 
    Document   : index.jsp
    Created on : Dec 9, 2020, 1:30:05 AM
    Author     : admin
--%>

<%@page import="Model.FoodDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%--<%@page import="Model.database"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Great food</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
              integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
              crossorigin="anonymous" />
        <link rel="shortcut icon" href="imgs/fav.png?v=2" type="image/x-icon">
    </head>

    <body>

        <!----------------
        PRELOAD
    ----------------->

        <div id="preload">
            <div class="preload__msg">
                <span style="--i:1">L</span>
                <span style="--i:2">o</span>
                <span style="--i:3">a</span>
                <span style="--i:4">d</span>
                <span style="--i:5">i</span>
                <span style="--i:6">n</span>
                <span style="--i:7">g</span>
                <span style="--i:8">.</span>
                <span style="--i:9">.</span>
                <span style="--i:10">.</span>
            </div>
            <div class="preload__wrapper">
                <div class="preload__outside"></div>
                <div class="preload__inside"></div>
            </div>
        </div>

        <!----------------
        HEADER
    ----------------->
        <header>
            <div class="header__phone">
                <div>
                    <img src="imgs/icon_phone.png" alt="phone">
                </div>
                <div>
                    <h3 class="phone">+1 215 456 15 15</h3>
                    <p class="time">8:00 am – 11:30 pm</p>
                </div>
            </div>
            <div class="header__mid">
                <div class="header__logo">
                    <a href=""><img src="imgs/logo.png" alt="LOGO"></a>
                </div>
                <ul class="header__menu">
                    <li><a href="index.jsp">HOME</a></li>
                    <li id="scroll-menu"><a>MENU</a></li>
                    <li id="scroll-intro"><a>FEATURES</a></li>
                    <li id="scroll-about"><a>ABOUT</a></li>
                    <li><a>SHOP</a></li>
                    <li id="scroll-contact"><a>CONTACT</a></li>
                </ul>
            </div>
            <div class="header__cart">
                <div>
                    <h3>$0.00</h3>
                    <p>0 items - View Cart</p>
                </div>
                <div>
                    <img src="imgs/icon_cart.png" alt="cart" id="cart">
                </div>
            </div>
            <div class="header__bars">
                <i class="fas fa-bars" id="bars"></i>
            </div>
        </header>

        <!----------------
        BANNER
    ----------------->
        <div id="banner">
            <i class="fas fa-arrow-left"></i>
            <div class="banner__content">
                <div class="banner__img">
                    <img src="imgs/banner1.png" alt="banner">
                </div>
                <p>vincent</p>
                <span>Italian Pizza With Cherry Tomatoes </br>and Green Basil</span>
            </div>
            <i class="fas fa-arrow-right"></i>
        </div>

        <!----------------
        CONTENT
    ----------------->

        <div class="content">
            <div class="content__intro">
                <div>
                    <div><img src="imgs/intro1.png"></div>
                    <h3>QUALITY FOODS</h3>
                    <p>Sit amet, consectetur adipiscing elit quisque eget maximus velit, non eleifend libero curabitur
                        dapibus mauris sed leo cursus aliquetcras suscipit.</p>
                </div>
                <div>
                    <div><img src="imgs/intro2.png"></div>
                    <h3>FASTEST DELIVERY</h3>
                    <p>Sit amet, consectetur adipiscing elit quisque eget maximus velit, non eleifend libero curabitur
                        dapibus mauris sed leo cursus aliquetcras suscipit.</p>
                </div>
                <div>
                    <div><img src="imgs/intro3.png"></div>
                    <h3>ORIGINAL RECIPES</h3>
                    <p>Sit amet, consectetur adipiscing elit quisque eget maximus velit, non eleifend libero curabitur
                        dapibus mauris sed leo cursus aliquetcras suscipit.</p>
                </div>
            </div>
            <div class="content__menu">
                <div id="particles-js"></div>
                <div class="content__title">
                    <h2>DISCOVER OUR MENU</h2>
                    <ul class="kind">
                        <li><a href="">BURGERS</a></li>
                        <li><a href="">DRINKS</a></li>
                        <li><a href="">PIZZAS</a></li>
                        <li><a href="">SALADS</a></li>
                    </ul>
                </div>
                <%
                    String[] records = new FoodDAO().readData();
                    int leng = records.length - 1;
                %>
                <%!
                    Map<String, String> map = new HashMap<String, String>();

                    /* đọc record bằng map */
                    public void read(String record) {
                        String[] str = record.split("-");
                        map.put("id", str[0]);
                        map.put("name", str[1]);
                        map.put("price", str[2]);
                        map.put("url", str[3]);
                        map.put("des", str[4]);
                    }
                %>
                <ul class="content__food">
                    <% for (int i = 1; i <= leng; i++) { %>
                    <div>
                        <div class="img__container">
                            <% read(records[i]);%>
                            <form action="addToCart" method="GET"> 
                                <div class="content__mask"><button type="submit" name="submit" value="<%= i%>" style="cursor: pointer; width: 100%; height: 100%;background-color: transparent; border: none; outline: none"><i class="fas fa-cart-plus"></button></i></div>
                            </form>
                            <img src="<%= map.get("url")%>" alt="Pizza">
                        </div>
                        <h3 class="food-name"><%= map.get("name")%></h3>
                        <p><%= map.get("des")%></p>
                        <span class="price">$<%= map.get("price")%></span>
                    </div>
                    <%}%>
                </ul>
            </div>
        </div>
        <!----------------
        ABOUT
    ----------------->
        <div class="grid about">
            <div class="grid wide container">
                <div class="row">
                    <div class="col l-4 c-12">
                        <div class="about__item">
                            <div class="about__item--title">
                                <p>Invictus Restaurant</p>
                            </div>
                            <div class="about__item--content">
                                <p> There are many variations of passages of Lorem Ipsum available, but the majority have
                                    suffered
                                    alteration in some form, by injected humour, or randomised words which don’t look even
                                    slightly
                                    believable. If you are going to use a passage of Lorem Ipsum.
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                    has
                                    been
                                    the industry
                                </p>
                            </div>
                            <div class="about__item--btn">
                                <p>read more</p>
                            </div>
                        </div>
                    </div>
                    <div class="col l-4 c-6">
                        <div class="img img1">
                        </div>
                    </div>
                    <div class="col l-4 c-6">
                        <div class="img img2">

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!----------------
    CONTACT
----------------->
    <div class="grid contact">
        <div class="grid wide">
            <div class="row">
                <div class="col l-8 m-12">
                    <div class="contact__detail">
                        <div class="contact__detail--title">
                            Planning An Event?
                        </div>
                        <div class="contact__detail--content">
                            Please contact me!<br>
                            <span>NumberPhone:+1 215 456 15 15</span>
                            <p>Or</p>
                            <span>Email:JoinAsk@gmail.com</span>
                        </div>
                    </div>
                </div>
                <div class="col l-4 m-12">
                    <div class="contact__cheff">
                        <img class="contact__cheff--img"
                             src="http://invictus.insigniats.in/restaurant/wp-content/uploads/2017/10/chef-pointing-600x600.jpg"
                             alt="">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!----------------
    FOOTER
----------------->

    <footer>
        <div class="footer__mid">
            <div class="footer__logo">
                <a href=""><img src="imgs/logo.png" alt="LOGO"></a>
            </div>
            <div class="footer__phone">
                <div>
                    <h3 class="phone">+1 215 456 15 15</h3>
                    <p class="time">8:00 am – 11:30 pm</p>
                </div>
            </div>
            <ul class="footer__menu">
                <li><a href="">HOME</a></li>
                <li><a href="">MENU</a></li>
                <li><a href="">FEATURES</a></li>
                <li><a href="">ABOUT</a></li>
                <li><a href="">SHOP</a></li>
                <li><a href="">CONTACT</a></li>
            </ul>
            <div class="footer__icon">
                <a href="" class="footer__link">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="footer__link"><i class="fab fa-twitter"></i></a>
                <a href="" class="footer__link"><i class="fab fa-instagram"></i></a>
            </div>
            <div class="footer__text">
                <p>Copyright © 2018 Vincent. All Rights Reserved.</p>
            </div>
        </div>

    </footer>

    <!----------------
    MENU
----------------->

    <div id="mask">
        <div class="mask__wrapper">
            <div class="mask__title">
                <span>menu</span>
                <i class="fas fa-times" id="close-menu"></i>
            </div>
            <ul class="mask__menu">
                <li><a href="">HOME</a></li>
                <li><a href="cart.jsp">CART</a></li>
                <li><a href="">FEATURES</a></li>
                <li><a href="">ABOUT</a></li>
                <li><a href="">SHOP</a></li>
                <li><a href="">CONTACT</a></li>
            </ul>
        </div>
    </div>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/particles.js"></script>
<script src="js/app.js"></script>
<script src="js/script.js"></script>


</html>
