<?php
if(is_array($bill)){
    extract($bill);
}

?>
<div class="row2">
    <div class="row2 font_title">
        <h1>THÊM MỚI SẢN PHẨM</h1>
    </div>
    <div class="row2 form_content ">
        <form action="index.php?act=updatebill" method="POST" enctype="multipart/form-data">
            <div class="row2 mb10 form_content_container">
            </div>
    </div>

        </div>
        <table border = "2" cellpadding="2"border-collapse:collapse width="100%">
                    <tr>
                        <th></th>
                        <th>MÃ ĐƠN HÀNG</th>
                        <th>KHÁCH HÀNG</th>
                        <th>SỐ TIỀN</th>
                        <th>TÌNH TRẠNG ĐƠN HÀNG</th>
                        <th>THAO TÁC</th>
                        
                    </tr>
                    <?php
                         
                            extract($bill);
                            
                            $kh = $bill["hoten"].'
                            <br> '.$bill["sdt"].'
                            <br> '.$bill["email"].'
                            <br> '.$bill["diachi"];
                            // $ttdh = get_ttdh($bill['trangthai']);
                            echo '
                            <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>ĐƠN SỐ-'.$bill['id_order'].'</td>
                            <td>'.$kh.'</td>
                            <td>'.$bill['tongtien'].'</td>
                            <td><input type="number" value="'.$bill['trangthai'].'" name="ttdh" min="0" max="3"></td>
                            <td>
                            <input type="hidden" name="id" value="'.$bill['id_order'].'">
                            <input class="mr20" name="updatebill" type="submit" value="Cập Nhật">
                            
                            </td>
                            
                            
                            </tr>

                            
                            ';
                            
                            if(intval($bill['trangthai'])==3)
                            {
                                set_status($id_user);
                            }
                            


                    ?>
                    

                    

                </table>
                <table border = "2" cellpadding="2"border-collapse:collapse >
                    <tr>
                        <th>Số</th>
                        <th>Tình trạng</th>
                    </tr>
                    <tr>
                        <td>0</td>
                        <td>Đơn hàng mới</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Đang xử lí</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Đang giao hàng</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Đã giao hàng</td>
                    </tr>

                </table>
        
       
        
        
        
        </form>
    </div>
</div>
