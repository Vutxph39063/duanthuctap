
<?php
function loadall_danhmuc(){
    $sql="select * from danhmuc order by id desc";
    $listdanhmuc=pdo_query($sql);
    return  $listdanhmuc;
}
function load_ten_dm($iddm){
    if($iddm>0){
        $sql="select * from sanpham where id_danh_muc=".$iddm;
        $dm=pdo_query_one($sql);
        
        return $dm;
    }else{
        return "";
    }
}
function insert_danhmuc($ten){
    $sql = "INSERT INTO `danhmuc`(`ten`) VALUES ('$ten');";
    pdo_execute($sql);
}
function loadone_danhmuc($id){
    $sql = "select * from danhmuc where id = ".$id;
    $result = pdo_query_one($sql);
    return $result;
}
function update_danhmuc($id,$ten){
    
        // $sql="update sanpham set iddm='".$iddm."',name='".$tensp."',price='".$giasp."',mota='".$mota."',img='".$hinh."' where id=".$id;
        $sql=  "UPDATE `danhmuc` SET `ten` = '{$ten}' WHERE `danhmuc`.`id` = $id";
    
    pdo_execute($sql);

}
function delete_danhmuc($id){
    $sql = "DELETE FROM danhmuc WHERE id=" .$id;
    pdo_execute($sql);
}
// function hard_delete($id){
//     $sql = "DELETE FROM danhmuc WHERE id=" .$id;
//     pdo_execute($sql);
// }