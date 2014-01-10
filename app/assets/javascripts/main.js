function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
};

function PreviewImage(idx) {
  var oFReader = new FileReader();
  oFReader.readAsDataURL(document.getElementById("photo-input-"+idx).files[0]);
  oFReader.onload = function (oFREvent) {
    document.getElementById("photo-preview-"+idx).src = oFREvent.target.result;
    $("#photo-div-"+idx).show
  };
};

$(document).ready(function(){
  $(document).on("click",".vote-button",function(){
    var form = $(this).closest("form");
    form.submit();
  });
});