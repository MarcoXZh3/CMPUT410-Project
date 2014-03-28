var json_data = null;
var allfiles = new Array();
window.onload = function() {
  setInterval(function() {
    document.getElementById('status').style.display = 'none';
  }, 3000); // setInterval(funtion() {...}, 3000);

  document.getElementById('reset').onclick = function() {
    json_data = null;
  } // document.getElementById('reset').onclick = function()

  document.getElementById('submit').onclick = function() {
    data = new FormData();
    for (var i = 0; i < allfiles.length; i++)
      data.append('files', allfiles[i]);
    alert(data);
  } // document.getElementById('submit').onclick = function()

  document.getElementById('edit').onclick = function() {
    
    var upload = document.getElementById('upload');
    var data = '';
    for (var i = 0; i < upload.files.length; i++)
      allfiles.push(upload.files[i].name);
    alert(allfiles.length);
  }; // document.getElementById('add_photo').onclick = function()

}; // window.onload = function()


