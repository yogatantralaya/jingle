<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page
import="java.time.*"%> <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Jingle | Homepage</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="js/home.js"></script>
        <link rel="stylesheet" href="css/global.css" />
        <link rel="stylesheet" href="css/homeNew.css" />
        <link rel="icon" href="images/jingle_logo.jpeg" type="image/x-icon" />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Tangerine"
        />
    </head>
    <body>
        <div class="wrapper">
            <div class="nav-container">
                <div class="logo">
                    <img class="logo-image" src="images/jingle_logo.jpeg" />
                    <h1
                        class="logo-text"
                        style="font-family: Tangerine; color: #ab8742"
                    >
                        ingle
                    </h1>
                </div>
                <div class="menu">
                    <div class="section">
                        <div class="heading">Discover</div>
                        <div class="item-container">
                            <div class="item">
                                <i class="material-symbols-outlined">home</i>
                                Home
                            </div>
                            <div class="item">
                                <i class="material-symbols-outlined">mic</i>
                                Artistis
                            </div>
                            <div class="item">
                                <i class="material-symbols-outlined"
                                    >library_music</i
                                >
                                Albums
                            </div>
                        </div>
                    </div>
                    <div class="section">
                        <div class="heading">Library</div>
                        <div class="item-container">
                            <div class="item">
                                <i class="material-symbols-outlined"
                                    >headphones</i
                                >
                                Recommended
                            </div>
                            <div class="item">
                                <i class="material-symbols-outlined">earbuds</i>
                                Recent
                            </div>
                            <div class="item">
                                <i class="material-symbols-outlined"
                                    >featured_play_list</i
                                >
                                Playlist
                            </div>
                        </div>
                    </div>
                    <div class="section">
                        <div class="heading">More</div>
                        <div class="item-container">
                            <div class="item">
                                <i class="material-symbols-outlined">artist</i>
                                Tending Songs
                            </div>
                            <div class="item">
                                <i class="material-symbols-outlined">person</i>
                                Account
                            </div>
                            <div class="item">
                                <i class="material-symbols-outlined">logout</i>
                                Logout
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="body-container">
                <div class="body-header">
                    <div class="search-bar"></div>
                    <div class="user-details"></div>
                </div>
                <div class="content"></div>
                <div class="song-player"></div>
            </div>
        </div>
    </body>
</html>
