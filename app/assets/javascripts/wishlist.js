$(document).ready(function(){
  $(".favorites").on("click", function(){
    var $id = $(this).data().item;
    $.ajax({
      dataType: "json",
      url: "/wishlist.json",
      method: "POST",
      data: { wishlist: { item_id: $id } },
      success: function(data){
        $("#item-" + data.item_id).text("remove from favorites");
      }
    });
  });
  // $(".remove").on("click", function(){
  //   var $id = $(this).data().item;
  //   $.ajax({
  //     dataType: "json",
  //     url: "/wishlist" + $id +".json",
  //     method: "DELETE",
  //     data: { wishlist: { item_id: $id } },
  //     success: function(data){
  //       $("#item-" + data.item_id).text("add to favorites");
  //     }
  //   });
});