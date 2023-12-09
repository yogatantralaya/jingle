$(document).ready(function() {
	initializeAudioPlayer();
	getArtists();
	let userId = document.getElementById("user-id").innerText;
	getSongs("trending-list", "trendingSongs", userId);
	getSongs("recent-list", "trendingSongs", userId);
	getSongs("recommended-list", "trendingSongs", userId);

});

var audioSources;
var currentTrackIndex = 0;
var audioPlayer;
var isPlaying;

function getArtists() {
	$.ajax({
		url: "/Jingle_App/ArtistServlet",
		method: "GET",
		dataType: "json",
		success: function(data) {
			let artistList = document.getElementById("artist-list");
			for (let i = 0; i < data.length; i++) {
				artistList.innerHTML += `<div class="artist-info">
							<img class="artist-picture" src="${data[i].location}" />
							<div class="artist-name">${data[i].firstName} ${data[i].lastName}</div>
						</div>`
			}
		},
		error: function(error) {
			console.error("Error fetching artists:", error);
		},
	});
}

function getSongs(divId, requestType, userId = null) {
	$.ajax({
		url: `/Jingle_App/SongServlet?requestType=${requestType}&userId=${userId}`,
		method: "GET",
		dataType: "json",
		success: function(data) {
			console.log(data)
			let songsList = document.getElementById(divId);
			for (let i = 0; i < data.length; i++) {
				songsList.innerHTML += `<div class="song-info" onclick='playSong(${JSON.stringify(data)}, ${i})'>
							<img class="song-cover" src="${data[i].albumCover}" />
							<div class="song-name">${data[i].title}</div>
						</div>`
			}
			if (requestType == "trendingSongs") {
				audioSources = data;
				updateSongDisplay();
			}

		},
		error: function(error) {
			console.error("Error fetching artists:", error);
		},
	});
}

function playSong(songList, position) {
	audioSources = songList;
	currentTrackIndex = position;
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
	loadTrack();
	audioPlayer.play();
	isPlaying = true;
	updatePlayPauseButton();
}

function playPrevious() {
	currentTrackIndex =
		(currentTrackIndex - 1 + audioSources.length) % audioSources.length;
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
	document.getElementById('overlay').style.display = 'flex';
}

function closePopup() {
	document.getElementById('overlay').style.display = 'none';
}

function scrollToSection(sectionId) {
	var section = document.getElementById(sectionId);

	if (section) {
		section.scrollIntoView({ behavior: 'smooth' });
	}
}

function logout() {
	window.location.href = '/Jingle_App/LogoutServlet';
}

