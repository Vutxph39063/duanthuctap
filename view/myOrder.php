<div class="frm">
    <div class="boxtitle">ĐƠN HÀNG CỦA BẠN</div>
    <div class="dh">
        <table border="2">
            <tr>
                <th>MÃ ĐƠN HÀNG</th>
                <!-- <th>NGÀY ĐẶT</th> -->
                <th>TÊN SẢN PHẨM</th>
                <th>SỐ LƯỢNG MẶT HÀNG</th>
                <th>TỔNG GIÁ TRỊ ĐƠN HÀNG</th>
                <th>TÌNH TRẠNG ĐƠN HÀNG</th>
            </tr>
            <?php
            $orders = load_all_orders($_SESSION['user']['id']);
            foreach ($orders as $order) {
                echo "<tr>";
                echo "<td>" . $order['id_order'] . "</td>"; 
                // echo "<td>" . $order['ngaydathang'] . "</td>";
                
                // Thêm cột để hiển thị tên sản phẩm
                $orderDetails = load_order_details($order['id_order']);
                $productNames = array();
                foreach ($orderDetails as $detail) {
                    $productNames[] = $detail['ten_san_pham'];
                }
                $productNameString = implode(", ", $productNames);
                echo "<td>" . $productNameString . "</td>";
                $totalQuantity = 0;
                $totalPrice = 0;
                foreach ($orderDetails as $detail) {
                    $totalQuantity += $detail['soluong'];
                    $totalPrice += $detail['thanhtien'];
                }
                $ttdh = get_ttdh($order['trangthai']);
                
                echo "<td>" . $totalQuantity . "</td>";
                echo "<td>" . $totalPrice . "</td>";
                echo "<td>" . $ttdh . "</td>";
                echo "</tr>";
            }
            ?>
            <tr>
            <td colspan="3" align="center">
                    <h4>Tổng đơn hàng</h4>
            </td>
              
              <td colspan="2" align="center">
                <h4>
                  <?php
                  // Tính tổng tiền hàng và hiển thị nó
                  $totalOrderPrice = 0;
                  foreach ($orders as $order) {
                      $totalOrderPrice += $order['tongtien'] ;
                  }
                  echo $totalOrderPrice ; 
                  ?>
                  <u>đ</u>
                  </h4> 
              </td>
          </tr>
        </table>
    </div>
</div>

<style>
    .frm {
        width: 90%;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ddd;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .boxtitle {
        font-size: 29px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
        color: red;
    }
    .dh {
        overflow-x: auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 15px;
        text-align: center;
    }

    

</style>


     