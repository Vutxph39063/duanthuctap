<?php
if (empty($dataDb)) {
    echo '<h1 class="no">Chưa có sản phẩm nào trong giỏ hàng</h1>';
} else {
?>
<div class="cart">Giỏ Hàng</div>
    <table border="1" width="100%" style="margin: 0 auto;">
        <thead>
            <tr align="center">
                <td>STT</td>
                <td>Hình ảnh</td>
                <td>Tên sản phẩm</td>
                <td>Đơn Giá</td>
                <td>Số lượng</td>
                <td>Thành tiền</td>
                <td>Thao tác</td>
            </tr>
        </thead>
        <tbody id="order">
            <?php
            $sum_total = 0;
            foreach ($dataDb as $key => $product) :
                // kiểm tra số lượng sản phẩm trong giỏ hàng
                $quantityInCart = 0;
                foreach ($_SESSION['cart'] as $item) {
                    if ($item['id'] == $product['id']) {
                        $quantityInCart = $item['quantity'];
                        break;
                    }
                }
            ?>
                <tr align="center">
                    <td><?= $key + 1 ?></td>
                    <td>
                        <img src="<?= $img_path . $product['anh'] ?>" alt="<?= $product['ten'] ?>" style="width: 100px; height: auto">
                    </td>
                    <td><?= $product['ten'] ?></td>
                    <td><?= number_format($product['gia_ban'], 0, ",", ".")  ?> <u>đ</u></td>
                    <td>
                        <input type="number" value="<?= $quantityInCart ?>" min="1" id="quantity_<?= $product['id'] ?>" oninput="updateQuantity(<?= $product['id'] ?>, <?= $key ?>)">
                    </td>
                    <td>
                        <?= number_format($product['gia_ban'] * $quantityInCart, 0, ",", ".") ?> <u>đ</u>
                    </td>
                    <td>
                        <button onclick="removeFormCart(<?= $product['id'] ?>)">Xóa</button>
                    </td>
                </tr>
            <?php
                // Tính tổng giá đơn hàng
                $sum_total += $product['gia_ban'] * $quantityInCart;

                // Lưu tổng giá trị vào session
                $_SESSION['resultTotal'] = $sum_total;
            endforeach;
            ?>

            <tr>
                <td colspan="5" align="center">
                    <h2>Tổng đơn hàng</h2>
                </td>
                <td colspan="2" align="center">
                    <h2>
                        <span>
                            <?= number_format($sum_total, 0, ",", ".")  ?> <u>đ</u>
                        </span>
                    </h2>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <form class="form" action="index.php?act=order" method="post">
        <input type="submit" class="order"   name="order" value="Đặt Hàng">
    </form>
<?php
}
?>

<style>
    .cart {
        text-align: center;
        line-height: 50px; 
        padding: 10px 20px;
        font-size: 40px;
        font-weight: bold;
        color: #4CAF50;
    }

    .form {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center; 
    }
    .order{
        display: inline-block;
        padding: 15px 30px;
        font-size: 16px;
        text-align: center;
        text-decoration: none;
        background-color: #4CAF50;
        color: #fff;
        border-radius: 5px;
        transition: background-color 0.3s ease, transform 0.3s ease;
        cursor: pointer;
    }
    .order:hover {
    background-color: #45a049;
    transform: scale(1.1);
    }
    .no{
        color: #4CAF50; 
        font-size: 30px; 
        font-weight: bold; 
        text-align: center;
    }

</style>



<!-- // if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])) {
//     // Lấy dữ liệu từ session giỏ hàng
//     $cartItems = $_SESSION['cart'];
//     echo "Dữ liệu trong giỏ hàng:<br>";
//     print_r($cartItems);
// } else {
//     echo "Giỏ hàng trống.";
// }
//  -->


<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    // hàm cập nhật số lượng
    function updateQuantity(id, index) {
        // lấy giá trị của ô input
        let newQuantity = $('#quantity_' + id).val();
        if (newQuantity <= 0) {
            newQuantity = 1
        }

        // Gửi yêu cầu bằng ajax để cập nhật giỏ hàng
        $.ajax({
            type: 'POST',
            url: './view/updateQuantity.php',
            data: {
                id: id,
                quantity: newQuantity
            },
            success: function(response) {
                // Sau khi cập nhật thành công
                $.post('view/tableCartOrder.php', function(data) {
                    $('#order').html(data);
                })
            },
            error: function(error) {
                console.log(error);
            },
        })
    }

    function removeFormCart(id) {
        if (confirm("Bạn có đồng ý xóa sản phẩm hay không?")) {
            // Gửi yêu cầu bằng ajax để cập nhật giỏ hàng
            $.ajax({
                type: 'POST',
                url: './view/removeFormCart.php',
                data: {
                    id: id
                },
                success: function(response) {
                    // Sau khi cập nhật thành công
                    $.post('view/tableCartOrder.php', function(data) {
                        $('#order').html(data);
                    })
                },
                error: function(error) {
                    console.log(error);
                },
            })
        }
    }
</script>
