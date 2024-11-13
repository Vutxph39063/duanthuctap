
<div class="row2">
         <div class="row2 font_title">
          <h1>THÊM MỚI SẢN PHẨM</h1>
         </div>
         <div class="row2 form_content ">
          <form action="index.php?act=addsp" method="POST" enctype="multipart/form-data">
              <div class="row2 mb10 form_content_container">
                  <label> Danh mục </label> <br>
                  <select name="iddm" id="">
<!--                      <option value="">Danh mục 1</option>-->
<!--                      <option value="">Danh mục 2</option>-->
                      <?php
                      foreach ($listdanhmuc as $danhmuc){
                          extract($danhmuc);
                          echo '<option value="'.$id.'">'.$ten.'</option>';
                      }
                      ?>
                  </select>
              </div>
           <div class="row2 mb10 form_content_container">
           <label> Tên sản phẩm </label> <br>
            <input type="text" name="ten" placeholder="nhập vào tên san phẩm">
           </div>
           <div class="row2 mb10">
            <label>Giá niêm yết </label> <br>
            <input type="text" name="gianiemyet" placeholder="nhập vào của sản phẩm">
           </div>
           <div class="row2 mb10">
            <label>Giá bán </label> <br>
            <input type="text" name="giaban" placeholder="nhập vào của sản phẩm">
           </div>
              <div class="row2 mb10">
                  <label>Hình ảnh </label> <br>
                  <input type="file" name="hinh" >
              </div>
              <div class="row2 mb10">
            <label>Số lượng </label> <br>
            <input type="text" name="soluong" placeholder="nhập vào của sản phẩm">
           </div>
              <div class="row2 mb10">
                  <label>Mô tả </label> <br>
                  <textarea name="mota" cols="30" rows="10"></textarea>
              </div>
           <div class="row mb10 ">
         <input class="mr20" name="themmoi" type="submit" value="THÊM MỚI">
         <input  class="mr20" type="reset" value="NHẬP LẠI">

         <a href="index.php?act=listsp"><input  class="mr20" type="button" value="DANH SÁCH"></a>
           </div>
          </form>
         </div>

        </div>