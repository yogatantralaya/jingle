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
        <link rel="stylesheet" href="css/styleguide.css" />
        <link rel="stylesheet" href="css/stylesample.css" />
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
        <div class="home">
            <div class="div">
                <div class="top-bar">
                    <div class="search">
                        <i class="material-symbols-outlined">search</i>
                        <input
                            class="search-artist-title"
                            placeholder="search song"
                            type="text"
                        />
                    </div>
                    <div class="greetings">
                        <h3 style="color: white">
                            ${Greetings} ${User_Details.getFirstName()} !
                        </h3>
                    </div>
                    <!--
				<div class="div-2">
					<audio id="myAudio" controls>
						<source src="media/matargashti.mp3" type="audio/mp3">
					</audio>
					<div class="controls">
						<button onclick="playPause()">
							<i class="material-symbols-outlined">play_arrow</i>
						</button>
						<i class="material-symbols-outlined">fast_rewind</i>
						<button onclick="playNext()">
							<i class="material-symbols-outlined">play_arrow</i>
						</button>
						<i class="material-symbols-outlined">fast_forward</i>
						<div class="volume-bar">
							<div class="frame"></div>
						</div>
						<i class="material-symbols-outlined">volume_up</i> 
						<i class="material-symbols-outlined">repeat</i>
					</div>
				</div>
				-->
                    <div class="profile">
                        <img class="dp" src="${User_Details.getDp()}" />
                    </div>
                </div>
                <div class="content">
                    <div class="text-wrapper-2">Recommended</div>
                    <div class="pics">
                        <i class="material-symbols-outlined">arrow_back_ios</i>
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <i class="material-symbols-outlined"
                            >arrow_forward_ios</i
                        >
                    </div>
                    <div class="text-wrapper-2">Albums</div>
                    <div class="pics">
                        <i class="material-symbols-outlined">arrow_back_ios</i>
                        <div class="element-2">
                            <div class="frame-2">
                                <img
                                    class="element"
                                    src="media/deafult_album_cover.jpg"
                                />
                                <!-- <div class="image"></div> -->
                                <div class="text-wrapper-3">ALBUM</div>
                            </div>
                            <div class="frame-3">
                                <div class="frame-4">
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">1</div>
                                    </div>
                                    <div class="frame-5">
                                        <div class="text-wrapper-5">
                                            Super Shy
                                        </div>
                                        <div class="text-wrapper-6">
                                            NewJeans • 2:34
                                        </div>
                                    </div>
                                </div>
                                <div class="frame-4">
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">2</div>
                                    </div>
                                    <div class="frame-5">
                                        <div class="text-wrapper-5">
                                            Super Shy
                                        </div>
                                        <div class="text-wrapper-6">
                                            NewJeans • 2:34
                                        </div>
                                    </div>
                                </div>
                                <div class="frame-6">
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">3</div>
                                    </div>
                                    <div class="frame-5">
                                        <div class="text-wrapper-5">
                                            Somebody’s Pleasure
                                        </div>
                                        <div class="text-wrapper-6">
                                            Aziz Hedra • 3:44
                                        </div>
                                    </div>
                                </div>
                                <div class="frame-6">
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">4</div>
                                    </div>
                                    <div class="frame-5">
                                        <div class="text-wrapper-5">Tally</div>
                                        <div class="text-wrapper-6">
                                            BLACKPINK • 3:04
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <i class="material-symbols-outlined"
                            >arrow_forward_ios</i
                        >
                    </div>
                    <div class="text-wrapper-2">My Playlist</div>
                    <div class="pics">
                        <i class="material-symbols-outlined">arrow_back_ios</i>
                        <div class="element-2">
                            <div class="frame-2">
                                <img
                                    class="element"
                                    src="media/deafult_album_cover.jpg"
                                />
                                <!-- <div class="image"></div> -->
                                <div class="text-wrapper-3">Playlist</div>
                            </div>
                            <div class="frame-3">
                                <div class="frame-4">
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">1</div>
                                    </div>
                                    <div class="frame-5">
                                        <div class="text-wrapper-5">
                                            Super Shy
                                        </div>
                                        <div class="text-wrapper-6">
                                            NewJeans • 2:34
                                        </div>
                                    </div>
                                </div>
                                <div class="frame-4">
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">2</div>
                                    </div>
                                    <div class="frame-5">
                                        <div class="text-wrapper-5">
                                            Super Shy
                                        </div>
                                        <div class="text-wrapper-6">
                                            NewJeans • 2:34
                                        </div>
                                    </div>
                                </div>
                                <div class="frame-6">
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">3</div>
                                    </div>
                                    <div class="frame-5">
                                        <div class="text-wrapper-5">
                                            Somebody’s Pleasure
                                        </div>
                                        <div class="text-wrapper-6">
                                            Aziz Hedra • 3:44
                                        </div>
                                    </div>
                                </div>
                                <div class="frame-6">
                                    <div class="div-wrapper">
                                        <div class="text-wrapper-4">4</div>
                                    </div>
                                    <div class="frame-5">
                                        <div class="text-wrapper-5">Tally</div>
                                        <div class="text-wrapper-6">
                                            BLACKPINK • 3:04
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <i class="material-symbols-outlined"
                            >arrow_forward_ios</i
                        >
                    </div>
                    <div class="text-wrapper-2">Recent</div>
                    <div class="pics">
                        <i class="material-symbols-outlined">arrow_back_ios</i>
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <i class="material-symbols-outlined"
                            >arrow_forward_ios</i
                        >
                    </div>
                    <div class="text-wrapper-2">Trending Songs</div>
                    <div class="pics">
                        <i class="material-symbols-outlined">arrow_back_ios</i>
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <img
                            class="element"
                            src="media/deafult_album_cover.jpg"
                        />
                        <i class="material-symbols-outlined"
                            >arrow_forward_ios</i
                        >
                    </div>
                    <div class="text-wrapper-2">Artists</div>
                    <div class="pics">
                        <i class="material-symbols-outlined">arrow_back_ios</i>
                        <c:forEach var="tempArtist" items="${Artist_List}">
                            <div>
                                <img
                                    class="element"
                                    src="${tempArtist.location}"
                                />
                            </div>
                        </c:forEach>
                        <i class="material-symbols-outlined"
                            >arrow_forward_ios</i
                        >
                    </div>
                </div>
                <div class="now-playing">
                    <img
                        class="now-playing-2"
                        src="media/deafult_album_cover.jpg"
                    />
                    <i class="material-symbols-outlined">graphic_eq</i>
                    <div id="audio">
                        <audio id="myAudio"></audio>
                        <div>
                            <input
                                type="range"
                                id="progressControl"
                                min="0"
                                max="100"
                                value="0"
                                step="1"
                                oninput="setPlaybackPosition()"
                            />
                        </div>
                        <div class="controls">
                            <button>
                                <i class="material-symbols-outlined"
                                    >playlist_add</i
                                >
                            </button>
                            <button onclick="playPrevious()">
                                <i class="material-symbols-outlined"
                                    >fast_rewind</i
                                >
                            </button>
                            <button
                                id="playPauseButton"
                                onclick="togglePlayPause()"
                            >
                                <i class="material-symbols-outlined"
                                    >play_arrow</i
                                >
                            </button>
                            <button onclick="playNext()">
                                <i class="material-symbols-outlined"
                                    >fast_forward</i
                                >
                            </button>
                            <button id="loopButton" onclick="toggleLoop()">
                                <i class="material-symbols-outlined">repeat</i>
                            </button>
                        </div>
                    </div>
                    <div class="text">
                        <div class="text-wrapper-16">Album:</div>
                        <div class="text-wrapper-17">Song:</div>
                        <div class="text-wrapper-18">Genre:</div>
                        <div class="text-wrapper-19">Artists:</div>
                    </div>
                    <div class="now-playing-controls"></div>
                    <button onclick="toggleMute()">
                        <i class="material-symbols-outlined">volume_up</i>
                    </button>
                    <input
                        id="volumeControl"
                        type="range"
                        min="0"
                        max="100"
                        value="100"
                        step="1"
                        oninput="setVolume()"
                    />
                </div>
                <div class="navigation-bar">
                    <div class="logo">
                        <img class="logo-side" src="images/jingle_logo.jpeg" />
                        <h1 style="font-family: Tangerine; color: #ab8742">
                            ingle
                        </h1>
                    </div>
                    <div class="div-3">
                        <div class="text-wrapper-13">Discover</div>
                        <div class="frame-11">
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined"
                                        >home</i
                                    >
                                    <div class="text-wrapper-15">Home</div>
                                </div>
                            </div>
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined">mic</i>
                                    <div class="text-wrapper-15">Artists</div>
                                </div>
                            </div>
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined"
                                        >library_music</i
                                    >
                                    <div class="text-wrapper-15">Albums</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="div-3">
                        <div class="text-wrapper-13">Library</div>
                        <div class="frame-11">
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined"
                                        >headphones</i
                                    >
                                    <div class="text-wrapper-15">
                                        Recommended
                                    </div>
                                </div>
                            </div>
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined"
                                        >earbuds</i
                                    >
                                    <div class="text-wrapper-15">Recent</div>
                                </div>
                            </div>
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined"
                                        >featured_play_list</i
                                    >
                                    <div class="text-wrapper-15">Playlists</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="div-3">
                        <div class="text-wrapper-13">More</div>
                        <div class="frame-11">
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined"
                                        >artist</i
                                    >
                                    <div class="text-wrapper-15">
                                        Trending Songs
                                    </div>
                                </div>
                            </div>
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined"
                                        >person</i
                                    >
                                    <div class="text-wrapper-15">Account</div>
                                </div>
                            </div>
                            <div class="menu-wrapper">
                                <div class="menu-2">
                                    <i class="material-symbols-outlined"
                                        >logout</i
                                    >
                                    <div class="text-wrapper-15">Logout</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const audioPlayer = document.getElementById("myAudio");
            const audioSources = [
                "media/matargashti.mp3",
                "media/safarnama.mp3",
                "media/wat_wat_wat.mp3",
            ];
            let currentTrackIndex = 0;
            let isPlaying = false;
            if (audioSources != null) {
                loadTrack();
            }

            function togglePlayPause() {
                if (isPlaying) {
                    audioPlayer.pause();
                } else {
                    audioPlayer.play();
                }
                isPlaying = !isPlaying;
                updatePlayPauseButton();
            }

            function playNext() {
                currentTrackIndex =
                    (currentTrackIndex + 1) % audioSources.length;
                loadTrack();
                audioPlayer.play();
                isPlaying = true;
                updatePlayPauseButton();
            }

            function playPrevious() {
                currentTrackIndex =
                    (currentTrackIndex - 1 + audioSources.length) %
                    audioSources.length;
                loadTrack();
                audioPlayer.play();
                isPlaying = true;
                updatePlayPauseButton();
            }

            function toggleMute() {
                audioPlayer.muted = !audioPlayer.muted;
                updateVolumeControl();
            }

            function loadTrack() {
                audioPlayer.src = audioSources[currentTrackIndex];
                audioPlayer.load();
            }

            function updatePlayPauseButton() {
                const playPauseButton =
                    document.getElementById("playPauseButton");
                playPauseButton.innerHTML = isPlaying
                    ? '<i class="material-symbols-outlined">pause</i>'
                    : '<i class="material-symbols-outlined">play_arrow</i>';
            }

            function updateVolumeControl() {
                const volumeControl = document.getElementById("volumeControl");
                volumeControl.value = audioPlayer.muted
                    ? 0
                    : audioPlayer.volume * 100;
            }

            function setVolume() {
                audioPlayer.volume = volumeControl.value / 100;
                audioPlayer.muted = false;
            }

            function toggleLoop() {
                audioPlayer.loop = !audioPlayer.loop;
                isLooped = !isLooped;
                updateLoopIcon();
            }

            function updateLoopIcon() {
                loopIcon.textContent = isLooped
                    ? '<i class="material-symbols-outlined">repeat_one</i>'
                    : '<i class="material-symbols-outlined">repeat</i>';
            }
            function updateProgressBar() {
                const progressBar = document.getElementById("progressControl");
                progressBar.value =
                    (audioPlayer.currentTime / audioPlayer.duration) * 100;
            }

            function setPlaybackPosition() {
                audioPlayer.currentTime =
                    (progressControl.value / 100) * audioPlayer.duration;
            }

            audioPlayer.addEventListener("timeupdate", updateProgressBar);
        </script>
    </body>
</html>
