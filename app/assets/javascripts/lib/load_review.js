$(document).ready(function () {
  $("#load-review").click(function (e) {
    e.preventDefault();
    $(".load-more").hide();
    var last_id = $(".list-review-content").last().attr("data-id");
    $.ajax({
      type: "GET",
      url: $(this).attr("href"),
      data: {review_id: last_id},
      dataType: "script",
      success: function () {
          $(".load-more").show();
      }
    });
  });
});
