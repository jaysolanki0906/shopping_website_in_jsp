<html>
<head>
</head>
<body>
   <input type="file" name="file" id="file" multiple 
       onchange="javascript:updateList()" />
<br/>Selected files:
<div id="fileList"></div>
<script>
updateList = function() {
  var input = document.getElementById('file');
  var output = document.getElementById('fileList');

 
  for (var i = 0; i < input.files.length; ++i) {
    output.innerHTML +=  input.files.item(i).name;
	document.write(input.files.item(i).name);
  }
  output.innerHTML ;
  //document.location.href = "demopage.jsp?name="+output.innerHTML;
}
</script>
</body>
</html>