<select class="input" name="barang" required>
                        <option value="">~ Pilih barang ~</option>
                            <?php 
                                    $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_status = 1 ORDER BY product_id DESC");
                                if(mysqli_num_rows($produk) > 0){
                                    while($p = mysqli_fetch_array($produk)){
                            ?>
                                <!-- <a href="produk.php?id=<?php echo $p['product_id']?>"> -->
                                    <!-- <div class="col-2"> -->
                                    <option value="<?php echo $p['product_name']?>" data-harga="<?= $p['product_price'] ?>"><?php echo $p['product_name']?></option>
                                    <!-- </div> -->
                                <!-- </a> -->
                            <?php }}?>
                        </select>
                        <input type="number" name="jumlah" placeholder="Jumlah Barang" class="input">
                        <input type="number" name="harga" placeholder="Harga" readonly class="input" value="Rp.<?php echo number_format($p['product_price'])?>">