<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/styleuser.css">
</head>
<body>

        <?php
            if (isset($_SESSION['user'])) {
            extract($_SESSION['user']);
        ?>
                <div class="boxtitle"  style=" font-size: 30px;    ">
                    <!-- Xin chào  -->
                    <?=$user?></div>
                    <div class="boxcontent formtaikhoan">
                        <div class="row mb10">
                            <li>
                                <a href="index.php?act=myorder">Đơn hàng của tôi</a>
                            </li>
                            <li>
                                <a href="index.php?act=quenmk">Quên mật khẩu</a>
                            </li>
                            <li>
                                <a href="index.php?act=edit_taikhoan">Cập nhật tài khoản</a>
                            </li>

            <?php if($role==1){ ?>
                <li>
                    <a href="admin/index.php?act=listsp">Đăng nhập Admin</a>
                </li>
            <?php } ?>

            <li>
                <a href="index.php?act=thoat">Thoát</a>
            </li>
        </div>
    </div>
            <?php
                } else {
            ?>
                <div class="boxtitle">ĐĂNG NHẬP</div>
                    <div class="boxcontent formtaikhoan">
                        <form action="index.php?act=dangnhap" method="post">
                            <div class="row mb10">
                                Tên đăng nhập <br>
                                <input type="text" name="user"> 
                            </div>
                            <div class="row mb10">
                                Mật khẩu <br>
                                <input type="password" name="pass"> 
                            </div>
                            <div class="row mb10">
                                <input type="submit" value="Đăng nhập" name="dangnhap">
                             </div>
                        </form>
                            <li>
                                <a href="index.php?act=quenmk">Quên mật khẩu</a>
                            </li>
                            <li>
                                <a href="index.php?act=dangky">Đăng ký tài khoản</a>
                            </li>

            <?php
            if(isset($thongbao) && ($thongbao != "")){
                echo $thongbao;
                }
                ?>
                </div>
            <?php
}
?>

</body>
</html>