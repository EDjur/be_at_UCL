// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

console.log("welcome.js loaded");

var ready;

ready = function () {
    new WOW().init();
    $('#signup').on('click', function() {
        $("#signup-modal").modal();
    });

    $('#signup-modal').on('submit', function() {
        $('#addListItem').modal('hide');
    });

    $('#new_user').validate({
        rules: {
            "user[name]": {
                required: true
            },
            "user[email]": {
                required: true
            },
            "user[password]": {
                required: true
            },
            "user[password_confirmation]": {
                required: true,
                equalTo: "#user_password"
            }
        }
    });

    $('#login').on('click', function() {
        $("#login-modal").modal();
    });

    $('#list-login').on('click', function() {
        $("#login-modal").modal();
    });

    $('#login-modal').on('submit', function() {
        $('#addListItem').modal('hide');
    });
};

$(document).ready(ready);
$(document).on("turbolinks:load", ready);