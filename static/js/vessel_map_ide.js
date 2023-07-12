patient_name = 0
var menu_count = 10
layui.use(['layer', 'form'], function () {
    var layer = layui.layer,
        form = layui.form,
        $ = layui.$;
    var PCount = 0;
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
    //                   o.appendChild(button);
    //               }
    //               var br=document.createElement("br");
    //               o.appendChild(br);
    //
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

            patient_name = obj.value;

            console.log(patient_name);

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
                    $("#LAO").attr("style", "background:url('" + LAOpictureurl + "') no-repeat;background-size:512px 512px;");
                    $("#RAO").attr("style", "background:url('" + RAOpictureurl + "') no-repeat;background-size:512px 512px;");
                },
                error: function (request) {
                    console.log("未进接口！！！");
                },
            })
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


            // $("#LAO").attr("style","background:url('"+ '../static/json/'+patient_name+'/LAO.png'+"') no-repeat;background-size:512px 512px;");
            // $("#RAO").attr("style","background:url('"+ '../static/json/'+patient_name+'/RAO.png'+"') no-repeat;background-size:512px 512px;");
            PCount++;
            console.log(obj.id);
            patient_name = obj.value;
            console.log(patient_name);
            document.getElementById("LAO").width = 512;
            document.getElementById("LAO").height = 512;
            var cvs = document.getElementById('LAO');
            var ctx = cvs.getContext('2d');
            var angle1 = cvs.id;
            //渲染所有血管
            $.ajax({
                type: 'POST',
                url: window.get_all_vessel_url,
                data: {
                    "patient_name": patient_name,
                    "angle": angle1
                },
                dataType: 'JSON',
                async: false,
                traditional: true,
                success: function (result) {
                    var all_vessel_list = result.all_vessel_list;
                    var postinfor1 = result.postinfor

                    console.log(postinfor1)
                    show_angle1.style.display = 'block';
                    show_angle1.innerHTML = postinfor1;
                    console.log(all_vessel_list);

                    ctx.fillStyle = '#ffffff';
                    all_vessel_list.forEach(function (arr) {
                        console.log(arr.length)
                        console.log(arr)
                        arr.forEach(function (ar) {
                            ctx.fillRect(ar[1], ar[0], 1, 1);
                        })
                    });
                },
                error: function (request) {
                    console.log("未进接口！！！");
                },
            })
            cvs.onmousemove = function (evt) {
                evt = window.event || evt;
                var arcX = Math.abs(evt.offsetX);
                var arcY = Math.abs(evt.offsetY);
                var clientX = Math.abs(evt.clientX);
                var clientY = Math.abs(evt.clientY);
                console.log(arcX, arcY);
                //根据坐标判断并确认如果坐标再血管上传回血管名称和该血管坐标，否则传回name为空字符串
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
                        var name = result.vesselName;
                        if (name == '') {
                            xf.style.display = 'none'
                        } else {
                            xf.style.display = 'block';
                            xf.innerHTML = name;
                        }
                        var otherpoint = result.otherPoint
                        ctx.fillStyle = "#ffffff";
                        otherpoint.forEach(function (arr) {
                            arr.forEach(function (ar) {
                                ctx.fillRect(ar[1], ar[0], 1, 1);
                            })
                        });

                        var singlePointslist = result.pointList;
                        console.log(singlePointslist);
                        ctx.fillStyle = "#ef4136";
                        singlePointslist.forEach(function (arr) {
                            ctx.fillRect(arr[1], arr[0], 1, 1);
                        });


                    },
                    error: function (request) {
                        console.log("未进接口！！！");
                    },

                })
                xf.style.left = clientX + 10 + 'px';
                xf.style.top = clientY + 'px';
            }

            document.getElementById("RAO").width = 512;
            document.getElementById("RAO").height = 512;
            var cvs1 = document.getElementById('RAO');
            var ctx1 = cvs1.getContext('2d');
            var angle2 = cvs1.id;
            //渲染所有血管传回所有坐标
            $.ajax({
                type: 'POST',
                url: window.get_all_vessel_url,
                data: {
                    "patient_name": patient_name,
                    "angle": angle2
                },
                dataType: 'JSON',
                async: false,
                traditional: true,
                success: function (result) {
                    var all_vessel_list_R = result.all_vessel_list;
                    var postinfor2 = result.postinfor
                    console.log(postinfor2)
                    show_angle2.style.display = 'block';
                    show_angle2.innerHTML = postinfor2;
                    console.log(all_vessel_list_R);
                    ctx1.fillStyle = '#ffffff';
                    all_vessel_list_R.forEach(function (arr) {
                        arr.forEach(function (ar) {
                            ctx1.fillRect(ar[1], ar[0], 1, 1);
                        })
                    });
                },
                error: function (request) {
                    console.log("未进接口！！！");
                },
            })
            cvs1.onmousemove = function (evt) {
                evt = window.event || evt;
                var arcX = Math.abs(evt.offsetX);
                var arcY = Math.abs(evt.offsetY);
                var clientX = Math.abs(evt.clientX);
                var clientY = Math.abs(evt.clientY);
                console.log(arcX, arcY);
                xf1.style.display = 'block';
                //根据坐标判断并确认如果坐标再血管上传回血管名称和该血管坐标，否则传回name为空字符串
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
                        var name = result.vesselName;
                        if (name == '') {
                            xf1.style.display = 'none'
                        } else {
                            xf1.style.display = 'block';
                            xf1.innerHTML = name;
                        }
                        var otherpoint = result.otherPoint
                        ctx1.fillStyle = "#ffffff";
                        otherpoint.forEach(function (arr) {
                            arr.forEach(function (ar) {
                                ctx1.fillRect(ar[1], ar[0], 1, 1);
                            })
                        });
                        var singlePointslist = result.pointList;
                        console.log(singlePointslist);
                        ctx1.fillStyle = "#ef4136";
                        singlePointslist.forEach(function (arr) {
                            ctx1.fillRect(arr[1], arr[0], 1, 1);
                        });

                    },
                    error: function (request) {
                        console.log("未进接口！！！");
                    },

                })
                xf1.style.left = clientX + 10 + 'px';
                xf1.style.top = clientY + 'px';
            }
        }
    }
     // 数组截止的条件
