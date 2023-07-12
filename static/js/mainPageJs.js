patient_name = 0
var menu_count = 10
layui.use(['layer', 'form'], function () {

    var layer = layui.layer,
        form = layui.form,
        $ = layui.$;
    var o = document.getElementById("patt");
    // document.getElementById('refresh').onclick = function () {
    //     $(this).attr('disabled',true)
    //     $.ajax({
    //         type: 'POST',
    //         url: window.get_pat_count_url,
    //         data: {
    //         },
    //         dataType: 'JSON',
    //         async: false,
    //         traditional: true,
    //         success: function (result) {
    //               var patcount = result.pat_count;
    //               console.log(patcount)
    //               for(var j=0;j<patcount;j++){
    //                   var button=document.createElement("input");
    //                   button.type='button';
    //                     button.value="patient"+(j+1);
    //                     button.className="layui-btn layui-btn1";
    //                     button.id = "button"+(j+1);
    //                     button.innerHTML="patient"+(j+1);
    //                     button.style.background = '#ef4136'
    //                   o.appendChild(button);
    //               }
    //               var br=document.createElement("br");
    //               o.appendChild(br);

    //
    //         },
    //         error: function (request) {
    //             console.log(request)
    //         }
    //       })
    // }
    function get_patient() {
        $.ajax({
            type: 'POST',
            url: window.get_pat_count_url,
            data: {},
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (e) {


                var patcount = e.pat_count;
                var aa = patcount / menu_count;

                if (parseInt(aa) == aa) {

                } else {
                    aa = parseInt(aa) + 1;
                }


                var box = document.querySelector('#big-box');
                // var ul = document.createElement('ul');
                // ul.className = 'pager';
                // box.append(ul);
                // var li = document.createElement('li');
                // ul.append(li)
                // var a = document.createElement('a');
                // a.href = '#';
                // a.id = '1';
                // a.innerHTML = 'Previous Case';
                // li.append(a);

                for (var i = 0; i < aa; i++) {
                    var div = document.createElement('div');
                    div.className = 'dropdown';
                    div.id = 'drop' + i;
                    box.append(div);

                    var button = document.createElement('button');
                    button.type = 'button';
                    button.className = 'btn dropdown-toggle';
                    button.id = 'dropdownMenu' + i;
                    button.setAttribute('dropdown', 'dropdown');
                    button.innerHTML = 'Case' + (i * menu_count + 1) + '-' + (i * menu_count + menu_count);
                    div.appendChild(button);
                    var span = document.createElement('span');
                    span.className = 'caret';
                    button.append(span);
                    var ul = document.createElement('ul');
                    ul.className = 'dropdown-menu pull-left';
                    ul.role = 'menu';
                    ul.setAttribute('aria-labelledby', 'dropdownMenu1')
                    div.append(ul);



                }
                var div = document.createElement('div');
                    div.className = 'dropdown';
                    div.id = 'drop' + i;
                    div.style="position:absolute;right: 120px"
                    box.append(div);

                    var button = document.createElement('button');
                    button.type = 'button';
                    button.className = 'btn dropdown-toggle';
                    button.id = 'FAVMenu' ;
                    button.style="background-color:#eee;padding:5px 14px;border:1px solid #ddd;border-radius: 15px;font-size: 16px;line-height: 1.1;"
                    button.setAttribute('dropdown', 'dropdown');
                    button.innerHTML = 'Favorite Case';
                    div.appendChild(button);

                    var span = document.createElement('span');
                    span.className = 'caret';
                    button.append(span);
                    var ul = document.createElement('ul');
                    ul.className = 'dropdown-menu pull-left';
                    ul.role = 'menu';
                    ul.id = 'shoucangliebiao';
                    ul.setAttribute('aria-labelledby', 'dropdownMenu1')
                    div.append(ul);
                // var div = document.createElement('div');
                //     div.className = 'dropdown';
                //     div.id = 'drop' + i;
                //     box.append(div);
                //     var FAVMenu = document.getElementById('FAVMenu');
                //     div.appendChild(FAVMenu);
                //
                //     var span = document.createElement('span');
                //     span.className = 'caret';
                //     button.append(span);
                //     var ul = document.createElement('ul');
                //     ul.className = 'dropdown-menu pull-right';
                //     ul.role = 'menu';
                //     ul.id = 'shoucangliebiao';
                //     ul.setAttribute('aria-labelledby', 'dropdownMenu1')
                //     div.append(ul);


                // var ul = document.createElement('ul');
                // ul.className = 'pager';
                // box.append(ul);
                // var li = document.createElement('li');
                // ul.append(li)
                //
                // var aaa = document.createElement('a');
                // aaa.id = '2';
                // aaa.href = '#';
                // aaa.innerHTML = 'Next Case';
                // li.append(aaa);
                //
                // var bbb = document.createElement('a');
                // bbb.id = '3';
                // bbb.href = '#';
                // bbb.innerHTML = 'tips';
                // li.append(bbb);



                var oo = document.querySelectorAll('.dropdown-menu');
                var index = 0;
                for (var i = 0; i < oo.length; i++) {
                    var ul = oo[i];

                    for (var j = 0; j < 10; j++) {
                        var button = document.createElement("input");
                        button.type = 'button';
                        button.value = "Case" + (i * 10 + j + 1);
                        button.className = "layui-btn layui-btn1";
                        button.id = "button" + (i * 10 + j + 1);
                        button.innerHTML = "Case22" + (i * 10 + j + 1);
                        button.style.background = '#ef4136';
                        button.setAttribute('role', 'presentation');
                        ul.appendChild(button);
                        var br = document.createElement('br');
                        ul.appendChild(br);
                        index++;
                        console.log(index);
                        if (index >= patcount)
                            break;

                    }
                }

            }
            ,
            error: function (request) {
                console.log(request)
            }


        });

    }

    get_patient();
    var box = document.querySelector('#big-box');
    for (var u = 0; u < box.children.length - 1; u++) {
        var div = box.children[u];
        div.className = 'dropdown';
        console.log(11111111, div.className);

    }
    for (var u = 0; u < box.children.length; u++) {
        renew_class(u);

    }

    function renew_class(i) {
        var box = document.querySelector('#big-box');
        var div = box.children[i];
        div.addEventListener('click', function () {
            if (div.className === 'dropdown open') {
                div.className = 'dropdown';
            } else if (div.className === 'pager') {
                div.className = 'pager'
            } else {
                div.className = 'dropdown open';
            }
        })
    }


    document.onclick = function () {
        $('#canT').css('display', 'block');
        var obj = event.srcElement;
        if (obj.type == "button" && obj.tagName == 'INPUT') {

            document.getElementById(obj.id).style.background = '#009688';
            console.log(obj.id);
            patient_name = obj.value;
            // var select = document.getElementById('xueguan');
            //
            // console.log(select)
            document.getElementById("LAO").width = 512;
            document.getElementById("LAO").height = 512;
            var canvas = document.getElementById('LAO');
            var ctx = canvas.getContext('2d');
            var angle1 = canvas.id;
            var w = canvas.width;
            var h = canvas.height;

            document.getElementById("RAO").width = 512;
            document.getElementById("RAO").height = 512;
            var canvas2 = document.getElementById('RAO');
            var ctx2 = canvas2.getContext('2d');
            var angle2 = canvas2.id;
            var w2 = canvas2.width;
            var h2 = canvas2.height;


            $.ajax({
                type: 'POST',
                url: window.get_path_url,
                data: {
                    "patient_name": patient_name,
                },
                dataType: 'JSON',
                async: false,
                traditional: true,
                success: function (result) {
                    ctx2.clearRect(0, 0, w2, h2);
                    ctx.clearRect(0, 0, w, h);
                    var LAOpictureurl = result.LAOpictureurl;
                    var RAOpictureurl = result.RAOpictureurl;
                    var LAOjsurl = result.LAOjsurl;
                    var RAOjsurl = result.RAOjsurl;
                    $("#LAO").attr("style", "background:url('" + LAOpictureurl + "') no-repeat;background-size:512px 512px;");
                    $("#RAO").attr("style", "background:url('" + RAOpictureurl + "') no-repeat;background-size:512px 512px;");
                    var fav_status = result.fav_status;
                     var clv2 = document.getElementById("save_favourite");
                    if(fav_status) {
                        clv2.innerHTML = 'Cancel Favorite';
                    }
                    else {
                        clv2.innerHTML = 'Add to my Favorite';
                    }
                },
                error: function (request) {
                    console.log("wrong！！！");
                },
            })

            $.ajax({
                type: 'POST',
                url: window.get_main_angle_url,
                data: {
                    "patient_name": patient_name,
                },
                dataType: 'JSON',
                async: false,
                traditional: true,
                success: function (result) {

                    var postinfor1 = result.postinfor1
                    var postinfor2 = result.postinfor2

                    console.log(postinfor1, postinfor2)

                    show_angle1.style.display = 'block';
                    show_angle1.innerHTML = postinfor1;

                    show_angle2.style.display = 'block';
                    show_angle2.innerHTML = postinfor2;

                },
                error: function (request) {
                    console.log("未进接口！！！");
                },
            })


            console.log(patient_name);
            // $("#LAO").attr("style","background:url('"+ '../static/json/'+patient_name+'/LAO.png'+"') no-repeat;background-size:512px 512px;");
            // $("#RAO").attr("style","background:url('"+ '../static/json/'+patient_name+'/RAO.png'+"') no-repeat;background-size:512px 512px;");
        }
    }
        function quickSort(arr) {
 // 数组截止的条件
  if (arr.length <= 1) {
  	return arr // 递归的出口
  }

   let flag = arr.shift() // 拿到数组的第一个元素作为flag，注意这个时候：数组长度少了一个
   let left = []
   let right = []
   for(let i = 0;i < arr.length; i++) {
   	if (arr[i] > flag) {
  		right.push(arr[i])
  	} else {
  		left.push(arr[i])
  	}
   }
   // return left.concat(flag, right) // 可以观察一下数组的返回结果
  	return quickSort(left).concat(flag, quickSort(right)) // 递归
  }



    $("#FAVMenu").click(function () {
        $.ajax({
            type: 'POST',
            url: window.get_clv,
            data: {
                "patient_name": patient_name,
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {
               var result = quickSort(result)
                var obj =  document.getElementById('shoucangliebiao');
                obj.innerHTML='';

                var oo = document.querySelectorAll('.dropdown-menu');
                var index = 0;
                for (var i = 0; i < result.length; i++) {
                    var ul = oo[3];
                    var button = document.createElement("input");
                    button.type = 'button';
                    button.value = "Case" + result[i];
                    button.className = "layui-btn layui-btn1";
                    button.id = "button" + result[i];
                    button.innerHTML = "Case22" + result[i];
                    button.style.background = '#ef4136';
                    button.setAttribute('role', 'presentation');
                    ul.appendChild(button);
                    var br = document.createElement('br');
                    ul.appendChild(br);

                }
            },
            error: function (request) {
                console.log("未进接口！！！");
            },
        })
        $.ajax({
            type: 'POST',
            url: window.get_main_angle_url,
            data: {
                "patient_name": patient_name,
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {

                var postinfor1 = result.postinfor1
                var postinfor2 = result.postinfor2

                console.log(postinfor1, postinfor2)

                show_angle1.style.display = 'block';
                show_angle1.innerHTML = postinfor1;

                show_angle2.style.display = 'block';
                show_angle2.innerHTML = postinfor2;

            },
            error: function (request) {
                console.log("未进接口！！！");
            },
        })

    })
     $("#3").click(function () {
            var dis = document.getElementById("tip");
            console.log(dis.style.display)

            if(dis.style.display === 'none' )
            {
                dis.style.display = 'block';
            }
            else
            {
                dis.style.display = 'none';
            }

     })

    $("#1").click(function () {
        let previousedpatient_name = patient_name.toString();
        let a = previousedpatient_name.substring(0, 4);
        let b = previousedpatient_name.substring(4, 6);
        let c = parseInt(b) - 1;
        c = c.toString();
        document.getElementById("LAO").width = 512;
        document.getElementById("LAO").height = 512;
        var canvas = document.getElementById('LAO');
        var ctx = canvas.getContext('2d');
        var angle1 = canvas.id;
        var w = canvas.width;
        var h = canvas.height;

        document.getElementById("RAO").width = 512;
        document.getElementById("RAO").height = 512;
        var canvas2 = document.getElementById('RAO');
        var ctx2 = canvas2.getContext('2d');
        var angle2 = canvas2.id;
        var w2 = canvas2.width;
        var h2 = canvas2.height;
        previousedpatient_name = a.concat(c);
        patient_name = previousedpatient_name;
        console.log(previousedpatient_name);




        $.ajax({
            type: 'POST',
            url: window.get_path_url,
            data: {
                "patient_name": patient_name,
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {
                ctx2.clearRect(0, 0, w2, h2);
                ctx.clearRect(0, 0, w, h);
                var LAOpictureurl = result.LAOpictureurl;
                var RAOpictureurl = result.RAOpictureurl;
                var LAOjsurl = result.LAOjsurl;
                var RAOjsurl = result.RAOjsurl;
                $("#LAO").attr("style", "background:url('" + LAOpictureurl + "') no-repeat;background-size:512px 512px;");
                $("#RAO").attr("style", "background:url('" + RAOpictureurl + "') no-repeat;background-size:512px 512px;");
                var fav_status = result.fav_status;
                 var clv2 = document.getElementById("save_favourite");
                if(fav_status) {
                    clv2.innerHTML = 'Cancel Favorite';
                }
                else {
                    clv2.innerHTML = 'Add to my Favorite';
                }
            },
            error: function (request) {
                console.log("未进接口！！！");
            },
        })
        $.ajax({
            type: 'POST',
            url: window.get_main_angle_url,
            data: {
                "patient_name": patient_name,
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {

                var postinfor1 = result.postinfor1
                var postinfor2 = result.postinfor2

                console.log(postinfor1, postinfor2)

                show_angle1.style.display = 'block';
                show_angle1.innerHTML = postinfor1;

                show_angle2.style.display = 'block';
                show_angle2.innerHTML = postinfor2;

            },
            error: function (request) {
                console.log("未进接口！！！");
            },
        })

    })

    $("#2").click(function () {
        let previousedpatient_name = patient_name.toString();
        let a = previousedpatient_name.substring(0, 4);
        let b = previousedpatient_name.substring(4, 6);
        let c = parseInt(b) + 1;
        c = c.toString();
        document.getElementById("LAO").width = 512;
        document.getElementById("LAO").height = 512;
        var canvas = document.getElementById('LAO');
        var ctx = canvas.getContext('2d');
        var angle1 = canvas.id;
        var w = canvas.width;
        var h = canvas.height;

        document.getElementById("RAO").width = 512;
        document.getElementById("RAO").height = 512;
        var canvas2 = document.getElementById('RAO');
        var ctx2 = canvas2.getContext('2d');
        var angle2 = canvas2.id;
        var w2 = canvas2.width;
        var h2 = canvas2.height;
        previousedpatient_name = a.concat(c);
        patient_name = previousedpatient_name;
        console.log(previousedpatient_name);

        $.ajax({
            type: 'POST',
            url: window.get_path_url,
            data: {
                "patient_name": patient_name,
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {
                ctx2.clearRect(0, 0, w2, h2);
                ctx.clearRect(0, 0, w, h);
                var LAOpictureurl = result.LAOpictureurl;
                var RAOpictureurl = result.RAOpictureurl;
                var LAOjsurl = result.LAOjsurl;
                var RAOjsurl = result.RAOjsurl;
                $("#LAO").attr("style", "background:url('" + LAOpictureurl + "') no-repeat;background-size:512px 512px;");
                $("#RAO").attr("style", "background:url('" + RAOpictureurl + "') no-repeat;background-size:512px 512px;");
                var fav_status = result.fav_status;
                 var clv2 = document.getElementById("save_favourite");
                if(fav_status) {
                    clv2.innerHTML = 'Cancel Favorite';
                }
                else {
                    clv2.innerHTML = 'Add to my Favorite';
                }
            },
            error: function (request) {
                console.log("未进接口！！！");
            },
        })
        $.ajax({
            type: 'POST',
            url: window.get_main_angle_url,
            data: {
                "patient_name": patient_name,
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {

                var postinfor1 = result.postinfor1
                var postinfor2 = result.postinfor2

                console.log(postinfor1, postinfor2)

                show_angle1.style.display = 'block';
                show_angle1.innerHTML = postinfor1;

                show_angle2.style.display = 'block';
                show_angle2.innerHTML = postinfor2;

            },
            error: function (request) {
                console.log("未进接口！！！");
            },
        })

    })


    document.getElementById("LAO").width = 512;
    document.getElementById("LAO").height = 512;
    var canvas = document.getElementById('LAO');
    var ctx = canvas.getContext('2d');
    var angle1 = canvas.id;
    var w = canvas.width;
    var h = canvas.height;
    var ar =false;
    var singlePointslist; // Declare container variables externally


    canvas.onmousemove = function (evt) {
        evt = window.event || evt;
        var arcX = Math.abs(evt.offsetX);
        var arcY = Math.abs(evt.offsetY);
        console.log(arcX, arcY);
        $.ajax({
            type: 'POST',
            url: window.map_point_url,
            data: {
                "arcX": arcX,
                "arcY": arcY,
                "patient_name": patient_name,
                "angle": angle1
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {

                ctx.clearRect(0, 0, w, h);
                 singlePointslist = result.pointList;
                console.log(singlePointslist);
                ctx.fillStyle = "#ffffff";
                singlePointslist.forEach(function (arr) {
                    ctx.fillRect(arr[1], arr[0], 1, 1);

                });


            },
            error: function (request) {
                console.log("未进接口！！！");
            },

        })

    }
    canvas.addEventListener('click', function (event) {
    var mouseX = event.offsetX;
    var mouseY = event.offsetY;

    // Traverse Rendered Points
    singlePointslist.forEach(function (arr) {
        // Determine whether the mouse click position is within the range of the current point
        if (mouseX >= arr[1] && mouseX <= arr[1] + 1 && mouseY >= arr[0] && mouseY <= arr[0] + 1){
            ar = true;
             console.log(ar);
        }
    });
});
    // Click to listen for events
       canvas.onmousedown = function (evt) {
        if(ar){
            console.log(ar);

        evt = window.event || evt;
        var arcX = Math.abs(evt.offsetX);
        var arcY = Math.abs(evt.offsetY);
        ar = false;
        $('#xueguan').val('');
        form.render();
        formMode = layer.open({
            title: 'ICAMap',
            type: 1,
            area: ['500px', '500px'],
            content: $('#addForm')
        })
        form.on('submit(formDemo)', function (data) {
            console.log(data.field.xueguan, arcX, arcY);
            var vessel_name = data.field.xueguan;
            var angle = canvas.id;

            $.ajax({
                type: 'POST',
                url: window.get_path_url,
                data: {
                    "patient_name": patient_name,
                },
                dataType: 'JSON',
                async: false,
                traditional: true,
                success: function (result) {
                    var LAOpictureurl = result.LAOpictureurl;
                    var RAOpictureurl = result.RAOpictureurl;
                    var LAOjsurl = result.LAOjsurl;
                    var RAOjsurl = result.RAOjsurl;
                    $("#LAO2").attr("style", "width:512px;height:512px;background:url('" + LAOpictureurl + "') no-repeat;background-size:512px 512px;");

                },
                error: function (request) {
                    console.log("未进接口！！！");
                },
            })

            $.ajax({
                type: 'POST',
                url: window.point_url,
                data: {
                    "arcX": arcX,
                    "arcY": arcY,
                    "vessel_name": vessel_name,
                    "patient_name": patient_name,
                    "angle": angle
                },
                dataType: 'JSON',
                async: false,
                traditional: true,

                success: function (result) {
                    var pointslist = result.pointList
                    console.log(pointslist)
                    namelist = result.namelist
                    layer.open({
                        type: 1,
                        title: 'result',
                        area: ['660px', '660px'],
                        content: $('#addRight'),
                        btn: 'confirm'
                    });
                    // $("#LAO2").attr("style","width:512px;height:512px;background:url('"+ '../static/json/'+patient_name+'/LAO.png'+"') no-repeat;background-size:512px 512px;");
                    document.getElementById("LAO2").width = 512
                    document.getElementById("LAO2").height = 512
                    var cav = document.getElementById('LAO2');
                    var ctx = cav.getContext('2d');
                    ctx.fillStyle = '#fff';
                    pointslist.forEach(function (arr) {
                        ctx.fillRect(arr[1], arr[0], 1, 1);
                    });
                    ctx.arc(arcX, arcY, 3, 0, Math.PI * 2, true);
                    ctx.fillStyle = "#ef4136";
                    ctx.fill();

                    if (result.vesselName == vessel_name) {
                        document.getElementById('bacImg').src = '../static/img/right.png';
                        document.getElementById('spanID').innerText = 'You are right!' + ' The name of this vessel is : ' + result.vesselName;
                        layer.close(formMode);
                    } else {
                        document.getElementById('bacImg').src = '../static/img/error.png';
                        document.getElementById('spanID').innerText = 'Sorry, the name you chose is wrong, please choose again!';
                    }
                },
                error: function (request) {
                    console.log(request)
                }
            })
            //}
            return false;
        })
    }}



    document.getElementById("RAO").width = 512;
    document.getElementById("RAO").height = 512;
    var canvas2 = document.getElementById('RAO');
    var ctx2 = canvas2.getContext('2d');
    var angle2 = canvas2.id;
    var w2 = canvas2.width;
    var singlePointslist1
    var h2 = canvas2.height;
    canvas2.onmousemove = function (evt) {
        evt = window.event || evt;
        var arcX = Math.abs(evt.offsetX);
        var arcY = Math.abs(evt.offsetY);
        console.log(arcX, arcY);
        $.ajax({
            type: 'POST',
            url: window.map_point_url,
            data: {
                "arcX": arcX,
                "arcY": arcY,
                "patient_name": patient_name,
                "angle": angle2
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {

                ctx2.clearRect(0, 0, w2, h2);
                singlePointslist1 = result.pointList;
                console.log(singlePointslist);
                ctx2.fillStyle = "#ffffff";
                singlePointslist1.forEach(function (arr) {
                    ctx2.fillRect(arr[1], arr[0], 1, 1);
                });


            },
            error: function (request) {
                console.log("未进接口！！！");
            },

        })
    }
     canvas2.addEventListener('click', function (event) {
    var mouseX = event.offsetX;
    var mouseY = event.offsetY;

    // 遍历已渲染的点
    singlePointslist1.forEach(function (arr) {
        // 判断鼠标点击位置是否在当前点的范围内
        if (mouseX >= arr[1] && mouseX <= arr[1] + 1 && mouseY >= arr[0] && mouseY <= arr[0] + 1){
            ar = true;
             console.log(ar);
        }
    });
});
    canvas2.onmousedown = function (evt) {
        if (ar) {

            ar = false;
            evt = window.event || evt;
            var arcX = Math.abs(evt.offsetX);
            var arcY = Math.abs(evt.offsetY);
            $('#xueguan').val('');
            form.render();
            formMode = layer.open({
                title: 'ICAMap',
                type: 1,
                area: ['500px', '500px'],
                content: $('#addForm')
            })
            form.on('submit(formDemo)', function (data) {
                console.log(data.field.xueguan, arcX, arcY);
                var vessel_name = data.field.xueguan;
                var angle = canvas2.id
                var point = {"X": arcX, "Y": arcY, "name": vessel_name}

                $.ajax({
                    type: 'POST',
                    url: window.get_path_url,
                    data: {
                        "patient_name": patient_name,
                    },
                    dataType: 'JSON',
                    async: false,
                    traditional: true,
                    success: function (result) {
                        var LAOpictureurl = result.LAOpictureurl;
                        var RAOpictureurl = result.RAOpictureurl;
                        var LAOjsurl = result.LAOjsurl;
                        var RAOjsurl = result.RAOjsurl;
                        $("#LAO2").attr("style", "width:512px;height:512px;background:url('" + RAOpictureurl + "') no-repeat;background-size:512px 512px;");

                    },
                    error: function (request) {
                        console.log("未进接口！！！");
                    },
                })


                $.ajax({
                    type: 'POST',
                    url: window.point_url,
                    data: {
                        "arcX": arcX,
                        "arcY": arcY,
                        "vessel_name": vessel_name,
                        "patient_name": patient_name,
                        "angle": angle
                    },
                    dataType: 'JSON',
                    async: false,
                    traditional: true,
                    success: function (result) {
                        var pointslist = result.pointList
                        console.log(pointslist)
                        namelist = result.namelist
                        layer.open({
                            type: 1,
                            title: 'result',
                            area: ['660px', '660px'],
                            content: $('#addRight'),
                            btn: 'confirm'
                        });
                        // $("#LAO2").attr("style","width:512px;height:512px;background:url('"+ '../static/json/'+patient_name+'/RAO.png'+"') no-repeat;background-size:512px 512px;");
                        document.getElementById("LAO2").width = 512
                        document.getElementById("LAO2").height = 512
                        var cav = document.getElementById('LAO2');
                        var ctx = cav.getContext('2d');
                        ctx.fillStyle = '#fff'
                        pointslist.forEach(function (arr) {
                            ctx.fillRect(arr[1], arr[0], 1, 1);
                        });

                        ctx.arc(arcX, arcY, 3, 0, Math.PI * 2, true);
                        ctx.fillStyle = "#ef4136";
                        ctx.fill();

                        if (result.vesselName == vessel_name) {
                            document.getElementById('bacImg').src = '../static/img/right.png';
                            document.getElementById('spanID').innerText = 'You are right!' + ' The name of this vessel is : ' + result.vesselName;
                            layer.close(formMode);
                        } else {
                            document.getElementById('bacImg').src = '../static/img/error.png';
                            document.getElementById('spanID').innerText = 'Sorry, the name you chose is wrong, please choose again!';
                        }
                    },
                    error: function (request) {
                        console.log(request)
                    }
                })
                return false;
            })
        }
    }
}

)
$('.nav-list li').hover(function () {
    $(this).children('.subnav').css('display', 'block');
}, function () {
    $(this).children('.subnav').css('display', 'none');
});


function addButton(num) {
    var button = document.createElement("button");
    button.innerHTML = "patient" + num;
    return button;
}




// // 模式配置
// const modeOptions = {
//     light: {
//         '--background-color': '#fff',
//         '--box-shadow': '0 1px 8px 0 rgba(0, 0, 0, 0.1)',
//         '--box-shadow-hover': '0 2px 16px 0 rgba(0, 0, 0, 0.2)',
//         '--text-color': '#242424',
//         '--text-color-sub': '#7F7F7F',
//         '--border-color': '#eaecef',
//     },
//     read: {
//         '--background-color': '#f5f5d5',
//         '--box-shadow': '0 1px 8px 0 rgba(0, 0, 0, 0.1)',
//         '--box-shadow-hover': '0 2px 16px 0 rgba(0, 0, 0, 0.2)',
//         '--text-color': '#004050',
//         '--text-color-sub': '#7F7F7F',
//         '--border-color': 'rgba(0, 0, 0, 0.15)',
//     },
//     dark: {
//         '--background-color': '#181818',
//         '--box-shadow': '0 1px 8px 0 rgba(255, 255, 255, .6)',
//         '--box-shadow-hover': '0 2px 16px 0 rgba(255, 255, 255, .7)',
//         '--text-color': 'rgba(255, 255, 255, .8)',
//         '--text-color-sub': '#8B8B8B',
//         '--border-color': 'rgba(255, 255, 255, .3)',
//     }
// }
// // 设置模式
// function setMode(mode) {
//     const rootElement = document.querySelector(':root');
//
//     const options = modeOptions[mode];
//
//     // 遍历设置
//     for (const k in options) {
//         rootElement.style.setProperty(k, options[k]);
//     }
//     rootElement.setAttribute("data-theme", mode);
//     // 当前模式
//     // {#const curMode = document.querySelector('.cur-mode');#}
//     // {#curMode.innerHTML = mode;#}
// }
// // 初始设置为明亮模式
// setMode("light");
//
//
//
// document.querySelector(".btn").addEventListener("click", (e) => {
//     setMode(e.target.getAttribute("mode"));
//     var Mode = document.cookie.split(";")
//     console.log(Mode)
// })
function clickSaveFav(){
            // 发送异步ajax请求，发送post
console.log(patient_name)
            $.ajax({
                type: "post",
                url: window.web_favourite_handle,
                data: {
                    "patient_name": patient_name,
                },
                dataType: 'JSON',
                async: false,
                traditional: true,
                success: function (result) {
                     var fav_status = result.fav_status;
                     var clv2 = document.getElementById("save_favourite");
                    if(fav_status) {
                        clv2.innerHTML = 'Cancel Favorite';
                    }
                    else {
                        clv2.innerHTML = 'Add to my Favorite';
                    }

                }
            })
        }




 const hintsBtn = document.getElementById('hintsBtn');
  const hintsBtn2 = document.getElementById('hintsBtn2');
  const hintPopup = document.getElementById('hintPopup');
  const hintContent = document.getElementById('hintContent');
 const nextHintBtn = document.getElementById('nextHintBtn');
   const closeHintBtn = document.getElementById('closeHintBtn');
  //An array of prompt content, with each button corresponding to an array
  const hints1 = [
    "\n" +
    "LAO/CRA:\n1.LAD is the left-most vessel in LAO/CRA\n2.LAD should travel “straight” down in this view\n3.LAD touches the apex (tip of the heart)\n",
    "LAO/CAU:\n1.Watch the LAD travel “upwards”\n2.LCx should travel “downwards” and to the “right” of the LAD\n",

  ];

  const hints2 = [
    "RAO/CRA1.LAD is the left-most vessel in RAO/CRA\n2.LAD should travel to the apex at ~ 45 degree angle \n3.LCx appears overlapped with LAD\n",
    "RAO/CAU:1.LCx is the left-most vessel in RAO/CAU2.LCx makes a cuve in the shape of a “C”3.LAD travels “above” and to the “right” of the LCx 4.LAD touches the apex (tip of the heart)\n",

  ];

  let currentHintIndex = 0;
  let currentButton = null;

  //

// Display prompt content
  function showHint() {
    let hints = [];
    if (currentButton === hintsBtn) {
      hints = hints1;
    } else if (currentButton === hintsBtn2) {
      hints = hints2;
    }

    if (currentHintIndex >= hints.length) {
      hintContent.textContent = "No more hints available";
     nextHintBtn.style.display = 'none';
        closeHintBtn.style.display = 'block';

    } else {
      hintContent.textContent = hints[currentHintIndex];
    }

    // Show pop-up window
    hintPopup.classList.remove('hidden');
  }

  //
// Show next prompt
  function showNextHint() {
    currentHintIndex++;
    showHint();
  }

  // Close pop-up window
  function closeHintPopup() {
    hintPopup.classList.add('hidden');
    currentHintIndex = 0;
    nextHintBtn.style.display = 'block';
    closeHintBtn.style.display = 'none';
  }

  // First button click event
  hintsBtn.addEventListener('click', function() {
    currentButton = hintsBtn;
    showHint();
  });

  // Second button click event
  hintsBtn2.addEventListener('click', function() {
    currentButton = hintsBtn2;
    showHint();
  });

  // Next prompt button click event
  nextHintBtn.addEventListener('click', function() {
    showNextHint();
  });

  // Close button click event
  closeHintBtn.addEventListener('click', function() {
    closeHintPopup();
  });