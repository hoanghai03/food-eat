<%-- 
    Document   : cart.jsp
    Created on : Dec 9, 2020, 2:22:20 AM
    Author     : admin
--%>

<%@page import="java.util.Map"%>
<%@page import="Model.FoodDAO"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <title>Cart - Vincent</title>
        <link rel="shortcut icon" href="imgs/fav.png?v=2" type="image/x-icon">
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
              integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
              crossorigin="anonymous" />

    </head>
    <%
        String[] records = new FoodDAO().Cart();
        int index = records.length - 1;
        double total = 0;
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
            map.put("quantity", str[5]);
        }
    %>
    <body>
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
                    <a href="index.jsp"><img src="imgs/logo.png" alt="LOGO"></a>
                </div>
                <ul class="header__menu">
                    <li><a href="index.jsp">HOME</a></li>
                    <li><a href="">MENU</a></li>
                    <li><a href="">FEATURES</a></li>
                    <li><a href="">ABOUT</a></li>
                    <li><a href="">SHOP</a></li>
                    <li><a href="">CONTACT</a></li>
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
        <div class="content_cart">
            <h1>Cart</h1>
        </div>
        <div class="content">
            <div class="container">
                <div class="container_left">
                    <table class="vincent_cart">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th>Product</th>
                                <th><span>Price</span></th>
                                <th>Quantity</th>
                                <th><span>Total</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 1; i <= index; i++) { %>
                            <tr class="vincent_cart_item">
                                <% read(records[i]);%>
                                <td>
                                    <form action="DeleteItemServlet" method="get">
                                        <button type="submit" name="submit" value="<%= map.get("id")%>" style="background-color: transparent; outline: none; border: none; color: white">x</button>
                                    </form>
                                </td>
                                <td class="vincent_product-thumbnail">
                                    <a href="">
                                        <img src="<%= map.get("url")%> " alt="">
                                    </a>
                                </td>
                                <td class="vincent_product-name" data-title="Product">
                                    <a href=""><%= map.get("name")%></a>
                                </td>
                                <td class="vincent_product-price" data-title="Price">
                                    <span>$<%= map.get("price")%></span>
                                </td>
                                <td class="vincent_product-quantity" data-title="Quantity">
                                    <input type="text" value="<%= map.get("quantity")%>" name="quantity" class="vincent_quantity">
                                </td>
                                <td class="vincent_product-subtotal" data-title="Total">
                                    <span>$<%
                                        double price = Double.parseDouble(map.get("price")) * Integer.parseInt(map.get("quantity"));
                                        total += price;
                                        out.print(price);
                                        %></span>
                                </td>
                            </tr>
                            <%}%>
                            <tr class="vincent_cart_actions">
                                <td colspan="6">
                                    <div class="vincent_coupon">
                                        <input type="text" name="" placeholder="Coupon code">
                                        <button>Apply coupon</button>
                                    </div>
                                    <button class="vincent_update_cart">Update cart</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="vincent_cart_totals">
                        <h5>Cart totals</h5>
                        <table>
                            <tr>
                                <td>Subtotal</td>
                                <td>Total</td>
                            </tr>
                            <tr>
                                <td>$<%= total%></td>
                                <td>$<%= total%></td>
                            </tr>
                        </table>
                        <form action="PayServlet" method="post">
                            <button id="vincent_button vincent_button_background" 
                                    type="submit" name="submit" value="ecec"
                                    style="padding: 0.5rem 2rem;
                                    background-color: orange;
                                    border: none;
                                    outline: none;
                                    border-radius: 3px;
                                    font-family: 'Open Sans';
                                    font-size: 1.5rem">
                                Proceed to checkout
                            </button>
                        </form>

                    </div>
                </div>
                <div class="container_right">
                    <form class="container_right-input">
                        <input type="text" placeholder="search...">
                        <span class="icon">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </span>
                    </form>
                    <div class="about container_right1">
                        <h3 class="title">FEATURED POSTS</h3>
                        <div>
                            <img src="imgs/pizza_1.png" alt="">
                            <div class="img_content">
                                <a href=""><span>HEALSY FOOD FOR HEALTHY BODY</span></a>
                                <p>April 6, 2017</p>
                            </div>
                        </div>
                        <div>
                            <img src="imgs/pizza_1.png" alt="">
                            <div class="img_content">
                                <a href=""><span>FOOD DESIGN TRENDS 2017</span></a>
                                <p>April 6, 2017</p>
                            </div>
                        </div>
                    </div>
                    <div class="about container_right2">
                        <h3 class="title">BLOG CATEGORIES</h3>
                        <ul>
                            <li><a href="">Food</a></li>
                            <li><a href="">Inspiration</a></li>
                            <li><a href="">Lifestyle</a></li>
                            <li><a href="">People</a></li>
                            <li><a href="">Recipes</a></li>
                            <li><a href="">World</a></li>
                        </ul>
                    </div>
                    <div class="about container_right3">
                        <h3 class="title">Tags</h3>
                        <ul>
                            <li><a href="">Blog</a></li>
                            <li><a href="">Food</a></li>
                            <li><a href="">Lifestyle</a></li>
                            <li><a href="">Margherita</a></li>
                            <li><a href="">Pizza</a></li>
                            <li><a href="">Pizzeria</a></li>
                            <li><a href="">Restaurant</a></li>
                            <li><a href="">Vincent</a></li>
                        </ul>
                    </div>
                    <div class="about container_right4">
                        <h3 class="title">Instafeed</h3>
                        <ul>
                            <li><a href=""><img src="./imgs/an1.jpg" alt=""></a></li>
                            <li><a href=""><img src="./imgs/an2.jpg" alt=""></a></li>
                            <li><a href=""><img src="./imgs/an3.jpg" alt=""></a></li>
                            <li><a href=""><img src="./imgs/an4.jpg" alt=""></a></li>
                            <li><a href=""><img src="./imgs/an5.jpg" alt=""></a></li>
                            <li><a href=""><img src="./imgs/an6.jpg" alt=""></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="footer__mid">
                <div class="footer__logo">
                    <img src="imgs/logo.png" alt="LOGO">
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
                        <li><a href="index.html">HOME</a></li>
                        <li><a href="">MENU</a></li>
                        <li><a href="">FEATURES</a></li>
                        <li><a href="">ABOUT</a></li>
                        <li><a href="">SHOP</a></li>
                        <li><a href="">CONTACT</a></li>
                    </ul>
                </div>
            </div>
        </footer>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            let pay = document.getElementById("vincent_button vincent_button_background");

            pay.onclick = function () {
                swal({
                    text: 'Thanh toán thành công',
                    icon: 'success'
                })
            }
        </script>
    </body>

</html>