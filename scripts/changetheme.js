function change(oldstyle, newstyle) {
    var link_old = document.getElementsByTagName("link").item(0);
    var link_new = document.createElement("link");

    link_new.setAttribute("rel", "stylesheet");
    link_new.setAttribute("type", "text/css");
    link_new.setAttribute("href", newstyle);

    /* Replace CSS file tag inplace */
    document.getElementsByTagName("head").item(0).replaceChild(
        link_new,
        link_old
    );

    /* Contrast changing */
    var contrast = document.getElementById("theme");
    if (contrast.innerHTML == "Dark Theme") {
        contrast.innerHTML = "Light Theme";
        contrast.onclick = function() { change(newstyle, oldstyle); };
    } else {
        contrast.innerHTML = "Dark Theme";
        contrast.onclick = function() { change(newstyle, oldstyle); };
    }

    
}
