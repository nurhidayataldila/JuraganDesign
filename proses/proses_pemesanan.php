<?php  
    session_start();
    include('../config/connection.php');

    $jenis = $_POST["jenis"];
    $catatan = $_POST["catatan"];
    $id_user = $_POST["id_user"];
    $id_paket = $_POST["id_paket"];
    $tanggal = $_POST["tanggal"];

    $code = $_FILES['file']['error'];
    if ($code === 0) {     

        $destination_path = getcwd();

        $error = "";
        $nama_folder = "referensi";
        $tmp = $_FILES['file']['tmp_name'];
        $nama_file = $_FILES['file']['name'];
        $path = $destination_path . "\\..\\$nama_folder\\$nama_file";

        if (file_exists($path)) {
            $error = urldecode("File dengan nama yang sama sudah tersimpan, coba lagi");
            header("Location:../paket.php?error=$error");
        }

        $ukuran = $_FILES['file']['size'];
        if ($ukuran > 2000000) {
            $error = urldecode("Ukuran melebihi 2 MB");
            header("Location:../paket.php?error=$error");
        }

        $tipe_file = array('image/jpeg', 'image/gif', 'image/png');
        if (!in_array($_FILES['file']['type'], $tipe_file)) {
            $error = urldecode("Cek Kembali Ekstensi File Anda (*jpeg, *jpg, *gif, *png)");
            header("Location:../paket.php?error=$error");
        }

        if(move_uploaded_file($tmp, $path)) {

            $sql = "INSERT INTO pemesanan (catatan,id_paket,user_id,jenis,referensi,tgl_pesan)
            VALUES ('$catatan','$id_paket','$id_user','$jenis','$nama_file','$tanggal')";

            if (mysqli_query($con, $sql)) {
                header("Location:../status2.php");
            } else {
                $error = urldecode("Data tidak berhasil ditambahakan");
                header("Location:../paket.php?error=$error");
            }
        }
    } else {
        $error = urldecode("Foto tidak berhasil terupload");
        header("Location:../paket.php?error=$error");
    }
    mysqli_close($con);
?>