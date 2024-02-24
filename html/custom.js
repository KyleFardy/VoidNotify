function notify(toast, title, message, type, time, theme = "dark", position = "bottom", sound = "sound.mp3") {
    $("#css_theme").attr("href", theme == "default" ? "default.css" : `${theme}.css`);

    const notification_sound = new Audio(sound);
    notification_sound.volume = 0.8;

    const commonOptions = {
        title: title,
        showConfirmButton: false,
        timer: time,
        timerProgressBar: true,
    };

    if (toast === "false") {
        Swal.fire({
            ...commonOptions,
            html: message,
            imageUrl: type.toLowerCase().includes("png" || "jpg" || "gif" || "jpeg") ? type : undefined,
            icon: !type.toLowerCase().includes("png" || "jpg" || "gif" || "jpeg") ? type : undefined,
        });
    } else {
        Swal.mixin({
            toast: true,
            customClass: { icon: 'no-border' },
            iconHtml: `<img src="${type}" style="height:80px; width:80px;">`,
            title: title,
            position: position,
            ...commonOptions,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer);
                toast.addEventListener('mouseleave', Swal.resumeTimer);
            },
        }).fire({
            title: toast === "false" ? message : undefined,
        });
    }

    notification_sound.play();
}

$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.action === 'do_notification') {
            const { toast, title, message, type, time, theme, position, sound } = event.data;
            notify(toast, title, message, type, time, theme, position, sound);
        }
    });
});
