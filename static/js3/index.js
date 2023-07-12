$(function () {
    var speed1 = 4000;
    var speed2 = 2000;
    var i = 0;
    /*假装自己很智能，自动获取一下，在后面left值移动时就可以用它了*/
    var imgHeight = $(".tupian img").height() + 10;
    var clone = $(".tupian img").first().clone(true);
    /*copy 第一张的照片并且添加到最后已达到无缝对接的效果*/
    $(".tupian").append(clone);


    /*get 所有li的个数,只有length才是属性*/
    var size = $(".tupian img").length;
    // console.log(size);


    /*step 1:  */
    //一开始循环添加按钮
    //为什么要size - 1？因为最后一张图片只是作一个过渡效果我们显示的始终还是4张图片
    //所以添加按钮的时候我们也应该添加4个按钮
    for (var j = 0; j < size - 1; j++) {
        $(".nav_img").append("<span></span>");
    }

    $(".nav_img span").eq(i).addClass("onclick");


    /*step 2:  */

    /*step 3：*/
    //按钮指示器鼠标移出移入事件
    $(".nav_img span").hover(function () {
        i = $(this).index();
        clearInterval(timer);
        $(".tupian").stop().animate({
            top: -i * imgHeight
        });
        $(this).addClass("onclick").siblings().removeClass("onclick");

    }, function () {
        timer = setInterval(function () {
            toBottom();
        }, speed1)
    });

    //两个方向按钮鼠标移出移入事件
    // $("#button-left,#button-right").mouseenter(function () {
    //     clearInterval(timer);
    // }).mouseleave(function () {
    //     timer = setInterval(function () {
    //         toRight();
    //     },2000);
    // });

    //定时器,注意，这里是最开始启动的，所以呢，这里不设值，会导致页面开始刷新出现错误。
    var timer = setInterval(function () {
        toBottom();
    }, speed1);


    /*step 2-2*/
    //左按钮实现的函数

    /*step2-2:*/
    //右按钮的实现函数
    function toBottom() {
        i++;
        /*当前图片为最后一张图片的时候（我们一开始复制并且添加到ul最后面的图片）
        并且再点击了一次左按钮，这时候我们就利用css的快速转换效果把ul移动第一张图片的位置
        并且第二张图片滑入达到无缝效果（css的变换效果很快我们肉眼是很难看见的）*/
        if (i == size) {
            // console.log("qq");
            $(".tupian").css({
                top: 0
            });
            i = 1;
        }

        $(".tupian").stop().animate({
            top: -i * imgHeight
        }, speed2);

        //设置下面指示器的颜色索引
        if (i == size - 1) {
            $(".nav_img span").eq(0).addClass("onclick").siblings().removeClass("onclick");

        } else {
            $(".nav_img span").eq(i).addClass("onclick").siblings().removeClass("onclick");
        }
    }

    // 用户名
    $(".username").click(function () {

        $(this).parent().find("ul").toggleClass("hide1");

    });
    $(".user .login").click(function () {
        $(this).toggleClass("hide2").siblings(".user_set").toggleClass("z_index").find(".username").toggleClass("hide2");
    });
    $('.user_set ul li').eq(3).click(function () {
        $(this).parent("ul").toggleClass("hide1");
        $(".user .login").toggleClass("hide2").siblings(".user_set").toggleClass("z_index").find(".username").toggleClass("hide2");

    });

    $(".text .tousu").click(function () {
        $(".text .tousu a").toggleClass("hide1");
    });


    $(".comment_pet").click(function () {
        // alert("11");
        $(this).parent().parent().siblings(".comment").stop().slideToggle(200);
    });
    $(".comment_btn_pet").click(function () {
        // alert("11");
        var con = $(this).siblings(".comment_inp_pet").val();
        if(con!='')
        {
            let li= $("<li></li>");
            let div=$("<div class='user_name'><img src='images/head.jpg' alt=''><h6>从小就很帅&nbsp;:</h6><p class='comment_text_pet'></p></div>");
            let h5=$("<h5><a href='#'>回复</a><a href='#'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i>&nbsp;117</a></h5>");
            li.append(div);
            li.append(h5);
        // console.log(li);
            console.log(li.find(".comment_text_pet").text(con));
            $(this).parent().siblings("ul").append(li);
        }
        else {
            alert("评论内容不能为空");
        }
        // console.log(con);
        
    });
    $(".con_nav ul li").click(function(){
        $(this).addClass("comment_checked").siblings("li").removeClass("comment_checked");
    });


});
$(window).scroll(function () {
    //获取滚动条的滑动距离
    var scroH = $(this).scrollTop();
    //滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
    if (scroH > 0) {
        $("#header1").addClass("toggleColor");
        $("a").addClass("black");
        $(".login a").addClass("b_gray");
        $(".setup a").addClass("b_gray");
        $(".username").css("color", "#000");
        $(".user_set ul").css({
            color: "#000",
            background: "#fff"
        });
    }
    if (scroH == 0) {
        $("#header1").removeClass("toggleColor");
        $("a").removeClass("black");
        $(".login a").removeClass("b_gray");
        $(".setup a").removeClass("b_gray");
        $(".username").css("color", "#fff");
        $(".user_set ul").css({
            color: "#f7f7f7",
            background: "#00000003"
        });
    }
});