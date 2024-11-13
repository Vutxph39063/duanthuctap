
<!-- Products Start -->
<div class="boxleft">
        <div class="items">
        <?php
                        $i=0;
                        foreach ($spnew as $sp):
                            extract($sp);
                            $linksp="index.php?act=sanphamct&idsp=".$id;
                            $hinh=$img_path.$anh;
                            if(($i==2)||($i==5)||($i==8)){
                                $mr="";
                            } else {
                                $mr="mr";
                            }
                            ?>
                            <div class="box_items <?php echo $mr ?>">
                    <div class="row img">
                        <a href="<?php echo $linksp ?>" style="height: 400px;width:100%;object-fit: cover;"><img src="<?php echo $hinh ?>" alt="" style="height: 400px;width:100%;object-fit: cover;"></a>
                    </div>
                    <a href="<?php echo $linksp ?>">
                        <b><?php echo $ten ?></b>
                    </a>
                    <p style="color: red;">
                        <b><?php echo number_format($gia_ban) ?> ₫</b>
                    </p>
                    <div>
                        <button data-id="<?= $id ?>" class="btnCart" onclick="addToCart(<?= $id ?>, '<?= $ten ?>', <?= $gia_ban ?>)">Thêm vào giỏ hàng</button>
                    </div>
                </div>
                <?php
                        $i += 1;
                    endforeach;
               
        
              ?>
              
        </div>
</div>

<!-- Products End -->


<!-- Offer Start -->
<div class="container-fluid pt-5 pb-3">
    <div class="row px-xl-5">
        <div class="col-md-6">
            <div class="product-offer mb-30" style="height: 300px;">
                <img class="img-fluid" src="img/_giao_ti_p_th_ng_minh_b_a_tr_c.png"  alt="" style= "object-fit: cover;">
                <div class="offer-text">
                   
                    <a href="" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="product-offer mb-30" style="height: 300px;">
                <img class="img-fluid" src="img/anh-bia-1-cang-cam-tinh-cang-that-bai.png" alt="" style= "object-fit: cover;">
                <div class="offer-text">
                   
                    <a href="" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Offer End -->
<h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Recent Products</span></h2>

<div class="boxleft">
        <div class="items">
        <?php
                        $i=0;
                        foreach ($spnew1 as $sp):
                            extract($sp);
                            $linksp="index.php?act=sanphamct&idsp=".$id;
                            $hinh=$img_path.$anh;
                            if(($i==2)||($i==5)||($i==8)){
                                $mr="";
                            } else {
                                $mr="mr";
                            }
                            ?>
                            <div class="box_items <?php echo $mr ?>">
                    <div class="row img">
                        <a href="<?php echo $linksp ?>" style="height: 400px;width:100%;object-fit: cover;"><img src="<?php echo $hinh ?>" alt="" style="height: 400px;width:100%;object-fit: cover;"></a>
                    </div>
                    <a href="<?php echo $linksp ?>">
                        <b><?php echo $ten ?></b>
                    </a>
                    <p style="color: red;">
                        <b><?php echo number_format($gia_ban) ?> ₫</b>
                    </p>
                    <div>
                        <button data-id="<?= $id ?>" class="btnCart" onclick="addToCart(<?= $id ?>, '<?= $ten ?>', <?= $gia_ban ?>)">Thêm vào giỏ hàng</button>
                    </div>
                </div>
                <?php
                        $i += 1;
                    endforeach;
               
        
              ?>
              
        </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    let totalProduct = document.getElementById('totalProduct');
    function addToCart(productId, productName, productPrice) {
        // console.log(productId, productName, productPrice);
        // Sử dụng jQuery
        $.ajax({
            type: 'POST',
            // Đường dẫ tới tệp PHP xử lý dữ liệu
            url: './view/addToCart.php',
            data: {
                id: productId,
                name: productName,
                price: productPrice
            },
            success: function(response) {
                totalProduct.innerText = response;
                alert('Bạn đã thêm sản phẩm vào giỏ hàng thành công!')
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
</script>

