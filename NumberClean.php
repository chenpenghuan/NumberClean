<?php
header("Content-type: text/json; charset=utf-8");
if($_GET['pnums']){
    $cont=file_get_contents('http://127.0.0.1/PC/index.php/home/index/get/pnums/'.$_GET['pnums']);
    echo $cont;
}else{
    echo json_encode(array('ErrorInfo'=>'missing parameter pnums'));
}
?>
