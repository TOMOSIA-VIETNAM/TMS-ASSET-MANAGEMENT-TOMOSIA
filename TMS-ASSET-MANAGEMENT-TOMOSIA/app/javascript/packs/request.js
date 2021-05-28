$(document).ready(function(){
  $('#request_type_request').on('change',function(){
    var text = $(this).val()
    $.ajax({
      // dataType: 'JSON',
      method: "GET",
      url: '/employee/requests/change_select',
      data: { name: text },
      success: function(data){
        console.log(data)        
      }
    })
  });
});
