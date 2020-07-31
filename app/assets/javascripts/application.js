// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// Bootstrap4
//= require jquery3
//= require popper
//= require bootstrap-sprockets

$( function(){
    // リンクジャンプ前にモーダルウィンドウを閉じる。
    $( 'a' ).click( function(){
        $('.modal').modal('hide');
        } );

    $( '.actions' ).click( function(){
        $('.modal').modal('hide');
        } );

    $( '.btn' ).click( function(){
        $('.modal').modal('hide');
        } );

    //エラーメッセージを自動でポップアップ
    $(window).on('load',function(){
        $('#errorModal').modal('show');
        } );


    $(window).scroll(function() {
        if ($(this).scrollTop() > 60) {
            $('nav').css('opacity', '0.7');
        } else {
            $('nav').css('opacity', '1');
        }
        });
} );

$(function() {
    var h = $(window).height();
    
    $('#wrap').css('display','none');
    $('#loader-bg ,#loader').height(h).css('display','block');
});

    
$(window).on('load', function(){ //全ての読み込みが完了したら実行
    $('#loader-bg').delay(900).fadeOut(800);
    $('#loader').delay(600).fadeOut(300);
    $('#wrap').css('display', 'block');
});
    
//10秒たったら強制的にロード画面を非表示
$(function(){
    setTimeout('stopload()',10000);
});
    
function stopload(){
    $('#wrap').css('display','block');
    $('#loader-bg').delay(900).fadeOut(800);
    $('#loader').delay(600).fadeOut(300);
}