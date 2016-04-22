<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
	public function get(){
		try{
		if($_GET['pnums']){
			$pnums=$_GET['pnums'];
			$pnum=explode(',',$pnums);
			$pnum_c=count($pnum);
			$pnumstr='';
			unset($results);
			unset($result);
			unset($pnum_not_mat);
			unset($status);
			for($i=0;$i<$pnum_c;$i++){
			//		echo $pnum[$i].'<br>';
				if(preg_match("/^1[34578]\d{9}$/",substr($pnum[$i],-11))){
					$pnum_mat[]=$pnum[$i];
					$exp=',';
					$pnumstr.=substr($pnum[$i],-11).$exp;
				}else{
					//正则校验失败
					$pnum_not_mat[]=$pnum[$i];
				}
			}
			$pnumstr=substr($pnumstr,0,strlen($pnumstr)-1); //截掉末尾的逗号
			$status=M('status','status','mysql://root:123123@192.168.1.198/cleanpt');
			//var_dump($pnumstr);
			//var_dump($status->getLastSql());
			$tables=$status->query('show tables');
			//var_dump($tables);
			if($tables){
				$result=$status->query('select num,code from status where num in('.$pnumstr.')');
				//var_dump('select num,code from status where num in('.$pnumstr.')');
				$result_c=count($result);
			}else{
				echo '数据库连接错误';
				file_put_contents(date('Y-m-d',time()).'.txt',"数据错连接错误".date('Y-m-d H:i:s',time())."\n", FILE_APPEND);
				exit();
			}
			for ($i = 0; $i < $result_c; $i++) {
				$results_in[$result[$i]['num']]=$result[$i]['code'];
				$pnum_in_results[]=$result[$i]['num'];
			}
			for ($i = 0; $i < $pnum_c; $i++) {
				if(in_array(substr($pnum[$i],-11),$pnum_in_results)){
					$results[$pnum[$i]]=$results_in[substr($pnum[$i],-11)];
				}else{
					//正则匹配失败时
					if(in_array($pnum[$i],$pnum_not_mat)){
						$results[$pnum[$i]]='4';
					}else{
					//数据库匹配不到时
						$results[$pnum[$i]]='-1';
					}
				}
			}
			//var_dump($results);
		}
		}catch(\Exception $e){
			echo '数据库查询错误!';
			file_put_contents(date('Y-m-d',time()).'.txt',$e->getMessage().date('Y-m-d H:i:s',time())."\n", FILE_APPEND);
			exit();
		}
	}
	public function index(){
		$_SESSION['username']='chenpenghuan';
    	$this->display('index');
    }
    public function fileupload(){
		umask(0007);
//这里上传文件
	    set_time_limit(0);
	    $upload = new \Think\Upload();// 实例化上传类    
        //$upload->saveName='';
	    $upload->maxSize=1073741824;// 设置附件上传大小    
	    $upload->exts=array('txt','zip','csv');// 设置附件上传类型    		
	    $upload->rootPath='/var/www/html/PC/Public'; // 设置附件上传目录    // 上传文件     
		$upload->savePath='/Uploads/'; // 设置附件上传目录    // 上传文件     
		//$upload->autoSub = false;
		//$upload->uploadReplace=true;
		$upload->autoSub = true;
		$upload->subName=array('date','Ymd');
//判断文件夹是否存在，存在就清空文件夹。不存在就创建
        	//exec('rm -rf /var/www/html/PC/Public/Uploads/new/*');
	   	$info1=$upload->upload();
	    if(!$info1) {// 上传错误提示错误信息        
				//var_dump($upload->savePath);
		   	$this->error($upload->getError());    
		}else{// 上传成功,加载文件到数据库
			//var_dump($info1);
			$start1='压缩包中的内容为：<br>';
			$start2='其中以下文件不合法: <br>';
			$start3='不支持含有文件夹，但压缩包中有: <br>';
			$format1='';
			$format2='';
			$format3='';
			$format=0;
			$zip = zip_open($upload->rootPath.$info1[0]['savepath'].$info1[0]['savename']); 
			if ($zip) { 
				while ($zip_entry = zip_read($zip)) { 
					$format1=$format1.zip_entry_name($zip_entry) . "<br/>"; 
					//var_dump(strpos(zip_entry_name($zip_entry),'/'));
					if(substr(zip_entry_name($zip_entry),-4)!='.csv' && substr(zip_entry_name($zip_entry),-4)!='.txt' || strpos(zip_entry_name($zip_entry),'/')!= false){
						$format=$format+1;
						$format2=$format2.zip_entry_name($zip_entry).'<br>';
						if(zip_entry_filesize($zip_entry)==0 && substr(zip_entry_name($zip_entry),-1)!='/'){
							$format=$format+1;
							$format3=$format3.zip_entry_name($zip_entry).'<br>';
						}
					}
				//echo "Actual Filesize: " . zip_entry_filesize($zip_entry) . "<br/>"; 
				//echo "Compressed Size: " . zip_entry_compressedsize($zip_entry) . "<br/>"; 
				//echo "Compression Method: " . zip_entry_compressionmethod($zip_entry) . "<br/>"; 
				//if (zip_entry_open($zip, $zip_entry, "r")) { 
					#echo "File Contents:" . "<br/>"; 
				//	$buf = zip_entry_read($zip_entry, zip_entry_filesize($zip_entry)); 
				//	echo "$buf"; 
				//	zip_entry_close($zip_entry); 
				} 
				$upinfo='';
				if($format1!=''){
					$upinfo.=$start1.$format1;
				}
				if($format2!=''){
					$upinfo.=$start2.$format2;
				}
				if($format3!=''){
					$upinfo.=$start3.$format3;
				}
			} 
			zip_close($zip); 
			if($format==0){
				$tasktime=time();
				$taskinfo=M('taskinfo');
				$data=array('username'=>$_SESSION['username'],'tasktime'=>$tasktime,'taskcode'=>$_SESSION['username'].$tasktime,'filename'=>$info1[0]['name'],'upload'=>$upload->rootPath.$info1[0]['savepath'].$info1[0]['savename'],'tasklevel'=>$_POST['tasklevel'],'taskstatus'=>0);
				if($taskinfo->data($data)->add()){
					$this->assign('msg','您的任务已经排队，我们将尽快受理，您可以在“最新任务”中查看您的任务状态');
				}else{
					echo '数据库写入错误，请联系系统管理员为您解决!';
				}
			}else{
				$this->assign('msg','您上传的文件不合法，请检查压缩包中是否含有文件夹或文件名含有“/”等特殊字符或非txt、csv文件，我们的平台支持压缩多个或单个txt、csv文件，暂不支持压缩文件夹及其他类型的文件');
				$this->assign('upinfo',$upinfo);
				@unlink ($upload->rootPath.$info1[0]['savepath'].$info1[0]['savename']); 
			}
		}
		$this->display('submittask');
	}
	public function createtable($taskdata){
		$taskitems.='<table border="1px" bordercolor="gray" cellspacing="0px" cellpadding="3px" id="start" style="border-spacing:0;">
			<tr><td>任务序号</td><td>创建时间</td><td>任务代码</td><td>任务文件</td><td>优先级</td><td>当前状态</td><td>下载结果</td></tr>';
		$taskdata_c=count($taskdata);
		for ($i = 0; $i <$taskdata_c; $i++) {
			$down='待处理完';
			if($taskdata[$i]['taskstatus']==0){
				$taskdata[$i]['taskstatus']='已经排队';
				#$taskdata[$i]['changetask']='<button>修改任务</button>';
			}else{
				#$taskdata[$i]['changetask']='<button style="background:gray">修改任务</button>';
				if($taskdata[$i]['taskstatus']==2){
					$taskdata[$i]['taskstatus']='已经完成';
					$this->recovery($tid=$taskdata[$i]['taskid']);
				}else{
					$taskdata[$i]['taskstatus']='正在处理';
				}
			}
			$taskitems.='<tr><td>'.$taskdata[$i]['taskid'].'</td><td>'.date('Y-m-d H:i:s',$taskdata[$i]['tasktime']).'</td><td>'.$taskdata[$i]['taskcode'].'</td><td><a href="'.substr($taskdata[$i]['upload'],13,strlen($taskdata[$i]['upload'])).'">'.$taskdata[$i]['filename'].'</a></td><td>'.$taskdata[$i]['tasklevel'].'</td><td>'.$taskdata[$i]['taskstatus'].'</td><td>'.$down.'</td></tr>';
			//$taskitems.='<tr><td>'.$taskdata[$i]['taskid'].'</td><td>'.$taskdata[$i]['tasktime'].'</td><td>'.$taskdata[$i]['taskcode'].'</td><td>'.$taskdata[$i]['filename'].'</td><td>'.$taskdata[$i]['tasklevel'].'</td><td>'.$taskdata[$i]['taskstatus'].'</td><td>'.'修改任务'.'</td><td>'.$taskdata[$i]['download'].'</td></tr>';
		}
		$taskitems.='<tr><td colspan=8>注:清洗任务完成后，会更新下载链接到表格中，点击下载后，我们会将该任务回收到历史库，如有需要请点击“历史任务”查看。</td></tr>';
		$taskitems.='</table>';
		return $taskitems;
	}
	public function refresh(){
		$taskitems='';
		$taskinfo=M('taskinfo');
		$taskdata=$taskinfo->where('taskstatus<3 AND username="'.$_SESSION['username'].'"')->field('taskid,tasktime,taskcode,filename,upload,tasklevel,taskstatus,download')->select();
		//var_dump($taskdata);
		$taskitems=$this->createtable($taskdata);
		if($taskitems==$_SESSION['lasttask']){
			echo 0;
		}else{
			$_SESSION['lasttask']=$taskitems;
			echo $_SESSION['lasttask'];
		}
	}
	public function lasttask(){
		//$taskitems='';
		$taskinfo=M('taskinfo');
		$taskdata=$taskinfo->where('taskstatus<3 AND username="'.$_SESSION['username'].'"')->field('taskid,tasktime,taskcode,filename,upload,tasklevel,taskstatus,download')->select();
		$taskitems=$this->createtable($taskdata);
		//var_dump($taskitems);
		$_SESSION['lasttask']=$taskitems;
		$this->assign('taskitems',$taskitems);
		$this->display();
	}
	public function recovery($tid){
		$taskinfo=M('taskinfo');
		$down=$taskinfo->where(array('taskid'=>$tid))->select();
		//var_dump($down[0]);
		$taskhis=M('taskhis');
		$addhis=$taskhis->add($down[0]);
		$taskinfo->where(array('taskid'=>$tid))->delete();
		//$taskinfo->where(array('taskid'=>$_GET['taskid']))->data(array('taskstatus'=>3))->save();
		//$addhis=$taskinfo->query('insert into taskhis select * from taskinfo where taskid='.$_GET['taskid']);
		//var_dump($addhis);
		//$flag=header('Location:http://192.168.1.193'.substr($down[0]['download'],13)); //下载文件
		//var_dump($flag);
	}
	public function createhis($taskdata){
		$taskitems.='<table border="1px" bordercolor="gray" cellspacing="0px" cellpadding="3px" id="start" style="border-spacing:0;">
			<tr><td>任务序号</td><td>创建时间</td><td>任务代码</td><td>任务文件</td><td>优先级</td><td>下载结果</td></tr>';
		$taskdata_c=count($taskdata);
		for ($i = 0; $i <$taskdata_c; $i++) {
					//var_dump($df);
					$down='<button onclick="window.location.href=\''.substr($taskdata[$i]['download'],13).'\'">点击下载</button>';
			$taskitems.='<tr><td>'.$taskdata[$i]['taskid'].'</td><td>'.date('Y-m-d H:i:s',$taskdata[$i]['tasktime']).'</td><td>'.$taskdata[$i]['taskcode'].'</td><td><a href="'.substr($taskdata[$i]['upload'],13,strlen($taskdata[$i]['upload'])).'">'.$taskdata[$i]['filename'].'</a></td><td>'.$taskdata[$i]['tasklevel'].'</td><td>'.$down.'</td></tr>';
			//$taskitems.='<tr><td>'.$taskdata[$i]['taskid'].'</td><td>'.$taskdata[$i]['tasktime'].'</td><td>'.$taskdata[$i]['taskcode'].'</td><td>'.$taskdata[$i]['filename'].'</td><td>'.$taskdata[$i]['tasklevel'].'</td><td>'.$taskdata[$i]['taskstatus'].'</td><td>'.'修改任务'.'</td><td>'.$taskdata[$i]['download'].'</td></tr>';
		}
		$taskitems.='<tr><td colspan=8>注:历史任务只保存一年内。</td></tr>';
		$taskitems.='</table>';
		return $taskitems;
	}
	public function oldtask(){
		//$taskitems='';
		$taskhis=M('taskhis');
		$taskdata=$taskhis->where('taskstatus=2 AND username="'.$_SESSION['username'].'"')->order('tasktime desc')->field('taskid,tasktime,taskcode,filename,upload,tasklevel,download')->select();
		$taskitems=$this->createhis($taskdata);
		//var_dump($taskitems);
		$_SESSION['lasttask']=$taskitems;
		$this->assign('taskitems',$taskitems);
		$this->display();
	}
}
