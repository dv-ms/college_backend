$(document).ready(function() {

    $("#progressBar").hide();
    $("#status").hide();
    $("#user_profile_pic_preview").hide();

    
});

image_upload_status = document.getElementById("status");
progress_bar = document.getElementById("progressBar");

function progressHandler(event) {
    var percent = (event.loaded / event.total) * 100;
    progress_bar.value = Math.round(percent);
    image_upload_status.innerHTML = Math.round(percent) + "% uploaded... please wait";
}

function completeHandler(event) {
    image_upload_status.innerHTML = event.target.responseText;
    progress_bar.value = 100;
}

function errorHandler(event) {
    image_upload_status.innerHTML = "Upload Failed";
}

function abortHandler(event) {
    image_upload_status.innerHTML = "Upload Aborted";
}

function uploadFile() {
    $("#progressBar").show();
    $("#status").show();
    $("#user_profile_pic_preview").show();
    var reader = new FileReader();    
    reader.onload = function(e) {
        $('#user_profile_pic_preview').attr('src', e.target.result);
    }
    
    var file = document.getElementById("user_profile_picture").files[0];
    reader.readAsDataURL(file);

    var formdata = new FormData();
    formdata.append("profile_picture", file);

    var ajax = new XMLHttpRequest();

    ajax.upload.addEventListener("progress", progressHandler, false);
    ajax.addEventListener("load", completeHandler, false);
    ajax.addEventListener("error", errorHandler, false);
    ajax.addEventListener("abort", abortHandler, false);
    ajax.open("POST", "/upload/image/any");

    ajax.send(formdata);
}