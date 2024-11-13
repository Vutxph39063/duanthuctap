
<style>
    table th{
  padding: 15px;
  
}
</style>
<div class="row2">
    <div class="row2 font_title">
        <h1>DANH SÁCH ĐƠN HÀNG</h1>
    </div>
    <div class="row2 form_content ">
        <form action="#" method="POST">
            <div class="row2 mb10 formds_loai">
                <!-- <form action="index.php?act=listsp" method="post">
                   
                    <select name="iddm" id="">
                        <option value="0" selected>Tất cả</option>
                        
                    </select>
                    <input type="submit" name="clickOK" value="GO">
                </form> -->
                <table>
                    <tr>
                        <th></th>
                        <th>MÃ ĐƠN HÀNG</th>
                        <th>KHÁCH HÀNG</th>
                        <th>SỐ TIỀN</th>
                        <th>TÌNH TRẠNG ĐƠN HÀNG</th>
                        <th>THAO TÁC</th>
                        
                    </tr>
                    <?php
                         foreach($listbill as $bill)   
                         {
                            extract($bill);
                            $suabill =  "index.php?act=suabill&idbill=" . $bill['id_order'];
                            $xoabill = "index.php?act=xoabill&idbill=" . $bill['id_order'];
                            $kh = $bill["hoten"].'
                            <br> '.$bill["sdt"].'
                            <br> '.$bill["email"].'
                            <br> '.$bill["diachi"];
                            $ttdh = get_ttdh($bill['trangthai']);
                            echo '
                            <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>ĐƠN SỐ-'.$bill['id_order'].'</td>
                            <td>'.$kh.'</td>
                            <td>'.$bill['tongtien'].'</td>
                            <td>'.$ttdh.'</td>
                            <td>
                                <a href="' . $suabill . '"><input type="button" value="Sửa"> </a>  
                                <a href="' . $xoabill .'"><input type ="button" value="Xóa " onclick="return confirm(\'Bạn có chắc chắn muốn xóa\')"></a>
                                
                            </td>
                            
                            
                            </tr>

                            
                            ';
                         }    


                    ?>

                    

                </table>
            </div>
            <!-- <div class="row mb10 ">
                <input class="mr20" type="button" value="CHỌN TẤT CẢ">
                <input class="mr20" type="button" value="BỎ CHỌN TẤT CẢ">
                <a href="index.php?act=addsp"> <input class="mr20" type="button" value="NHẬP THÊM"></a>
            </div> -->
        </form>
    </div>
</div>





</div>