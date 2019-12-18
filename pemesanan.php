<!DOCTYPE html>
<html lang="en">
<?php include 'config/connection.php' ?>
<?php
$id_user = $_GET["id_user"];
$id_paket = $_GET["id_paket"];
$query = "SELECT * FROM paket WHERE id_paket = $id_paket";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_assoc($result);


$nz_time = new DateTime(null, new DateTimezone('Asia/Jakarta'));
// echo $nz_time->format('d-m-Y');

$dateNow = $nz_time->format('d-m-Y');
$query2 = "SELECT * FROM pemesanan WHERE DATE(tgl_kembali) > DATE(NOW())";
$result2 = mysqli_query($con, $query2);
// $pemesanan = mysqli_fetch_assoc($result2);

?>
<?php include 'includes/head.php' ?>

<body>
    <?php include 'includes/navbar.php' ?>
    <div class="container mt-5 pt-5 mb-5">
        <div class="row">
            <div class="col-md-7">
                <div class="row">
                    <div class="col">
                        <h1><?php echo $row["nama_paket"] ?></h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <img style="max-width:500px" src="foto/<?php echo $row["foto"] ?>" alt="" srcset="">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <br>
                        <h3 style="color:purple">Harga : Rp.<?php echo $row["harga"] ?>,-</h3>
                        <p>Lama Pengerjaan : <?php echo $row["lama"] ?> Hari</p>
                        <p>Detail : <?php echo $row["Detail"] ?></p>
                    </div>
                </div>
            </div>
            <div class="col-md-5 bg-ungu rounded">
                <form action="proses/proses_pemesanan.php" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="MAX_FILE_SIZE" value="2000000">
                    <input type="hidden" name="id_user" value="<?php echo $id_user ?>">
                    <input type="hidden" name="id_paket" value="<?php echo $id_paket ?>">
                    <input type="hidden" name="tanggal" value="<?php echo date('Y-m-d') ?>">
                    <h4 class="text-center">Pesanan Anda</h4>
                    <div class="row">
                        <div class="col-sm-12">
                            <label for="my-input">Gambar Referensi (Jika Ada)</label>
                            <input type="file" name="file" for="file" class="form-control">
                        </div>
                        <div class="col-sm-12">
                        <label for="my-input">Jenis Pesanan</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="jenis" id="inlineRadio1" value="softfile">
                                <label class="form-check-label" for="inlineRadio1">Softfile</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="jenis" id="inlineRadio2" value="hardfile">
                                <label class="form-check-label" for="inlineRadio2">Hardfile</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="jenis" id="inlineRadio3" value="hardfile+pigura">
                                <label class="form-check-label" for="inlineRadio3">Hardfile(Dengan Pigura 10R)</label>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <label for="catatan">Catatan</label>
                            <textarea rows="12" class="form-control" type="text" value="" id="catatan" placeholder="Masukkan Catatan" name="catatan"></textarea>
                        </div>
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-block btn-primary">Pesan</button>
                            <button type="reset" class="btn btn-block btn-danger">Reset</button>
                        </div>
                    </div>
                    <div class="form-group row">

                    </div>
                </form>
            </div>
        </div>
    </div>

    <?php include 'includes/footer.php' ?>
    <?php include 'includes/scripts.php' ?>
</body>

</html>