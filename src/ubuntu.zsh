# Used this to pause music in a non-blocking way, beep, and then unpause
function playpause_beep() {
    music-pause;
    (paplay /usr/share/sounds/KDE-Im-Message-In.ogg &) &> /dev/null;
    sleep 1;
    music-play;
}
