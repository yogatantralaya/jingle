$(document).ready(function() {
	initializeAudioPlayer();
	getArtists();
	userId = document.getElementById("user-id").innerText;
	getSongs("trending-list", "trendingSongs", userId);
	getSongs("recent-list", "recentlyPlayed", userId);
	getSongs("recommended-list", "trendingSongs", userId);

	$("#song-search-bar").keyup(function(event) {
		if (event.target.value.length == 0) {
			$("#search-results").hide();
		}
		if (event.keyCode === 13 && event.target.value.length) {
			$("#search-results").show();
			searchSong(event.target.value);
		}
	});
});

var userId;
var audioSources;
var currentTrackIndex = 0;
var audioPlayer;
var isPlaying;

function getArtists() {
	$.ajax({
		url: "/Jingle/ArtistServlet",
		method: "GET",
		dataType: "json",
		success: function(data) {
			let artistList = document.getElementById("artist-list");
			for (let i = 0; i < data.length; i++) {
				artistList.innerHTML += `<div class="artist-info">
							<img class="artist-picture" src="${data[i].location}" />
							<div class="artist-name">${data[i].firstName} ${data[i].lastName}</div>
						</div>`;
			}
		},
		error: function(error) {
			console.error("Error fetching artists:", error);
		},
	});
}

function getSongs(divId, requestType, userId = null) {
	$.ajax({
		url: `/Jingle/SongServlet?requestType=${requestType}&userId=${userId}`,
		method: "GET",
		dataType: "json",
		success: function(data) {
			let songsList = document.getElementById(divId);
			for (let i = 0; i < data.length; i++) {
				songsList.innerHTML += `<div class="song-info" onclick='playSong(${JSON.stringify(
					data
				)}, ${i})'>
							<img class="song-cover" src="${data[i].albumCover}" />
							<div class="song-name">${data[i].title}</div>
						</div>`;
			}
			if (requestType == "recentlyPlayed") {
				audioSources = data;
				updateSongDisplay();
				loadTrack();
			}
		},
		error: function(error) {
			console.error("Error fetching song:", error);
		},
	});
}

function searchSong(searchQuery) {
	$.ajax({
		url: `/Jingle/SongServlet?searchQuery=${searchQuery}`,
		method: "GET",
		dataType: "json",
		success: function(data) {
			if (!data.url) {
				$("#search-list").empty();
				let songsList = document.getElementById("search-list");
				for (let i = 0; i < data.length; i++) {
					songsList.innerHTML += `<div class="song-info" onclick='playSong(${JSON.stringify(
						data
					)}, ${i})'>
								<img class="song-cover" src="${data[i].albumCover}" />
								<div class="song-name">${data[i].title}</div>
							</div>`;
				}
			} else {
				window.location = contextPath + data.url;
			}

		},
		error: function(error) {
			console.error("Error searching song:", error);
		},
	});
}

function addPlayHistory(userId, songId) {
	$.ajax({
		url: `/Jingle/SongServlet?userId=${userId}&songId=${songId}`,
		method: "POST",
		dataType: "json",
		success: function() {
		},
		error: function(error) {
			console.error("Error in adding play history:", error);
		},
	});
}

function playSong(songList, position) {
	audioSources = songList;
	currentTrackIndex = position;
	addPlayHistory(userId, audioSources[currentTrackIndex].id);
	updateSongDisplay();
	loadTrack();
	audioPlayer.play();
	if (!isPlaying) {
		togglePlayPause();
	}
}

function updateSongDisplay() {
	let songCover = document.getElementById("song-cover");
	let songName = document.getElementById("song-name");

	songCover.src = audioSources[currentTrackIndex].albumCover;
	songName.textContent = audioSources[currentTrackIndex].title;
}

function initializeAudioPlayer() {
	audioPlayer = document.getElementById("myAudio");
	isPlaying = false;
	if (audioSources != null) {
		loadTrack();
	}
	audioPlayer.addEventListener("timeupdate", updateProgressBar);
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
	currentTrackIndex = (currentTrackIndex + 1) % audioSources.length;
	updateSongDisplay();
	loadTrack();
	audioPlayer.play();
	isPlaying = true;
	updatePlayPauseButton();
	addPlayHistory(userId, audioSources[currentTrackIndex].id);
}

function playPrevious() {
	currentTrackIndex =
		(currentTrackIndex - 1 + audioSources.length) % audioSources.length;
	updateSongDisplay();
	loadTrack();
	audioPlayer.play();
	isPlaying = true;
	addPlayHistory(userId, audioSources[currentTrackIndex].id);
}

function toggleMute() {
	audioPlayer.muted = !audioPlayer.muted;
	updateVolumeControl();
}

function loadTrack() {
	audioPlayer.src = audioSources[currentTrackIndex].location;
	audioPlayer.load();
}

function updatePlayPauseButton() {
	const playPauseButton = document.getElementById("playPauseButton");
	playPauseButton.innerHTML = isPlaying
		? '<i class="material-symbols-outlined">pause</i>'
		: '<i class="material-symbols-outlined">play_arrow</i>';
}

function updateVolumeControl() {
	const volumeControl = document.getElementById("volumeControl");
	volumeControl.value = audioPlayer.muted ? 0 : audioPlayer.volume * 100;
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
	progressBar.value = (audioPlayer.currentTime / audioPlayer.duration) * 100;
}

function setPlaybackPosition() {
	audioPlayer.currentTime =
		(progressControl.value / 100) * audioPlayer.duration;
}

function openPopup() {
	document.getElementById("overlay").style.display = "flex";
}

function closePopup() {
	document.getElementById("overlay").style.display = "none";
}

function scrollToSection(sectionId) {
	var section = document.getElementById(sectionId);

	if (section) {
		section.scrollIntoView({ behavior: "smooth" });
	}
}

function scrollToTop() {
	window.scrollTo(0, 0);
}

function logout() {
	window.location.href = "/Jingle/LogoutServlet";
}
