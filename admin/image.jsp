<html >
<head>
</head>
<body>
    <div class="container">
        <input type="file" id="file-input" accept="image/png, image/jpeg" onchange="preview()" multiple>
        <label for="file-input">
            <i class="fas fa-upload"></i> &nbsp; Choose A Photo
        </label>
        <p id="num-of-files">No Files Chosen</p>
        <div id="images"></div>
    </div>
    <script >
	let fileInput = document.getElementById("file-input");
let imageContainer = document.getElementById("images");

let numOfFiles = document.getElementById("num-of-files");

function preview(){
    imageContainer.innerHTML = "";
    numOfFiles.textContent = `${fileInput.files.length} Files Selected`;

    for(i of fileInput.files){
        let reader = new FileReader();
        let figure = document.createElement("figure");
        let figCap = document.createElement("figcaption");
        figCap.innerText = i.name;
		
        figure.appendChild(figCap);
        reader.onload=()=>{
            let img = document.createElement("img");
           
        }
        imageContainer.appendChild(figure);
        reader.readAsDataURL(i);
		
    }
}
</script>
</body>
</html>