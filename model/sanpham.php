

<?php
function loadall_sanpham_home(){
    $sql="select * from sanpham where 1 order by id desc limit 0,8";
    $listsanpham=pdo_query($sql);
    return  $listsanpham;
}
function insert_sanpham($ten, $id_danh_muc, $gia_niem_yet,$gia_ban, $so_luong, $anh, $mo_ta){
    $sql = "INSERT INTO `sanpham`(`ten`, `id_danh_muc`, `gia_niem_yet`, `gia_ban`, `so_luong`, `anh`, `mo_ta`) VALUES ('$ten', '$id_danh_muc', '$gia_niem_yet', '$gia_ban', '$so_luong', '$anh', '$mo_ta');";
    pdo_execute($sql);
}
function loadall_sanpham($keyw="",$iddm=0){
    $sql="SELECT * from sanpham where trangthai = 0";
    // where 1 tức là nó đúng
    if($keyw!=""){
        $sql.=" and ten like '%".$keyw."%'";
    }
    if($iddm>0){
        $sql.=" and id_danh_muc ='".$iddm."'";
    }
    $sql.=" order by id desc";
    $listsanpham=pdo_query($sql);
    return  $listsanpham;
}
function loadone_sanpham($id){
    $sql = "select * from sanpham where id=".$id;
    $result = pdo_query_one($sql);
    return $result;
}
function load_sanpham_cungloai($id){
    $sql = "select * from sanpham where id <> =".$id;
    $listsanpham = pdo_query($sql);
    return $listsanpham;    
}
function loadone_sanpham_cungloai($id,$id_danh_muc){
    $sql = "select * from sanpham where id_danh_muc=".$id_danh_muc." AND id <> ".$id; 
    $listsanpham=pdo_query($sql);
    return  $listsanpham;
}
function update_sanpham($id,$ten, $id_danh_muc, $gia_niem_yet,$gia_ban, $so_luong, $anh, $mo_ta){
    if($anh!=""){
        //$sql="update sanpham set iddm='".$iddm."',name='".$tensp."',price='".$giasp."',mota='".$mota."',img='".$hinh."' where id=".$id;
        $sql=  "UPDATE `sanpham` SET `ten` = '{$ten}', `id_danh_muc` = '{$id_danh_muc}', `gia_niem_yet` = '{$gia_niem_yet}',`gia_ban` = '{$gia_ban}', `so_luong` = '{$so_luong}', `anh` = '{$anh}', `mo_ta` = '{$mo_ta}' WHERE `sanpham`.`id` = $id";
    }else{
        //  $sql="update sanpham set iddm='".$iddm."',name='".$tensp."',price='".$giasp."',mota='".$mota."' where id=".$id;
        $sql=  "UPDATE `sanpham` SET `ten` = '{$ten}', `id_danh_muc` = '{$id_danh_muc}', `gia_niem_yet` = '{$gia_niem_yet}',`gia_ban` = '{$gia_ban}', `so_luong` = '{$so_luong}',  `mo_ta` = '{$mo_ta}' WHERE `sanpham`.`id` = $id";
    }
    pdo_execute($sql);
}
function hard_delete($id){
    $sql = "DELETE FROM sanpham WHERE id=" .$id;
    pdo_execute($sql);
}

// cÂU TRUY VẤN XÓA MỀM
// function soft_delete($id){
//     $sql = "UPDATE `sanpham` SET `trangthai` = 1 WHERE `sanpham`.`id` = $id";
//     pdo_execute($sql);
// }
function check_khoa_ngoai($id){
    $sql="select * from sanpham where id_danh_muc =".$id;
    
    $listsanpham=pdo_query($sql);
    return  count($listsanpham);
}

function loadone_sanphamCart ($idList) {
    $sql = 'SELECT * FROM sanpham WHERE id IN ('. $idList . ')';
    $sanpham = pdo_query($sql);
    return $sanpham;
}
function loadall_sanpham_home1(){
    $sql="select * from sanpham where 1 order by id asc limit 0,8";
    $listsanpham=pdo_query($sql);
    return  $listsanpham;
}

?>

