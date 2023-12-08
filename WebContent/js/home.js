$(document).ready(function () {
    getArtists();
});

function getArtists() {
    $.ajax({
        url: "/Jingle_App/ArtistServlet",
        method: "GET",
        dataType: "json",
        success: function (data) {
            console.log(data);
        },
        error: function (error) {
            console.error("Error fetching artists:", error);
        },
    });
}

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
    audioPlayer.src = audioSources[currentTrackIndex];
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

audioPlayer.addEventListener("timeupdate", updateProgressBar);
