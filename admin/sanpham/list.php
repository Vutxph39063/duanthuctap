
<style>
    table th{
  padding: 15px;
  
}
</style>
<div class="row mb10 ">
                <input class="mr20" type="button" value="CHỌN TẤT CẢ">
                <input class="mr20" type="button" value="BỎ CHỌN TẤT CẢ">
                <a href="index.php?act=addsp"> <input class="mr20" type="button" value="NHẬP THÊM"></a>
            </div>
<div class="row2">
    <div class="row2 font_title">
        <h1>DANH SÁCH LOẠI HÀNG HÓA</h1>
    </div>
    <div class="row2 form_content ">
        <form action="#" method="POST">
            <div class="row2 mb10 formds_loai">
                
                <table>
                    <tr>
                        <th></th>
                        <th>MÃ SẢN PHẨM</th>
                        <th>TÊN SẢN PHẨM</th>
                        <th>GIÁ NHẬP</th>
                        <th>GIÁ BÁN</th>
                        <th>HÌNH</th>
                        <th>SỐ LƯỢNG</th>
                        <th>CHỨC NĂNG</th>
                    </tr>
                    <?php
                    foreach ($listsanpham as $sanpham) {
                        extract($sanpham);
                        $hinhpath = "../upload/" . $anh;
                        $suasp = "index.php?act=suasp&idsp=" . $id;
                        $hard_delete = "index.php?act=hard_delete&idsp=" . $id;
                        $soft_delete = "index.php?act=soft_delete&idsp=" . $id;
                        if (is_file($hinhpath)) {
                            $hinhpath = "<img src= '" . $hinhpath . "' width='100px' height='100px'>";
                        } else {
                            $hinhpath = "No file img!";
                        }
                        echo '<tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>' . $id . '</td>
                            <td>' . $ten . '</td>
                            <td>' . $gia_niem_yet . '</td>
                            <td>' . $gia_ban . '</td>
                            <td>' . $hinhpath . '</td>
                            <td>' . $so_luong . '</td>
                            <td>
                                <a href="' . $suasp . '"><input type="button" value="Sửa"> </a>  
                                <a href="' . $hard_delete .'"><input type ="button" value="Xóa " onclick="return confirm(\'Bạn có chắc chắn muốn xóa\')"></a>
                                
                            </td>
                    </tr>';
            
                    }
                    //                     <a href="' . $soft_delete .'"><input type ="button" value="Xóa mềm" onclick="return confirm(\'Bạn có chắc chắn muốn xóa\')"></a>
                    ?>

                </table>
            </div>
            <div class="row mb10 ">
                <input class="mr20" type="button" value="CHỌN TẤT CẢ">
                <input class="mr20" type="button" value="BỎ CHỌN TẤT CẢ">
                <a href="index.php?act=addsp"> <input class="mr20" type="button" value="NHẬP THÊM"></a>
            </div>
        </form>
    </div>
</div>





</div>