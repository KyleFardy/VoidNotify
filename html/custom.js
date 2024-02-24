
function notify(is_toast, title, message, type, time, theme = "dark", position = "bottom", sound = "sound.mp3") {
    theme = theme || "dark";
    $("#css_theme").attr("href", (theme === "default") ? "default.css" : theme + ".css");

    var notification_sound = new Audio(sound);
    notification_sound.volume = 0.8;
    if (type.toLowerCase().indexOf("png") != -1 || type.toLowerCase().indexOf("jpg") != -1 || type.toLowerCase().indexOf("gif") != -1 || type.toLowerCase().indexOf("jpeg") != -1) {
        if (is_toast == "false") {
            Swal.fire({
                title: title,
                html: message,
                showConfirmButton: false,
                timer: time,
                timerProgressBar: true,
                imageUrl: type,
                imageHeight: 128,
            });
            notification_sound.play();
        }
        else {
            Swal.mixin({
                toast: true,
                iconHtml: `<img src="${type}" style="height:80px; width:80px;">`,
                customClass: {
                    icon: 'no-border'
                },
                title: title,
                position: position,
                showConfirmButton: false,
                timer: time,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            }).fire({
                title: message
            });
            notification_sound.play();
        }
    }
    else {
        if (is_toast == "false") {
            Swal.fire({
                title: title,
                icon: type,
                html: message,
                showConfirmButton: false,
                timer: time,
                timerProgressBar: true,
            });
            notification_sound.play();
        }
        else {
            Swal.mixin({
                toast: true,
                icon: type,
                title: title,
                position: position,
                showConfirmButton: false,
                timer: time,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            }).fire({
                title: message
            });
            notification_sound.play();
        }
    }
}
$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.action == 'do_notification') {
            notify(event.data.toast, event.data.title, event.data.message, event.data.type, event.data.time, event.data.theme, event.data.position, event.data.sound);
        }
    })
})