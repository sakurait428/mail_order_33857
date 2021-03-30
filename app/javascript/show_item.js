$(function(){
  $("img.ChangePhoto").click(function(){
  var ImgSrc = $(this).attr("src");
  var ImgAlt = $(this).attr("alt");
  $("img#MainPhoto").attr({src:ImgSrc,alt:ImgAlt});
  $("img#MainPhoto").hide();
  $("img#MainPhoto").fadeIn("normal");
  return false;
  });
});
  