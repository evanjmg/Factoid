window.onload = function () {
$('ul#index li').addClass('animated pulse')
$('ul#categories li').addClass('animated pulse')
$("input#submit-comment").keypress(function(event) {
    if (event.which == 13) {
        event.preventDefault();
        $("form").submit();
    }
});
$("button.edit-comment").on("click", function () {
  a = $(this).parent().parent('li');
  a.children("form.edit-comment-body").show();
  a.children('span.comment-body').hide()
});

$("input.edit-comment-input:active").keypress(function(event) {
    if (event.which == 13) {
        event.preventDefault();
        $("form").submit();
    }
});
$("header a#menu").on("click", function () {
  $('header ul#desktop-header').slideToggle();
})
$('button#like-button').on("mouseover", function() {
  $('img#star').attr("src", "../images/filled-star.png")
})
$('button#like-button').on("mouseout", function() {
  $('img#star').attr("src", "../images/unfilled-star.png")
})
$('button#like-button').on("click", function (){
  $('img#star').attr("src", "../images/filled-star.png")
})
}