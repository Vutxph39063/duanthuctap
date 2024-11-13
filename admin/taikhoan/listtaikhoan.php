
<style>
    table th{
  padding: 15px;
  
}
</style>
<div class="row2">
    <div class="row2 font_title">
        <h1>DANH SÁCH TÀI KHOẢN</h1>
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
                        <th>USER ID</th>
                        <th>TÊN</th>
                        <th>EMAIL</th>
                        <th>SĐT</th>
                        <th>VAI TRÒ</th>
                        
                    </tr>
                    <?php
                         foreach($listtaikhoan as $list)   
                         {
                            extract($list);
                            $suatk =  "index.php?act=suatk&idtk=" . $list['id'];
                            $xoatk = "index.php?act=xoatk&idtk=" . $list['id'];
                            $role = get_role($list['role']);
                            
                            echo '
                            <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>'.$list['id'].'</td>
                            <td>'.$list['user'].'</td>
                            <td>'.$list['email'].'</td>
                            <td>'.$list['tel'].'</td>
                            <td>'.$role.'</td>
                            <td>
                                <a href="' . $suatk . '"><input type="button" value="Sửa"> </a>  
                                <a href="' . $xoatk .'"><input type ="button" value="Xóa " onclick="return confirm(\'Bạn có chắc chắn muốn xóa\')"></a>
                                
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