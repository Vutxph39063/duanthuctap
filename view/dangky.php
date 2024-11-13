
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/styleuser.css">
   
    </style>
</head>
<body>

<div class="boxtitle">ĐĂNG KÝ</div>
                <div class="row boxcontent formtaikhoan">
                       <form action="index.php?act=dangky" method="post">
                            <div class="row mb10">
                                Email
                                <input type="email" name="email">
                            </div>
                            <div class="row mb10">
                                Tên đăng nhập
                                <input type="text" name="user">
                            </div>
                            <div class="row mb10">
                                Mật khẩu
                                <input type="password" name="pass">
                            </div>
                            <div class="row mb10">
                                Số điện thoại
                                <input type="tel" name="tel">
                            </div>
                            <div class="row mb10">
                                <input type="submit" value="Đăng ký" name="dangky">
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
       