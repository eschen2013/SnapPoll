function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
};

function PreviewImage() {
  var oFReader = new FileReader();
  console.log(document.getElementById("fileupload").files[0]);
  oFReader.readAsDataURL(document.getElementById("fileupload").files[0]);
  $("#fileUpload").hide();
  oFReader.onload = function (oFREvent) {
    document.getElementById("uploadPreview").src = oFREvent.target.result;
  };
};

$(document).ready(function(){
  $(document).on("click",".vote-button",function(){
    var form = $(this).closest("form");
    form.submit();
  });
});