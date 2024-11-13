<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <style>
    .boxtitle {
    font-size: 25px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 20px;
    color: red;
    
  }
  
  .boxcontent {
    width: 300px;
    margin: 0 auto;
  }
  
  .formtaikhoan {
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 8px;
    background-color: #f8f8f8;
  }
  
  .row {
    margin-top: 10px;
  }
  
  .row input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
  }
  
  .row input[type="submit"],
  .row input[type="reset"] {
    background-color: #4caf50;
    color: #fff;
    cursor: pointer;
    padding: 10px;
    border: none;
    border-radius: 4px;
  }
  
  .row input[type="submit"]:hover,
  .row input[type="reset"]:hover {
    background-color: #45a049;
  }
  
  .thongbao {
    color: #ff0000;
    font-size: 16px;
    text-align: center;
    margin-top: 10px;
  }
   </style>
</head>
<body>

                    
                    <div class="boxtitle">CẬP NHẬT TÀI KHOẢN</div>
                        <div class="row boxcontent formtaikhoan">
                            <?php
                                if(isset($_SESSION['user'])&&(is_array($_SESSION['user']))){
                                    extract($_SESSION['user']);
                                }
        
                            ?>
                               <form action="index.php?act=edit_taikhoan" method="post">
                                    <div class="row mb10">
                                        Email
                                        <input type="email" name="email" value="<?=$email?>">
                                    </div>
                                    <div class="row mb10">
                                        Tên đăng nhập
                                        <input type="text" name="user" value="<?=$user?>">
                                    </div>
                                    <div class="row mb10">
                                        Mật khẩu cũ
                                        <input type="password" name="pass" >
                                    </div>

                                    <div class="row mb10">
                                        Mật khẩu mới
                                        <input type="password" name="password">
                                    </div>
                                    
                                    <div class="row mb10">
                                        Điện thoại
                                        <input type="text" name="tel" value="<?=$tel?>">
                                    </div>
                                    <div class="row mb10">
                                        <input type="hidden" name="id" value="<?=$id?>">
        
                                        <input type="submit" value="Cập nhật" name="capnhat">
                                       
                                    </div>
                               </form>
        
                               <h2 class="thongbao"> 
                               <?php
                                    if(isset($thongbao)&&($thongbao!="")){
                                        echo $thongbao;
                                    }
                               ?>
                               </h2>
                        </div>
               

</body>
</html>


