window.onload = function(){
	var oFile = document.getElementById('file');
	var oList = document.getElementById('fileList');
	var delNode = function(i){
		console.log(i);
	}
	oFile.onchange = function(e){
/*
		if(this.files.length>2){
			alert('最多选择两个文件！');
			this.value = '';
		}
		else{
*/
			document.getElementById("fileList").innerHTML=" ";
			for(var i=0;i<this.files.length;i++){
				var node = document.createElement('li');
				node.setAttribute('id','li_'+i);
				//var html = this.files[i].name+"&nbsp;&nbsp;&nbsp;&nbsp;"+"<button title='btn_"+i+"' class='delBtn'>删除</button>";
				var html = this.files[i].name;
				node.innerHTML = html;
				oList.appendChild(node);
			}
		//}
	};
	oList.addEventListener('click', function(e){
		var $el = e.target;
		if($el.className == 'delBtn'){
		//alert($el.title);
			var $li = $el.parentNode;
			$li.parentNode.removeChild($li);
			var index = parseInt( $el.getAttribute('title').replace('btn_', '') );
			fileList.splice(index, 1);
		};
		}, false);
	fileList.forEach(function (file){
		if (file.name.matches(/something.txt/)){
			var reader = new FileReader();
			reader.onload = (function (processedFile){
				return function (e) {
					var fileData = { name : processedFile.name, fileData : e.target.result };
					$.post("/your/url/here", fileData);
					validatedFiles.push(fileData);
				};
			})(file);
			reader.readAsDataURL(file);
			}
			else{
		}
	});
};
function clr() {  
	document.getElementById("sf").innerHTML="<input type='file' multiple id='file'>";
	document.getElementById("fileList").innerHTML=" ";
}
