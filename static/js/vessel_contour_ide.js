patient_name = 0
layui.use(['layer', 'form'], function () {
    var layer = layui.layer,
        form = layui.form,
        $ = layui.$;
    var PCount = 0;
    var o=document.getElementById("patt");
    document.getElementById('refresh').onclick = function () {
        $(this).attr('disabled',true);
        $.ajax({
            type: 'POST',
            url: window.get_pat_count_url,
            data: {
            },
            dataType: 'JSON',
            async: false,
            traditional: true,
            success: function (result) {
                  var patcount = result.pat_count;
                  console.log(patcount)
                  for(var j=0;j<patcount;j++){
                      var button=document.createElement("input");
                      button.type='button';
                        button.value="patient"+(j+1);
                        button.className="layui-btn layui-btn1";
                        button.id = "button"+(j+1);
                        button.innerHTML="patient"+(j+1);
                      o.appendChild(button);
                  }
                  var br=document.createElement("br");
                  o.appendChild(br);


            },
            error: function (request) {
                console.log(request)
            }
          })
    }
    document.onclick = function () {
        $('#canT').css('display', 'block');
        var obj = event.srcElement;
        if (obj.type == "button") {
            document.getElementById(obj.id).style.background = '#009688';
            patient_name = obj.value;



             $.ajax({
                type:'POST',
                url:window.get_path_url,
                data:{
                    "patient_name":patient_name,
                },
                dataType:'JSON',
                async: false,
                traditional: true,
                success:function(result){
                    var LAOpictureurl = result.LAOpictureurl;
                    var RAOpictureurl = result.RAOpictureurl;
                    var LAOjsurl = result.LAOjsurl;
                    var RAOjsurl = result.RAOjsurl;
                     $("#LAO").attr("style","background:url('"+ LAOpictureurl+"') no-repeat;background-size:512px 512px;");
                    $("#RAO").attr("style","background:url('"+ RAOpictureurl+"') no-repeat;background-size:512px 512px;");



                },
                error: function (request) {
                   console.log("未进接口！！！");
                 },
            })


            console.log(patient_name);
            // $("#LAO").attr("style", "background:url('" + '../static/json/' + patient_name + '/2.png' + "') no-repeat;background-size:512px 512px;");
            // $("#RAO").attr("style", "background:url('" + '../static/json/' + patient_name + '/RAO.png' + "') no-repeat;background-size:512px 512px;");
            PCount++;
            console.log(obj.id);
            patient_name = obj.value;
            console.log(patient_name);
            $.ajax({
                type: 'POST',
                url: window.get_length,
                data: {
                    "patient_name": patient_name
                },
                dataType: 'JSON',
                async: false,
                traditional: true,
                success: function (result) {
                    //imgCount为图片数量
                    console.log(result)
                    var imgCount = result.length;
                    var vessel_name = result.name;
                    console.log(vessel_name.length)
                    var index = 0;
                    $.ajax({
                        type: 'GET',
                        url: window.get_vessel,
                        data: {
                            "patient_name": patient_name,
                            "vessel_name": vessel_name[index]
                        },
                        dataType: 'JSON',
                        async: false,
                        traditional: true,
                        success: function (result) {
                            var LAO_Pointlist = result.LAO_pointlist;
                            var RAO_Pointlist = result.RAO_pointlist;

                            console.log(LAO_Pointlist)
                            console.log(RAO_Pointlist)

                            canvasLAO(LAO_Pointlist);
                            canvasRAO(RAO_Pointlist);
                            // document.getElementById("LAO").width = 512
                            // document.getElementById("LAO").height = 512
                            // var cav = document.getElementById('LAO');
                            // var ctx = cav.getContext('2d');
                            // ctx.fillStyle = '#fff'
                            // LAO_Pointlist.forEach(function(arr){
                            //   ctx.fillRect(arr[1],arr[0],1,1);
                            // });

                            // document.getElementById("RAO").width = 512
                            // document.getElementById("RAO").height = 512
                            // var cav2 = document.getElementById('RAO');
                            // var ctx2 = cav2.getContext('2d');
                            // ctx2.fillStyle = '#fff'
                            // RAO_Pointlist.forEach(function(arr){
                            //   ctx.fillRect(arr[1],arr[0],1,1);
                            // });
                        }
                    })

                    $('#xueguan').val('');
                    form.render();
                    formMode = layer.open({
                        title: 'ICAMap',
                        type: 1,
                        skin: 'myskin',
                        area: ['500px', '300px'],
                        content: $('#addForm'),
                        offset: ['100px', '1350px']
                    })
                    // if (PCount > 1){
                    //      document.getElementsByClassName('xuan').remove();
                    // }
                    if (PCount > 1) {
                        document.getElementById('xueguan').options.length = 1;
                    }
                    var add = document.getElementById('xueguan');
                    //result.data.length是存放选项数据的数组长度
                    for (var j = 0; j < vessel_name.length; j++) {
                        var option = document.createElement('option');
                        option.className = 'xuan';
                        option.value = vessel_name[j];
                        option.innerText = vessel_name[j];
                        add.append(option);
                        layui.form.render('select');
                    }
                    form.on('submit(formDemo)', function (data) {
                        var vesselName = data.field.xueguan;
                        if (vesselName == vessel_name[index]) {
                            layer.msg('<span style="color: white">You are right!<span/>');
                            layer.close(formMode);
                        } else {
                            layer.msg('<span style="color: white">Wrong answer, correct answer:' + vessel_name[index] + '</span>');
                            layer.close(formMode);
                        }

                        return false;
                    })
                    document.getElementById('next').onclick = function () {
                        var cvL = document.getElementById('LAO');
                        var cvLT = cvL.getContext('2d');
                        cvLT.clearRect(0, 0, cvL.width, cvL.height);
                        var cvR = document.getElementById('RAO');
                        var cvRT = cvR.getContext('2d');
                        cvRT.clearRect(0, 0, cvL.width, cvL.height);
                        index++;
                        if (index < vessel_name.length) {
                            $.ajax({
                                type: 'GET',
                                url: window.get_vessel,
                                data: {
                                    "patient_name": patient_name,
                                    "vessel_name": vessel_name[index]
                                },
                                dataType: 'JSON',
                                async: false,
                                traditional: true,
                                success: function (result) {
                                    var LAO_Pointlist = result.LAO_pointlist;
                                    var RAO_Pointlist = result.RAO_pointlist;

                                    console.log(LAO_Pointlist)
                                    console.log(RAO_Pointlist)

                                    canvasLAO(LAO_Pointlist);
                                    canvasRAO(RAO_Pointlist);
                                    // document.getElementById("LAO").width = 512
                                    // document.getElementById("LAO").height = 512
                                    // var cav = document.getElementById('LAO');
                                    // var ctx = cav.getContext('2d');
                                    // ctx.fillStyle = '#fff'
                                    // LAO_Pointlist.forEach(function(arr){
                                    //   ctx.fillRect(arr[1],arr[0],1,1);
                                    // });

                                    // document.getElementById("RAO").width = 512
                                    // document.getElementById("RAO").height = 512
                                    // var cav2 = document.getElementById('RAO');
                                    // var ctx2 = cav2.getContext('2d');
                                    // ctx2.fillStyle = '#fff'
                                    // RAO_Pointlist.forEach(function(arr){
                                    //   ctx.fillRect(arr[1],arr[0],1,1);
                                    // });
                                }
                            })
                            $('#xueguan').val('');
                            form.render();
                            formMode = layer.open({
                                title: 'ICAMap',
                                type: 1,
                                skin: 'myskin',
                                area: ['500px', '300px'],
                                content: $('#addForm'),
                                offset: ['100px', '1350px']
                            })
                        } else {
                            layer.msg('<span style="color: white">You have answered all the questions!</span>');

                            $.ajax({
                                type: 'GET',
                                url: window.get_vessel,
                                data: {
                                    "patient_name": patient_name,
                                    "vessel_name": vessel_name[0]
                                },
                                dataType: 'JSON',
                                async: false,
                                traditional: true,
                                success: function (result) {
                                    var LAO_Pointlist = result.LAO_pointlist;
                                    var RAO_Pointlist = result.RAO_pointlist;

                                    console.log(LAO_Pointlist)
                                    console.log(RAO_Pointlist)

                                    canvasLAO(LAO_Pointlist);
                                    canvasRAO(RAO_Pointlist);
                                }
                            })
                        }
                    }
                }
            })
        }
    }

    function canvasLAO(points) {
        document.getElementById("LAO").width = 512
        document.getElementById("LAO").height = 512
        var cav = document.getElementById('LAO');
        var ctx = cav.getContext('2d');
        ctx.fillStyle = '#fff'
        points.forEach(function (arr) {
            ctx.fillRect(arr[1], arr[0], 1, 1);
        });
    }

    function canvasRAO(options) {
        document.getElementById("RAO").width = 512
        document.getElementById("RAO").height = 512
        var cav = document.getElementById('RAO');
        var ctx = cav.getContext('2d');
        ctx.fillStyle = '#fff'
        options.forEach(function (arr) {
            ctx.fillRect(arr[1], arr[0], 1, 1);
        });
    }
})
