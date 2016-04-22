window.onload = function(){
		var oFile = document.getElementById('file');
		var oList = document.getElementById('fileList');
		var delNode = function(i){
			console.log(i);
		}
		oFile.onchange = function(e){
			/*if(this.files.length>2){
			alert('最多选择两个文件！');
			this.value = '';
			}else{*/
			for(var i=0;i<this.files.length;i++){
				var node = document.createElement('li');
				node.setAttribute('id','li_'+i);
				var html = this.files[i].name+"<button title='btn_"+i+"' class='delBtn'>del</button>";
				node.innerHTML = html;
				oList.appendChild(node);
				//}
			}
		};
};