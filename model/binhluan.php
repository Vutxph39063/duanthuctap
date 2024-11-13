<?php 
    function loadall_binhluan($idsp){
        $sql = "
            SELECT binhluan.id, binhluan.content, taikhoan.user, binhluan.ngaybinhluan FROM `binhluan` 
            LEFT JOIN taikhoan ON binhluan.id_user = taikhoan.id
            LEFT JOIN sanpham ON binhluan.id_pro = sanpham.id
            WHERE sanpham.id = $idsp;
        ";
        $result =  pdo_query($sql);
        return $result;
    }
    function insert_binhluan($id_user,$idpro, $noidung){
        $date = date('Y-m-d');
        $sql = "
            INSERT INTO `binhluan`(`content`, `id_user`, `id_pro`, `ngaybinhluan`) 
            VALUES ('$noidung','$id_user','$idpro','$date');
        ";
        //echo $sql;
        //die;
        pdo_execute($sql);
    }

?>