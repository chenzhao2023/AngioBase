patient_name = 0
var menu_count = 10
layui.use(['layer','form'],function () {
    var layer = layui.layer,
        form = layui.form,
        $ = layui.$;
    var o=document.getElementById("patt");
    function get_patient(){
         $.ajax({
        type: 'POST',
        url: window.get_pro_count_url,
        data: {
        },
        dataType: 'JSON',
        async: false,
        traditional: true,
        success: function (e) {
            var patcount = e.pro_count;
            var aa = patcount/menu_count;
            if(parseInt(aa)==aa)
            {
            }
            else
            {
                aa = parseInt(aa) + 1;
            }
            var box = document.querySelector('#big-box');

            for(var i=0;i<aa;i++)
            {
                var div = document.createElement('div');
                div.className = 'dropdown';
                div.id = 'drop' + i;
                box.append(div);

                var button = document.createElement('button');
                button.type = 'button';
                button.className = 'btn dropdown-toggle';
                button.id = 'dropdownMenu' + i;
                button.setAttribute('dropdown','dropdown');
                button.innerHTML = 'Case' + (i*menu_count+1) + '-' + (i*menu_count+menu_count);
                div.appendChild(button);
                var span = document.createElement('span');
                span.className = 'caret';
                button.append(span);
                var ul = document.createElement('ul');
                ul.className = 'dropdown-menu pull-left';
                ul.role = 'menu';
                ul.setAttribute('aria-labelledby','dropdownMenu1')
                div.append(ul);
            }

            var oo = document.querySelectorAll('.dropdown-menu');
            var index = 0;
            for(var i=0;i<oo.length;i++)
            {
                var ul = oo[i];

                for(var j=0;j<10;j++)
                {
                   var button=document.createElement("input");
                    button.type='button';
                    button.value="Case"+(i*10+  j+1);
                    button.className="layui-btn layui-btn1";
                    button.id = "button"+(i*10+  j+1);
                    button.innerHTML="Case22"+(i*10+  j+1);
                    button.style.background = '#ef4136';
                    button.setAttribute('role','presentation');
                  ul.appendChild(button);
                  var br = document.createElement('br');
                  ul.appendChild(br);
                  index++;
                    console.log(index);
                  if(index>=patcount)
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
     for(var u=0;u<box.children.length;u++)
     {
         var div = box.children[u];
         div.className = 'dropdown';
         console.log(11111111,div.className);

     }
     for(var u=0;u<box.children.length;u++)
     {
         renew_class(u);

     }
     function renew_class(i){
         var box = document.querySelector('#big-box');
         var div = box.children[i];
         div.addEventListener('click',function(){
             if(div.className === 'dropdown open')
        {
            div.className = 'dropdown';
        }
        else {
            div.className = 'dropdown open';
        }
         })
     }

     document.onclick = function () {
         // $('#canT').css('display', 'block');
         var obj = event.srcElement;
         if (obj.type == "button" && obj.tagName == 'INPUT' && obj.value.indexOf("Case")==0) {
             document.getElementById(obj.id).style.background = '#009688';
             patient_name = obj.value;
             console.log(patient_name);

             var lca_div = document.querySelector('#lca');
             var rca_div = document.querySelector('#rca');

             // var p1=document.getElementById("pLCA");
             // var p2=document.getElementById("pRCA");
             // p1.innerText = "LCA:"
             // p2.innerText = "RCA:"
             $('#lca').children().remove();
             $('#rca').children().remove();

             $('#lca').css('display', 'block');
             var lcaimg = document.createElement("img");
             lca_div.appendChild(lcaimg)
             lcaimg.src='static/img/humanlca.png';
             lcaimg.style.width='350px';
             lcaimg.style.height='350px';
             $('#rca').css('display', 'block');
             var rcaimg = document.createElement("img");
             rca_div.appendChild(rcaimg)
             rcaimg.src='static/img/humanrca.png';
             rcaimg.style.width='350px';
             rcaimg.style.height='350px';
             // lcaimg.width=500px;
             // var lcaman =document.querySelector('#lcaman');
             // lcaman.src='static/img/human.png';
             // $("#lca").attr("style","background:url('"+ '../static/img/human.png'+"') no-repeat;background-size:512px 512px;");
             // document.getElementById("lca").width = 512;
             // document.getElementById("lca").height = 512;


             var lca_btn_list = ['RAO-Caudal','RAO-Cranial','AP-Cranial','LAO-Cranial','LAO-Caudal','AP-Caudal'];
             for(var i = 0;i<6;i++) {
                 var button1 = document.createElement("input");
                 button1.type = 'button';
                 button1.value = lca_btn_list[i];
                 button1.className = "layui-btn layui-btn1";
                 button1.id = "lca_btn" + (i + 1);
                 button1.innerHTML = lca_btn_list[i];
                 button1.setAttribute('index', 'LCA')
                 lca_div.appendChild(button1);

                 button1.addEventListener('click',function(){
                    var canT =  document.querySelector('#canT');
                    var obj = event.srcElement;
                    canT.style.display = 'block';
                    console.log(patient_name+'-'+obj.value)
                    document.getElementById('angle').innerText = "Current view:"+this.getAttribute('index')+' '+this.value;
                    document.getElementById(obj.id).style.backgroundColor = '#009688';
                    //
                    var left_image =document.querySelector('#left_image');
                    var right_img = document.querySelector('#right_img');
                    // shujuku
                    left_image.src = 'static/Projection/' + patient_name+ '/'+this.getAttribute('index')+ '/' +this.value + '/main.png';
                    right_img.src = 'static/Projection/' + patient_name+ '/'+this.getAttribute('index')+ '/' +this.value + '/1.png';
                    left_url = 'static/Projection/' + patient_name+ '/'+ this.getAttribute('index')+ '/' +this.value + '/';
                    console.log(left_image)
                    console.log(right_img)
                })

             }
             var rca_btn_list = ['RAO','LAO','AP'];
            for(var i = 0;i<3;i++) {
                var button = document.createElement("input");
                button.type = 'button';
                button.value = rca_btn_list[i];
                button.className = "layui-btn layui-btn1";
                button.id = "rca_btn" + (i + 1);
                button.innerHTML = rca_btn_list[i];

                button.setAttribute('index', 'RCA')
                rca_div.appendChild(button);
                button.addEventListener('click',function(){
                    var canT =  document.querySelector('#canT');
                    var obj = event.srcElement;
                    canT.style.display = 'block';

                    document.getElementById('angle').innerText = "Current view:"+this.getAttribute('index')+' '+this.value;
                    document.getElementById(obj.id).style.backgroundColor = '#009688';
                    var left_image =document.querySelector('#left_image');
                    var right_img = document.querySelector('#right_img');
                    //
                    left_image.src = 'static/Projection/' +patient_name+ '/'+ this.getAttribute('index')+ '/' +this.value + '/main.png';
                    right_img.src = 'static/Projection/' + patient_name+ '/'+this.getAttribute('index')+ '/' +this.value + '/1.png';
                    left_url = 'static/Projection/' + patient_name+ '/'+this.getAttribute('index')+ '/' +this.value + '/';
                    console.log(left_image)
                    console.log(right_img)
                    })
            }





            var pre = document.querySelector('#pre');
            var next = document.querySelector('#next');
            pre.addEventListener('click',function(){
                var right_img = document.querySelector('#right_img');
                console.log(right_img.src)
                var nowxu = right_img.src.substr(-5,).substr(0,1);
                nowxu--;
                if(nowxu <= 0)
                {
                    nowxu = 1;
                }
                console.log('nowxuis：',nowxu)
                console.log(left_url)

                right_img.src = left_url + nowxu + '.png'
                console.log(right_img)
            })
             next.addEventListener('click',function(){
                var right_img = document.querySelector('#right_img');
                console.log(right_img.src)
                var nowxu = right_img.src.substr(-5,).substr(0,1);
                nowxu++;
                if(nowxu > 3)
                {
                    nowxu = 3;
                }
                console.log('nowxuis：',nowxu)
                console.log(left_url)

                right_img.src = left_url + nowxu + '.png'
                console.log(right_img)
            })
         }

     }
})
