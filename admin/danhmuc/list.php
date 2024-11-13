<?php
$dsdm = loadall_danhmuc();
if(isset($thongbao) && ($thongbao!="")) echo $thongbao;
?>
<a href="index.php?act=adddanhmuc"> <input class="mr20" type="button" value="NHẬP THÊM"></a>
<table>
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                    </tr>
                    <?php
                       
                        


                    foreach ($dsdm as $dm) {
                        extract($dm);
                        $deletedanhmuc = "index.php?act=deletedanhmuc&id=" . $id;
                      
                        $suadanhmuc = "index.php?act=suadanhmuc&iddanhmuc=" . $id;
                        echo '<tr>
                            <td>' . $id . '</td>
                            <td>' . $ten . '</td>
                            <td>
                                <a href="' . $suadanhmuc . '"><input type="button" value="Sửa"> </a>  
                                <a href="' . $deletedanhmuc .'"><input type ="button" value="Xóa " onclick="return confirm(\'Bạn có chắc chắn muốn xóa\')"></a>
                                
                                
                            </td>
                    </tr>';
            
                    }
                    
                                        // <a href="' . $soft_delete .'"><input type ="button" value="Xóa mềm" onclick="return confirm(\'Bạn có chắc chắn muốn xóa\')"></a>
                    ?>

</table>
<div class="row mb10 ">
                
            </div>
