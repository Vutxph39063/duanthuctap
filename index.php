

<?php
session_start();
if(!isset($_SESSION['mycart'])) $_SESSION['mycart']=[];
ob_start();
 include "model/pdo.php";
 include "model/sanpham.php";
 include "model/danhmuc.php";
 include "model/taikhoan.php";
 include "model/order.php";
 include "model/binhluan.php";


 include "global.php";

include "view/header.php";


$spnew = loadall_sanpham_home();
$dsdm = loadall_danhmuc();
$spnew1 = loadall_sanpham_home1();

if(isset($_GET['act'])&&($_GET['act']!="")){
    $act=$_GET['act'];
    switch($act){
        case "sanphamct": 
            if (isset($_SESSION['user'])){
                $id_user = $_SESSION['user']['id'];
                
                $status_user=load_status_user($id_user);
                
                if(isset($_POST['guibinhluan']) && $status_user=='1'){
                    insert_binhluan($id_user,$_POST['idpro'], $_POST['noidung']);
                }
            }

            
            if (isset($_GET['idsp'])&&($_GET['idsp']>0)){
                // $id=$_GET['idsp'];
                $onesp=loadone_sanpham($_GET['idsp']);
                $sp_cung_loai = loadone_sanpham_cungloai($_GET['idsp'], $onesp['id_danh_muc']);
                $binhluan = loadall_binhluan($_GET['idsp']);
                // $onesp=loadone_sanpham($id);
                // $iddm=$spchitiet['iddm'];
                // $splienquan=load_sanpham_lienquan($iddm,$id,4);
                
                include "view/sanphamct.php";
            }else{
                include "view/home.php";
            }
            break;
        

        case 'sanpham':
            if(isset($_POST['kyw']) && !empty($_POST['kyw'])){
                $kyw = $_POST['kyw'];
            } else {
                $kyw="";
            }
            if(isset($_GET['iddm'])&&($_GET['iddm']>0)){
                $iddm=$_GET['iddm'];
               
            } else {
                $iddm=0;    
            }
            $dssp=loadall_sanpham($kyw,$iddm);
            $tendm = load_ten_dm($iddm);
            include "view/sanpham.php";
            break;

            case 'dangky':
                if(isset($_POST['dangky'])&&($_POST['dangky'])){
                    $email=$_POST['email'];
                    $user=$_POST['user'];
                    $pass=$_POST['pass'];
                    $tel=$_POST['tel'];
                    insert_taikhoan($email, $user, $pass,$tel);
                    $thongbao="Đã đăng ký thành công. Vui lòng đăng nhập!";
                }
                include "view/dangky.php";
                break;

            case 'dangnhap':
                if(isset($_POST['dangnhap'])&&($_POST['dangnhap'])){
                    $user=$_POST['user'];
                    $pass=$_POST['pass'];
                    $checkuser=checkuser($user, $pass);
                    if(is_array($checkuser)){
                        $_SESSION['user']=$checkuser;
                        // $thongbao="Bạn đã đăng nhập thành công!";
                        header('Location: index.php');
                    } else {
                        $thongbao="Tài khoản không tồn tại. Vui lòng kiểm tra hoặc đăng ký!";
                    }
                }
                include "view/dangnhap.php";
                break;

            case 'edit_taikhoan':
                if(isset($_POST['capnhat'])&&($_POST['capnhat'])){
                    $user=$_POST['user'];
                    $pass=$_POST['pass'];
                    $password=$_POST['password'];
                    $email=$_POST['email'];
                    $tel=$_POST['tel'];
                    $id=$_POST['id'];
                    $check=check($user=$_POST['user']);
                    if($check=$pass){
                        update_taikhoan($id, $user, $password, $email, $tel);
                    }
                    //cập nhập lại session 
                    $_SESSION['user']=checkuser($user, $password);
                    header('Location: index.php?act=edit_taikhoan');   
                }
                include "view/edit_taikhoan.php";
                break;

            case 'thoat':
                session_unset();
                header('Location: index.php');
                break;
            case "onlineCheckout":
                if(isset($_GET['thanhtoan'])){

                }
                include "view/thanhtoanmomo.php";
                break;
                    
            case "listCart":
                // Kiểm tra xem giỏ hàng có dữ liệu hay không
                if (!empty($_SESSION['cart'])) {
                    $cart = $_SESSION['cart'];
                    // Tạo mảng chứa ID các sản phẩm trong giỏ hàng
                    $productId = array_column($cart, 'id');
                    // Chuyển đôi mảng id thành một cuỗi để thực hiện truy vấn
                    $idList = implode(',', $productId);
                    // Lấy sản phẩm trong bảng sản phẩm theo id
                    $dataDb = loadone_sanphamCart($idList);
                }
                include "view/listCartOrder.php";
                break;

            case "order":
                if (isset($_SESSION['cart'])) {
                    $cart = $_SESSION['cart'];
                    // print_r($cart);
                    if (isset($_SESSION['user'])){
                        include "view/order.php";
                    if (isset($_POST['order_confirm'])) {
                        $txthoten = $_POST['txthoten'];
                        $txttel = $_POST['txttel'];
                        $txtemail = $_POST['txtemail'];
                        $txtaddress = $_POST['txtaddress'];
                        $pttt = $_POST['pttt'];
                        $ngaydathang=date('h:i:sa d/m/Y');
                        if (isset($_SESSION['user'])) {
                            $id_user = $_SESSION['user']['id'];
                        } else {
                            $id_user = 0;
                        }
                            $idBill = addOrder($id_user, $txthoten, $txttel, $txtemail, $txtaddress, $_SESSION['resultTotal'], $pttt, $ngaydathang);
                            foreach ($cart as $item) {
                                addOrderDetail($idBill, $item['id'], $item['price'], $item['quantity'], $item['price'] * $item['quantity']);
                            }
                                unset($_SESSION['cart']);
                                $_SESSION['success'] = $idBill;
                                header("Location: index.php?act=success");
                        }
                            } else {
                                include "view/unsuccessful.php";
                            }
                        
                            } else {
                                header("Location: index.php?act=listCart");
                            }
                        break;

            case "success":
                if (isset($_SESSION['success'])) {
                    include 'view/success.php';
                    } else {
                        header("Location: index.php");
                    }
                    break;
            
            case "myorder":
                $listorder=loadone_order($_SESSION['user']['id']);
                include "view/myorder.php";
                break;

                     
                }
            ob_end_flush();
        }else{
            include "view/home.php";
        }             
               
include "view/footer.php";


?>