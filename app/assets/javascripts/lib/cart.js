$(document).on('turbolinks:load',function(){
  $("#dec-qty-button").on("click",function(event){
    event.preventDefault();
    var oldVal = parseInt($(this).parent().next().next().val());
    if(oldVal > 1) {
      var newVal = parseInt(oldVal - 1);
    }else{
      var newVal = 1;
    }
    $input = $(this).parent().next().next()
    $input.val(newVal);
  })
  $("#inc-qty-button").on("click",function(event){
    event.preventDefault();
    var oldVal = parseInt($(this).parent().prev().prev().val());
    var newVal = parseInt(oldVal + 1);
    $input = $(this).parent().prev().prev()
    $input.val(newVal);
  })
})
