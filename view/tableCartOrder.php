<?php
session_start();
include "../model/pdo.php";
include "../model/sanpham.php";
include "../model/taikhoan.php";
include "../model/danhmuc.php";
include "../model/order.php";
include "../global.php";

// Kiểm tra xem giỏ hàng có dữ liệu hay không
if (!empty($_SESSION['cart'])) {
    $cart = $_SESSION['cart'];

    // Tạo mảng chứa ID các sản phẩm trong giỏ hàng
    $productId = array_column($cart, 'id');

    // Chuyển đổi mảng id thành một chuỗi để thực hiện truy vấn
    $idList = implode(',', $productId);

    // Lấy thông tin sản phẩm từ cơ sở dữ liệu
    $dataDb = loadone_sanphamCart($idList);
    
    // Kiểm tra nếu có dữ liệu
    if (!empty($dataDb)) {
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
                <td><?= number_format((int)$product['gia_ban'], 0, ",", ".")  ?> <u>đ</u></td>
                <td>
                    <input type="number" value="<?= $quantityInCart ?>" min="1" id="quantity_<?= $product['id'] ?>" oninput="updateQuantity(<?= $product['id'] ?>, <?= $key ?>)">
                </td>
                <td>
                    <?= number_format((int)$product['gia_ban'] * (int)$quantityInCart, 0, ",", ".") ?> <u>đ</u>
                </td>
                <td>
                    <button onclick="removeFormCart(<?= $product['id'] ?>)">Xóa</button>
                </td>
            </tr>
        <?php
            // Tính tổng giá đơn hàng
            $sum_total += ((int)$product['gia_ban'] * (int)$quantityInCart);

            // Lưu tổng giá trị vào session
            $_SESSION['resultTotal'] = $sum_total;
        endforeach;
        ?>
        <tr>
            <td colspan="5" align="center">
                <h2>Tổng tiền hàng:</h2>
            </td>
            <td colspan="2" align="center">
                <h2>
                    <span>
                        <?= number_format((int)$sum_total, 0, ",", ".")  ?> <u>đ</u>
                    </span>
                </h2>
            </td>
        </tr>
<?php
    } else {
        echo '<tr><td colspan="7" align="center">Chưa có sản phẩm nào trong giỏ hàng</td></tr>';
    }
}

?>

