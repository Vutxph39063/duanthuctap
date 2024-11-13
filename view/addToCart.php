<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ensure $_SESSION['cart'] is set and is an array
    if (!isset($_SESSION['cart']) || !is_array($_SESSION['cart'])) {
        $_SESSION['cart'] = [];
    }

    // Lấy dữ liệu từ ajax đẩy lên
    $productId = $_POST['id'];
    $productName = $_POST['name'];
    $productPrice = $_POST['price'];

    // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
    $index = array_search($productId, array_column($_SESSION['cart'], 'id'));

    if ($index !== false) {
        $_SESSION['cart'][$index]['quantity'] += 1;
    } else {
        // Nếu sản phẩm chưa tồn tại thì thêm mới vào giỏ hàng
        $product = [
            'id' => $productId,
            'name' => $productName,
            'price' => $productPrice,
            'quantity' => 1
        ];
        $_SESSION['cart'][] = $product;
    }
    // Trả về số lượng sản phẩm của giỏ hàng
    echo count($_SESSION['cart']);
} else {
    echo 'Yêu cầu không hợp lệ';
}
?>
