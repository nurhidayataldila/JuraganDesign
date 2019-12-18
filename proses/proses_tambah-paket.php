<?php
    session_start();
    include('../config/connection.php');
    
    $nama = $_POST["nama"];
    $harga = $_POST["harga"];
    $lama = $_POST["lama"];
    $detail = $_POST["detail"];
    $code = $_FILES['file']['error'];
    if ($code === 0) {     

        $destination_path = getcwd();

        $error = "";
        $nama_folder = "foto";
        $tmp = $_FILES['file']['tmp_name'];
        $nama_file = $_FILES['file']['name'];
        $path = $destination_path . "\\..\\$nama_folder\\$nama_file";

        if (file_exists($path)) {
            $error = urldecode("File dengan nama yang sama sudah tersimpan, coba lagi");
            header("Location:../tambah-paket.php?error=$error");
        }

        $ukuran = $_FILES['file']['size'];
        if ($ukuran > 2000000) {
            $error = urldecode("Ukuran melebihi 2 MB");
            header("Location:../tambah-paket.php?error=$error");
        }

        $tipe_file = array('image/jpeg', 'image/gif', 'image/png');
        if (!in_array($_FILES['file']['type'], $tipe_file)) {
            $error = urldecode("Cek Kembali Ekstensi File Anda (*jpeg, *jpg, *gif, *png)");
            header("Location:../tambah-paket.php?error=$error");
        }

        if(move_uploaded_file($tmp, $path)) {
            $sql = "INSERT INTO paket (nama_paket,harga,foto,lama,Detail) 
            VALUES ('$nama', '$harga', '$nama_file', '$lama', '$detail')";

            if (mysqli_query($con, $sql)) {
                header("Location:../admin-paket.php");
            } else {
                $error = urldecode("Data tidak berhasil ditambahakan");
                header("Location:../tambah-paket.php?error=$error");
            }
        }
    } else {
        $error = urldecode("Foto tidak berhasil terupload");
        header("Location:../tambah-paket.php?error=$error");
    }
    mysqli_close($con);
?>