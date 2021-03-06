<!DOCTYPE html>
<html lang="en" >

<head>

    <meta charset="UTF-8">

    <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
    <meta name="apple-mobile-web-app-title" content="CodePen">

    <link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

    <link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />

    <script type="text/javascript" src="js/dark.js"></script>
    <script src="js/cookie.js"></script>




    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>

    <style>

        @font-face {
            font-family: "HelveticaNeueCustom";
            src: url("../font/HelveticaNeue.ttf");
        }

        .date-picker {
            margin: 0 auto;
        }

        .date-picker {
            width: 260px;
            height: auto;
            max-height: 50px;
            background: var(--theme-bg-color);
            position: absolute;
            overflow: hidden;
            transition: all 0.3s 0s ease-in-out;
            border: 1px solid #707070;
            border-radius: 12px;
        }
        .date-picker .input {
            width: 100%;
            height: 50px;
            font-size: 0;
            cursor: pointer;
        }
        .date-picker .input .result, .date-picker .input a {
            display: inline-block;
            vertical-align: top;
        }
        .date-picker .input .result {
            width: calc(100% - 50px);
            height: 50px;
            line-height: 50px;
            font-size: 16px;
            padding: 0 10px;
            color: var(--primary-text);
            box-sizing: border-box;
        }
        .date-picker .input a {
            width: 50px;
            height: 50px;
            background-color: #F8F7FA;
            color: #707070;
            line-height: 50px;
            border: 0;
            font-size: 18px;
            padding: 14px;
            text-align: center;
        }
        .date-picker .input a:hover {
            background-color: #5a87e8;
            color:white;
            cursor: pointer;
        }
        .date-picker .input a:focus {
            outline: 0;
        }
        .date-picker .calendar {
            position: relative;
            width: 100%;
            background: var(--theme-bg-color);
            border-radius: 0px;
            overflow: hidden;
        }
        .date-picker .ui-datepicker-inline {
            position: relative;
            width: 100%;
        }
        .date-picker .ui-datepicker-header {
            height: 100%;
            line-height: 50px;
            background: #5a87e8;
            color: #fff;
            margin-bottom: 10px;
        }
        .date-picker .ui-datepicker-prev, .date-picker .ui-datepicker-next {
            width: 20px;
            height: 20px;
            text-indent: 9999px;
            border: 2px solid #fff;
            border-radius: 100%;
            cursor: pointer;
            overflow: hidden;
            margin-top: 12px;
        }
        .date-picker .ui-datepicker-prev {
            float: left;
            margin-left: 12px;
        }
        .date-picker .ui-datepicker-prev:after {
            transform: rotate(45deg);
            margin: -43px 0px 0px 8px;
        }
        .date-picker .ui-datepicker-next {
            float: right;
            margin-right: 12px;
        }
        .date-picker .ui-datepicker-next:after {
            transform: rotate(-135deg);
            margin: -43px 0px 0px 6px;
        }
        .date-picker .ui-datepicker-prev:after, .date-picker .ui-datepicker-next:after {
            content: "";
            position: absolute;
            display: block;
            width: 4px;
            height: 4px;
            border-left: 2px solid #fff;
            border-bottom: 2px solid #fff;
        }
        .date-picker .ui-datepicker-prev:hover, .date-picker .ui-datepicker-next:hover, .date-picker .ui-datepicker-prev:hover:after, .date-picker .ui-datepicker-next:hover:after {
            border-color: white;

        }

        .date-picker .ui-datepicker-title {
            text-align: center;
        }
        .date-picker .ui-datepicker-calendar {
            width: 100%;
            text-align: center;
        }
        .date-picker .ui-datepicker-calendar thead tr th span {
            display: block;
            width: 100%;
            color: #8392A7;
            margin-bottom: 5px;
            font-size: 13px;
            font-family: HelveticaNeueCustom;
        }
        .date-picker .ui-state-default {
            display: block;
            text-decoration: none;
            color: #b5b5b5;
            line-height: 40px;
            font-size: 12px;
        }
        .date-picker .ui-state-default:hover {
            background: #5a87e8;
        }
        .date-picker .ui-state-highlight {
            color: #68768A;
        }
        .date-picker .ui-state-active {
            color: #ffffff;
            background-color: #5a87e8;
            font-weight: 600;
        }
        .date-picker .ui-datepicker-unselectable .ui-state-default {
            color: #eee;
            border: 2px solid transparent;
        }
        .date-picker.open {
            max-height: 400px;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        }
        .date-picker.open .input a {
            background: #5a87e8;
            color:white;

        }
    </style>

    <script>
        window.console = window.console || function(t) {};
    </script>



    <script>
        if (document.location.search.match(/type=embed/gi)) {
            window.parent.postMessage("resize", "*");
        }
    </script>


</head>

<body translate="no" >

<div class="date-picker">

    <div class="input">
        <div class="result">
            <input name="data" type='text' value="" hidden id="data" required><span></span></div>
        <a><i class="fa fa-calendar"></i></a>
    </div>
    <div class="calendar"></div>
</div>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-8216c69d01441f36c0ea791ae2d4469f0f8ff5326f00ae2d00e4bb7d20e24edb.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script id="rendered-js" >

    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;

    $(function () {
        $(".calendar").datepicker({
            dateFormat: 'yy-mm-dd',
            firstDay: 1,
        maxDate: today });


        $(document).on('click', '.date-picker .input', function (e) {
            var $me = $(this),
                $parent = $me.parents('.date-picker');
            $parent.toggleClass('open');
        });


        $(".calendar").on("change", function () {
            var $me = $(this),
                $selected = $me.val(),
                $parent = $me.parents('.date-picker');

            $parent.toggleClass('open');

            $parent.find('.result').children('span').html($selected);
            $parent.find('.result').children('input').attr("value",$selected);





        });

        var body = document.getElementById("body");
        let name = "darkmode=";
        let decodedCookie = decodeURIComponent(document.cookie);
        let ca = decodedCookie.split(';');
        for(let i = 0; i <ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                // alert(c.substring(name.length, c.length)+" cookie recuperato");

                body.className="dark-mode";
                document.getElementById('darkswitch').setAttribute("checked",true);

                return;
            }
        }

        // alert("cookie non recuperato");
        body.className="light-mode";
    });
    //# sourceURL=pen.js
</script>



</body>

</html>