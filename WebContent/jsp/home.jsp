<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.*"%>
<%@ page language="java" contentType="text/html;
charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Jingle | Homepage</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/home.js"></script>
<link rel="stylesheet" href="css/global.css" />
<link rel="stylesheet" href="css/home.css" />
<link rel="icon" href="images/jingle_logo.jpeg" type="image/x-icon" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Tangerine" />
<script>var contextPath = "${pageContext.request.contextPath}"</script>
</head>
<body>
	<div class="wrapper">
		<div class="nav-container">
			<div class="logo">
				<img class="logo-image" src="images/jingle_logo.jpeg" />
				<h1 class="logo-text" style="font-family: Tangerine; color: #ab8742">
					ingle</h1>
			</div>
			<div class="menu">
				<div class="section">
					<div class="heading">Discover</div>
					<div class="item-container">
						<div class="item" onclick="scrollToTop()">
							<i class="material-symbols-outlined">home</i> Home
						</div>
						<div class="item" onclick="scrollToSection('artist')">
							<i class="material-symbols-outlined">mic</i> Artists
						</div>
						<div class="item">
							<i class="material-symbols-outlined">library_music</i> Albums
						</div>
					</div>
				</div>
				<div class="section">
					<div class="heading">Library</div>
					<div class="item-container">
						<div class="item" onclick="scrollToSection('recent')">
							<i class="material-symbols-outlined">earbuds</i> Recently Played
						</div>
						<div class="item" onclick="scrollToSection('trending')">
							<i class="material-symbols-outlined">artist</i> Trending Songs
						</div>
						<div class="item" onclick="scrollToSection('recommended')">
							<i class="material-symbols-outlined">headphones</i> Recommended
						</div>
						<div class="item" onclick="scrollToSection('')">
							<i class="material-symbols-outlined">featured_play_list</i>
							Playlist
						</div>
					</div>
				</div>
				<div class="section">
					<div class="heading">More</div>
					<div class="item-container">
						<div class="item" onclick="openPopup()">
							<i class="material-symbols-outlined">person</i> Account
						</div>
						<div class="item" onclick="logout()">
							<i class="material-symbols-outlined">logout</i> Logout
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="body-container">
			<div class="body-header">
				<div class="search-bar">
					<i class="material-symbols-outlined">search</i> <input
						id="song-search-bar" class="search-artist-title"
						placeholder="what do you want to listen to?" type="text" />
				</div>
				<div class="user-details">
					<div id="user-id" style="display: hidden">
						${User_Details.getId()}</div>
					<h3 class="greetings">${Greetings}
						${User_Details.getFirstName()}!</h3>
					<div class="profile-picture">
						<img class="dp" src="${User_Details.getDp()}" />
					</div>
				</div>
			</div>

			<div id="overlay" class="overlay">
				<div class="popup-content">
					<h2>Account Details</h2>
					<br /> <br />
					<div class="input-box">
						<input type="text" name="firstName" id="firstName"
							value="${User_Details.getFirstName()}" readonly required /> <i
							class="material-symbols-outlined">person</i>
					</div>
					<div class="input-box">
						<input type="text" name="lastName" id="lastName"
							value="${User_Details.getLastName()}" readonly required /> <i
							class="material-symbols-outlined">person</i>
					</div>
					<div class="input-box">
						<input type="text" name="email" id="email"
							value="${User_Details.getEmail()}" readonly required /> <i
							class="material-symbols-outlined">mail</i>
					</div>
					<div class="input-box">
						<input type="text" name="location" id="location"
							value="${User_Details.getLocation()}" readonly required /> <i
							class="material-symbols-outlined">home_pin</i>
					</div>
					<br /> <br /> <br /> <br />
					<button class="close-btn" onclick="closePopup()">Close</button>
				</div>
			</div>

			<div class="content">
				<div class="song-catalog">
					<div id="search-results">
						<h2 class="heading" id="search">Search Results</h2>
						<div id="search-list"></div>
					</div>
					<h2 class="heading" id="recent">Recently Played</h2>
					<div id="recent-list"></div>
					<h2 class="heading" id="trending">Trending Songs</h2>
					<div id="trending-list"></div>
					<h2 class="heading" id=album>Albums</h2>
					<div id ="album-list"></div>
					<h2 class="heading" id="recommended">Recommended</h2>
					<div id="recommended-list"></div>
					<h2 class="heading" id="artist">Artists</h2>
					<div id="artist-list"></div>
				</div>
				<div class="song-player">
					<div class="song-cover">
						<img id="song-cover" />
					</div>
					<div class="song-info">
						<div id="song-name" class="song-name"></div>
						<div id="artist-name" class="artist-name"></div>
					</div>
					<audio id="myAudio"></audio>
					<div class="song-progress-bar">
						<input type="range" id="progressControl" min="0" max="100"
							value="0" step="1" oninput="setPlaybackPosition()" />
					</div>
					<div class="controls">
						<button>
							<i class="material-symbols-outlined">playlist_add</i>
						</button>
						<button onclick="playPrevious()">
							<i class="material-symbols-outlined">fast_rewind</i>
						</button>
						<button id="playPauseButton" onclick="togglePlayPause()">
							<i class="material-symbols-outlined">play_arrow</i>
						</button>
						<button onclick="playNext()">
							<i class="material-symbols-outlined">fast_forward</i>
						</button>
						<button id="loopButton" onclick="toggleLoop()">
							<i class="material-symbols-outlined">repeat</i>
						</button>
						<button onclick="toggleMute()">
							<i class="material-symbols-outlined">volume_up</i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
