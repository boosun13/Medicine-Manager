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

    });
    //エラーメッセージを自動でポップアップ
    $(window).on('load',function(){
        $('#errorModal').modal('show');
        } );


        
    $(window).scroll(function() {
        if ($(this).scrollTop() > 60) {
            $('.navbar-dark').css('opacity', '0.7');
        } else {
            $('.navbar-dark').css('opacity', '1');
        }
    });



$(function () {
    $(window).scroll(function () {

        const wHeight = $(window).height();
        const scrollAmount = $(window).scrollTop();

        $('.medicineMemo, .medicineManage, .medicineInfo').each(function () {
            const targetPosition = $(this).offset().top;
            if(scrollAmount > targetPosition - wHeight + 250) {
                $(this).removeClass("fadeOutDown");
                $(this).addClass("fadeInDown");
            }else if ($(this).hasClass("fadeInDown")){
                $(this).addClass("fadeOutDown");
                $(this).removeClass("fadeInDown");
            }
        });
        
        $(".info1, .info2, .info3, .home-btn").each(function () {
            const targetPosition = $(this).offset().top;
            if(scrollAmount > targetPosition - wHeight + 300) {
                $(this).removeClass("fadeOutDown");
                $(this).addClass("fadeInDown");
            }else if ($(this).hasClass("fadeInDown")) {
                $(this).addClass("fadeOutDown");
                $(this).removeClass("fadeInDown");
            }
        });

    });
});



$(document).on('turbolinks:load', function() {
    $('.home-text , .home-info').hide();
    setTimeout(function(){
        $('.home-text').fadeIn(2000);
        $('.home-info').fadeIn(2200);
    },2000);

});


$(document).on('turbolinks:load', function() {
    if($('.drawer').length){
        $('.drawer').drawer();
    };
});


$(document).on('turbolinks:load', function() {
    $( '#hospitalBtn' ).click( function() {
        if ($('#s_hospital').attr('disabled')) {
            $('#s_hospital').removeAttr('disabled');
            $('#m_hospital').attr('disabled', 10);
        } else {
            $('#s_hospital').attr('disabled', 10);
            $('#m_hospital').removeAttr('disabled');
        }
    }); 
    //処方医師フォーム
    $( '#doctorBtn' ).click( function() {
        if ($('#s_doctor').attr('disabled')) {
            $('#s_doctor').removeAttr('disabled');
            $('#m_doctor').attr('disabled', 10);
        } else {
            $('#s_doctor').attr('disabled', 10);
            $('#m_doctor').removeAttr('disabled');
        }
    }); 
    //調剤薬局フォーム
    $( '#pharmacyBtn' ).click( function() {
        if ($('#s_pharmacy').attr('disabled')) {
            $('#s_pharmacy').removeAttr('disabled');
            $('#m_pharmacy').attr('disabled', 10);
        } else {
            $('#s_pharmacy').attr('disabled', 10);
            $('#m_pharmacy').removeAttr('disabled');
        }
    }); 

    // エラーになったら始動する
    if ($('div').hasClass('field_with_errors')){
        $('#s_pharmacy').attr('disabled', 10);
        $('#m_pharmacy').removeAttr('disabled');
        $('#s_doctor').attr('disabled', 10);
        $('#m_doctor').removeAttr('disabled');
        $('#s_hospital').attr('disabled', 10);
        $('#m_hospital').removeAttr('disabled');
        $('.field').find('.collapse').addClass('show');
        
    }
});

//薬登録




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
};

$(document).on('turbolinks:load', function() {
    var pagetop = $('#page_top');
    // ボタン非表示
    pagetop.hide();
  
    // 100px スクロールしたらボタン表示
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            pagetop.fadeIn();
        } else {
            pagetop.fadeOut();
        }
    });
    pagetop.click(function () {
        $('body, html').animate({ scrollTop: 0 }, 500);
        return false;
    });
});

$(function(){
    $('a[href^="#"]').click(function(){
        var speed = 500;
        var href= $(this).attr("href");
        var target = $(href == "#" || href == "" ? 'html' : href);
        var position = target.offset().top;
        $("html, body").animate({scrollTop:position}, speed, "swing");
        return false;
    });
});