<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
  <style>

  .container1 {
    border: 2px solid #dedede;
    background-color: #f1f1f1;
    border-radius: 5px;
    padding: 10px;
    margin: 5px 0;
    font-size:12px;
  }

  .darker {
    border-color: #ccc;
    background-color: #ddd;
  }

  .container1::after {
    content: "";
    clear: both;
    display: table;
  }

  .container1 img {
    float: left;
    max-width: 50px;
    width: 100%;
    margin-right: 20px;
    border-radius: 50%;
  }

  .container1 img.right {
    float: right;
    margin-left: 20px;
    margin-right:0;
  }

  .time-right {
    float: right;
    color: #aaa;
  }

  .time-left {
    float: left;
    color: #999;
  }

  div.sticky {
    position: -webkit-sticky;
    position: sticky;
    bottom: 0;
    background-color: #ddd;
    padding: 10px 10px 0 10px;
    font-size: 20px;
  }
  #square {
    right: 0;
    z-index: 1;
    position:fixed;
    height: 400px;
    width: 300px;
    padding: 0px 8px;
    background-color: #fff;
    border: 2px solid #DDD;
    overflow: scroll;
    margin-top: 140px;
    animation: fade-in 1s;
  }
  .openChat {
    font-size: 16px;
    z-index: 1;
    cursor: pointer;
    margin-top: 160px;
    background: #000;
    border-radius: 10px;
    padding: 10px;
    color: #ff8300;
    right: 40px;
    bottom: 30px;
    position: fixed;
  }
  .txtHelp {
    color: #C4C4C4;
    font-style: italic;
    text-align: center;
    padding-top: 120px;
  }
</style>
</head>
<body>
  <div id="opened" style="display: none;">
    <span id="ref">
      <div id="square">
        <div style="min-height: 315px;">
        <?php
        $query="select * from chats WHERE tag = '$username' ORDER by date DESC";
        $res=mysqli_query($con,$query);
        if (mysqli_num_rows($res) == "0") {
        ?>
        <div class="txtHelp">
        Ask Something<Br>
        ex : Pembayaran, harga, kualitas, order, dll.
        </div>
        <?php
        } else {
        while($data=mysqli_fetch_array($res)){
          $user=$data['user'];
          $chatbot=$data['chatbot'];
          $date=$data['date'];
          ?>

            <div class="container1" style="margin-right: 70px;margin-left: 10px;">
            <i><b><u><span style="text-transform:capitalize;"><?php echo $username;?> (You) : </span></u></b></i><br>
              <!-- <img src="user/user.jpg" alt="Avatar" style="width:100%;"> -->
              <span id="message"><?php echo $user;?></span><br>
              <span class="time-right"><?php echo $date;?></span>
            </div>

            <div class="container1 darker" style="margin-left: 70px; margin-right: 10px;">
            <i><b><u>Coprobot :</u></b></i><br>
              <!-- <img src="user/chatbot.png" alt="Avatar" class="right" style="width:100%;"> -->
              <span><?php echo $chatbot;?></span><br>
              <span class="time-left"><?php echo $date;?></span>
            </div>

        <?php }} ?>
        </div>
        <div class="sticky">
          <div class="row">
            <div class="col-md-12">
              <div class="input-group mb-3">
                <input type="text" class="form-control" id="msg">
                <div class="input-group-append">
                  <button class="btn-primary btn-outline-primary" style="color:#FFF; font-size: 12px;" type="button" onclick="send()">Send</button>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </span>
  </div>
  <span class="openChat" onclick="openNav()"><img src="chatbot/chat.png" width="25"> &nbsp;Chat with JD</span>
  <br/>

  <script type="text/javascript">
  function send(){
    var text=$('#msg').val().toLowerCase();

    $.ajax({
      type:"post",
      url:"chatbot/mysearch.php",
      data:{text:text},
      success:function(data){
        //alert(data);
        $('#ref').load(' #ref');
      }
    });
  }
</script>

<script>

function openNav() {
  var x = document.getElementById('opened');
  if (x.style.display === 'none') {
    x.style.display = 'block';
  } else {
    x.style.display = 'none';
  }
}
</script>

</body>
</html>
