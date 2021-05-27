$(document).ready(function(){
  $("#request_type_request").on('change' ,function(){
    $.ajax({
      method: "GET",
      url: "/employee/requests/change_select",
      data: { type_request: $(this).val() }
    })
  });
});
