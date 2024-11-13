<?php

function addOrder($id_user, $hoten, $sdt, $email, $diachi, $tongtien, $pttt, $ngaydathang){
    date_default_timezone_set('Asia/Ho_Chi_Minh');
    $ngaydathangFormatted = date('Y-m-d H:i:s', strtotime($ngaydathang));
    $sql = "INSERT INTO tbl_order (id_user, hoten, sdt, email, diachi, tongtien, pttt, ngaydathang) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    $id = pdo_executeid($sql, $id_user, $hoten, $sdt, $email, $diachi, $tongtien, $pttt, $ngaydathangFormatted);
    return $id;
}


function addOrderDetail($id_order, $id_pro, $giamua, $soluong, $thanhtien){
    $sql="INSERT INTO order_detail (id_order, id_pro, giamua, soluong, thanhtien) VALUES ($id_order, $id_pro, $giamua, $soluong, $thanhtien );";
    pdo_execute($sql);
}

function loadone_order($id_order){
    $sql="select * from tbl_order where id_order=".$id_order ; 
    $order = pdo_query_one($sql);
    return $order;
}

function load_all_orders($user_id) {
    $sql = "SELECT * FROM tbl_order WHERE id_user = ?";
    $orders = pdo_query($sql, $user_id);    
    return $orders;
}

function load_order_details($id_order){
    $sql = "SELECT order_detail.*, sanpham.ten AS ten_san_pham FROM order_detail JOIN sanpham ON order_detail.id_pro = sanpham.id WHERE id_order=?";
    $orderDetails = pdo_query($sql, $id_order);
    return $orderDetails;
}

function loadall_bill($user_id) {
    $sql = "SELECT * FROM tbl_order WHERE 1";
    if($user_id > 0) $sql .= " and user_id=".$user_id;
    $sql .= " order by id_user desc";
    $listbill = pdo_query($sql);
    return $listbill;

}
function get_ttdh($n){
    switch ($n){
        case '0':
            $tt ="Đơn hàng mới";
            break;
        case '1':
        $tt ="Đang xử lí";
        break;
        case '2':
            $tt = "Đang giao hàng";
            break;
        case '3':
            $tt = "Đã giao hàng";
            break;
        default : 
        $tt ="Đơn hàng mới";
            break;

    }
    return $tt;
}
function xoabill($id_order){
    $sql = "DELETE FROM order_detail WHERE id_order=" .$id_order;
    $sql1 = "DELETE FROM tbl_order WHERE id_order=" .$id_order;
    pdo_execute($sql);
    pdo_execute($sql1);


}
function loadone_bill($id){
    $sql = "select * from tbl_order where id_order=".$id;
    $result = pdo_query_one($sql);
    return $result;
}
function update_bill($id_order,$ttdh){
    
    // $sql="update sanpham set iddm='".$iddm."',name='".$tensp."',price='".$giasp."',mota='".$mota."',img='".$hinh."' where id=".$id;
    $sql=  "UPDATE `tbl_order` SET `trangthai` = '{$ttdh}' WHERE `tbl_order`.`id_order` = $id_order";

pdo_execute($sql);

}
?>