function quickSort(arr) {
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
                PCount++;

                document.getElementById("LAO").width = 512;
                document.getElementById("LAO").height = 512;
                var cvs = document.getElementById('LAO');
                var ctx = cvs.getContext('2d');
                var angle1 = cvs.id;
                //渲染所有血管
                $.ajax({
                    type: 'POST',
                    url: window.get_all_vessel_url,
                    data: {
                        "patient_name": patient_name,
                        "angle": angle1
                    },
                    dataType: 'JSON',
                    async: false,
                    traditional: true,
                    success: function (result) {
                        var all_vessel_list = result.all_vessel_list;
                        var postinfor1 = result.postinfor

                        console.log(postinfor1)
                        show_angle1.style.display = 'block';
                        show_angle1.innerHTML = postinfor1;
                        console.log(all_vessel_list);

                        ctx.fillStyle = '#ffffff';
                        all_vessel_list.forEach(function (arr) {
                            console.log(arr.length)
                            console.log(arr)
                            arr.forEach(function (ar) {
                                ctx.fillRect(ar[1], ar[0], 1, 1);
                            })
                        });
                    },
                    error: function (request) {
                        console.log("未进接口！！！");
                    },
                })
                cvs.onmousemove = function (evt) {
                    evt = window.event || evt;
                    var arcX = Math.abs(evt.offsetX);
                    var arcY = Math.abs(evt.offsetY);
                    var clientX = Math.abs(evt.clientX);
                    var clientY = Math.abs(evt.clientY);
                    console.log(arcX, arcY);
                    //根据坐标判断并确认如果坐标再血管上传回血管名称和该血管坐标，否则传回name为空字符串
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
                            var name = result.vesselName;
                            if (name == '') {
                                xf.style.display = 'none'
                            } else {
                                xf.style.display = 'block';
                                xf.innerHTML = name;
                            }
                            var otherpoint = result.otherPoint
                            ctx.fillStyle = "#ffffff";
                            otherpoint.forEach(function (arr) {
                                arr.forEach(function (ar) {
                                    ctx.fillRect(ar[1], ar[0], 1, 1);
                                })
                            });

                            var singlePointslist = result.pointList;
                            console.log(singlePointslist);
                            ctx.fillStyle = "#ef4136";
                            singlePointslist.forEach(function (arr) {
                                ctx.fillRect(arr[1], arr[0], 1, 1);
                            });


                        },
                        error: function (request) {
                            console.log("未进接口！！！");
                        },

                    })
                    xf.style.left = clientX + 10 + 'px';
                    xf.style.top = clientY + 'px';
                }

                document.getElementById("RAO").width = 512;
                document.getElementById("RAO").height = 512;
                var cvs1 = document.getElementById('RAO');
                var ctx1 = cvs1.getContext('2d');
                var angle2 = cvs1.id;
                //渲染所有血管传回所有坐标
                $.ajax({
                    type: 'POST',
                    url: window.get_all_vessel_url,
                    data: {
                        "patient_name": patient_name,
                        "angle": angle2
                    },
                    dataType: 'JSON',
                    async: false,
                    traditional: true,
                    success: function (result) {
                        var all_vessel_list_R = result.all_vessel_list;
                        var postinfor2 = result.postinfor
                        console.log(postinfor2)
                        show_angle2.style.display = 'block';
                        show_angle2.innerHTML = postinfor2;
                        console.log(all_vessel_list_R);
                        ctx1.fillStyle = '#ffffff';
                        all_vessel_list_R.forEach(function (arr) {
                            arr.forEach(function (ar) {
                                ctx1.fillRect(ar[1], ar[0], 1, 1);
                            })
                        });
                    },
                    error: function (request) {
                        console.log("未进接口！！！");
                    },
                })
                cvs1.onmousemove = function (evt) {
                    evt = window.event || evt;
                    var arcX = Math.abs(evt.offsetX);
                    var arcY = Math.abs(evt.offsetY);
                    var clientX = Math.abs(evt.clientX);
                    var clientY = Math.abs(evt.clientY);
                    console.log(arcX, arcY);
                    xf1.style.display = 'block';
                    //根据坐标判断并确认如果坐标再血管上传回血管名称和该血管坐标，否则传回name为空字符串
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
                            var name = result.vesselName;
                            if (name == '') {
                                xf1.style.display = 'none'
                            } else {
                                xf1.style.display = 'block';
                                xf1.innerHTML = name;
                            }
                            var otherpoint = result.otherPoint
                            ctx1.fillStyle = "#ffffff";
                            otherpoint.forEach(function (arr) {
                                arr.forEach(function (ar) {
                                    ctx1.fillRect(ar[1], ar[0], 1, 1);
                                })
                            });
                            var singlePointslist = result.pointList;
                            console.log(singlePointslist);
                            ctx1.fillStyle = "#ef4136";
                            singlePointslist.forEach(function (arr) {
                                ctx1.fillRect(arr[1], arr[0], 1, 1);
                            });

                        },
                        error: function (request) {
                            console.log("未进接口！！！");
                        },

                    })
                    xf1.style.left = clientX + 10 + 'px';
                    xf1.style.top = clientY + 'px';
                }
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
                PCount++;

                document.getElementById("LAO").width = 512;
                document.getElementById("LAO").height = 512;
                var cvs = document.getElementById('LAO');
                var ctx = cvs.getContext('2d');
                var angle1 = cvs.id;
                //渲染所有血管
                $.ajax({
                    type: 'POST',
                    url: window.get_all_vessel_url,
                    data: {
                        "patient_name": patient_name,
                        "angle": angle1
                    },
                    dataType: 'JSON',
                    async: false,
                    traditional: true,
                    success: function (result) {
                        var all_vessel_list = result.all_vessel_list;
                        var postinfor1 = result.postinfor

                        console.log(postinfor1)
                        show_angle1.style.display = 'block';
                        show_angle1.innerHTML = postinfor1;
                        console.log(all_vessel_list);

                        ctx.fillStyle = '#ffffff';
                        all_vessel_list.forEach(function (arr) {
                            console.log(arr.length)
                            console.log(arr)
                            arr.forEach(function (ar) {
                                ctx.fillRect(ar[1], ar[0], 1, 1);
                            })
                        });
                    },
                    error: function (request) {
                        console.log("未进接口！！！");
                    },
                })
                cvs.onmousemove = function (evt) {
                    evt = window.event || evt;
                    var arcX = Math.abs(evt.offsetX);
                    var arcY = Math.abs(evt.offsetY);
                    var clientX = Math.abs(evt.clientX);
                    var clientY = Math.abs(evt.clientY);
                    console.log(arcX, arcY);
                    //根据坐标判断并确认如果坐标再血管上传回血管名称和该血管坐标，否则传回name为空字符串
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
                            var name = result.vesselName;
                            if (name == '') {
                                xf.style.display = 'none'
                            } else {
                                xf.style.display = 'block';
                                xf.innerHTML = name;
                            }
                            var otherpoint = result.otherPoint
                            ctx.fillStyle = "#ffffff";
                            otherpoint.forEach(function (arr) {
                                arr.forEach(function (ar) {
                                    ctx.fillRect(ar[1], ar[0], 1, 1);
                                })
                            });

                            var singlePointslist = result.pointList;
                            console.log(singlePointslist);
                            ctx.fillStyle = "#ef4136";
                            singlePointslist.forEach(function (arr) {
                                ctx.fillRect(arr[1], arr[0], 1, 1);
                            });


                        },
                        error: function (request) {
                            console.log("未进接口！！！");
                        },

                    })
                    xf.style.left = clientX + 10 + 'px';
                    xf.style.top = clientY + 'px';
                }

                document.getElementById("RAO").width = 512;
                document.getElementById("RAO").height = 512;
                var cvs1 = document.getElementById('RAO');
                var ctx1 = cvs1.getContext('2d');
                var angle2 = cvs1.id;
                //渲染所有血管传回所有坐标
                $.ajax({
                    type: 'POST',
                    url: window.get_all_vessel_url,
                    data: {
                        "patient_name": patient_name,
                        "angle": angle2
                    },
                    dataType: 'JSON',
                    async: false,
                    traditional: true,
                    success: function (result) {
                        var all_vessel_list_R = result.all_vessel_list;
                        var postinfor2 = result.postinfor
                        console.log(postinfor2)
                        show_angle2.style.display = 'block';
                        show_angle2.innerHTML = postinfor2;
                        console.log(all_vessel_list_R);
                        ctx1.fillStyle = '#ffffff';
                        all_vessel_list_R.forEach(function (arr) {
                            arr.forEach(function (ar) {
                                ctx1.fillRect(ar[1], ar[0], 1, 1);
                            })
                        });
                    },
                    error: function (request) {
                        console.log("未进接口！！！");
                    },
                })
                cvs1.onmousemove = function (evt) {
                    evt = window.event || evt;
                    var arcX = Math.abs(evt.offsetX);
                    var arcY = Math.abs(evt.offsetY);
                    var clientX = Math.abs(evt.clientX);
                    var clientY = Math.abs(evt.clientY);
                    console.log(arcX, arcY);
                    xf1.style.display = 'block';
                    //根据坐标判断并确认如果坐标再血管上传回血管名称和该血管坐标，否则传回name为空字符串
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
                            var name = result.vesselName;
                            if (name == '') {
                                xf1.style.display = 'none'
                            } else {
                                xf1.style.display = 'block';
                                xf1.innerHTML = name;
                            }
                            var otherpoint = result.otherPoint
                            ctx1.fillStyle = "#ffffff";
                            otherpoint.forEach(function (arr) {
                                arr.forEach(function (ar) {
                                    ctx1.fillRect(ar[1], ar[0], 1, 1);
                                })
                            });
                            var singlePointslist = result.pointList;
                            console.log(singlePointslist);
                            ctx1.fillStyle = "#ef4136";
                            singlePointslist.forEach(function (arr) {
                                ctx1.fillRect(arr[1], arr[0], 1, 1);
                            });

                        },
                        error: function (request) {
                            console.log("未进接口！！！");
                        },

                    })
                    xf1.style.left = clientX + 10 + 'px';
                    xf1.style.top = clientY + 'px';
                }
            },
            error: function (request) {
                console.log("未进接口！！！");
            },
        })

    })


    // function canvasLAO(points) {
    //     document.getElementById("LAO").width = 512
    //     document.getElementById("LAO").height = 512
    //     var cav = document.getElementById('LAO');
    //     var ctx = cav.getContext('2d');
    //     ctx.fillStyle = '#fff'
    //     points.forEach(function(arr){
    //       ctx.fillRect(arr[1],arr[0],1,1);
    //     });
    // }
    //
    // function canvasRAO(options) {
    //     document.getElementById("RAO").width = 512
    //     document.getElementById("RAO").height = 512
    //     var cav = document.getElementById('RAO');
    //     var ctx = cav.getContext('2d');
    //     ctx.fillStyle = '#fff'
    //     options.forEach(function(arr){
    //       ctx.fillRect(arr[1],arr[0],1,1);
    //     });
    // }
})
function clickSaveFav(){
            // Send asynchronous ajax requests and post
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