</div><br/><br/>
  <footer class="col-md-12 text-center" id="footer">&copy; Copyright PIERRO store 2019</footer>

<script>
jQuery(window).scroll(function(){
var vscroll = jQuery(this).scrollTop();
jQuery('#logotext').css({
  "transform" : "translate(0px, "+vscroll/2+"px)"
});
});

function detailsmodal(id){
  var data = {"id" : id};
  jQuery.ajax({
    url : '/Proj/includes/detailsmodal.php',
    method : "post",
    data : data,
    success: function(data){
    jQuery('body').append(data);
    jQuery('#details-modal').modal('toggle');
    },
    error: function(){
        alert("Something went wrong!");
    }
  });
}

function update_cart(mode,edit_id,edit_size) {
   var data = {"mode" : mode, "edit_id" : edit_id, "edit_size" : edit_size};
   jQuery.ajax({
       url : '/Proj/admin/parsers/update_cart.php',
       method : "post",
       data : data,
       success : function () {location.reload();},
       error : function () {
           alert("Something went wrong");
       }
   });
}

function add_to_cart(){
  jQuery('#modal_errors').html("");
  var size = jQuery('#size').val();
  var quantity = jQuery('#quantity').val();
  var available = jQuery('#available').val();
  var error = '';
  var data = jQuery('#add_product_form').serialize();
  if(size == '' || quantity == '' || quantity == 0){
    error += '<p class="text-danger text-center">You must choose a size and quantity.</p>';
    jQuery('#modal_errors').html(error);
    return;
  }else if(quantity > available){
    error += '<p class="text-danger text-center">There are only '+available+' available.</p>';
    jQuery('#modal_errors').html(error);
    return;
  }else {
    jQuery.ajax({
      url : '/Proj/admin/parsers/add_cart.php',
      method : 'post',
      data : data,
      success : function(){
        location.reload();
      },
      error : function(){alert("Something went wrong");},
    });
  }
}

</script>

<script>
jQuery('#size').change(function(){
  var available = jQuery('#size option:selected').data("available");
  jQuery('#available').val(available);
});

  function closeModal(){
    // jQuery("#details-modal").modal('hide');
      jQuery('body').removeClass("modal-open");
      jQuery('body').css("padding-right", "0px","padding-top","0px");
      jQuery('#details-modal').remove();
      jQuery('.modal-backdrop').remove();
    setTimeOut(function(){
    // jQuery('#details-modal').empty() ;
    },500);
  }

</script>
  </body>
<html>
