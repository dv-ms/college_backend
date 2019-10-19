$(document).ready(function () {
    $("#get_details_btn").hide();
    $("#submit_btn").click(function(){
        $.ajax({
            url: "/department/name",
            method: "GET"
        });
    });
    $("#get_details_btn").click(function(){
        $.ajax({
            url: "/department/name",
            method: "POST",
            data:{"id": $("#name_id").val()}
        });
        console.log($("#name_id").val())
    });
});