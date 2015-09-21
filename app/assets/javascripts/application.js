// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require bootstrap-modal
//= require bootstrap-modalmanager
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.autoFill
//= require turbolinks
//= require_tree .
function active(){
    function stripTrailingSlash(str) {
        if(str.substr(-1) == '/') {
            return str.substr(0, str.length - 1);
        }
        return str;
    }

    var url = window.location.pathname;
    var activePage = stripTrailingSlash(url);

    $('.nav li a').each(function(){
        var currentPage = stripTrailingSlash($(this).attr('href'));

        if (activePage == currentPage) {
            $(this).parent().addClass('active');
        }
    });
}
$(function(){
    active();
});
$(document).on('click', '.nav li a', function (e) {
    $(this).parent().addClass('active');
});
$(document).ready(function() {
    $('#notice').html(function () {
        if ($(this).html() == "") {
            $('#diverro').hide();
        }
        else {
            if ($(this).html()=="Logado com sucesso."||$(this).html()=="Saiu com sucesso."||$(this).html()=="Bem-vindo! Você se registrou com sucesso."){
                $("#diverro").removeClass("alert alert-warning").addClass("alert alert-success");
            }
            else{
                $("#diverro").removeClass("alert alert-success").addClass("alert alert-warning");
            }
            setTimeout(function(){
                $('#diverro').fadeOut();
            }, 3000)

        }
    });
});