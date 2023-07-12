
window.addEventListener('load',function(){

    var left_url = ''
    var lca_div = document.querySelector('#lca');
    var lca_btn = document.querySelector('#lca_btn');
    lca_btn.addEventListener('click',function(){
        var lca_btn_list = ['RAO-Caudal','RAO-Cranial','AP-Cranial','LAO-Cranial','LAO-Caudal','AP-Caudal'];
        if(lca_div.children.length  === 2)
        {
            for(var i = 0;i<6;i++)
            {
            var button1 = document.createElement("input");
            button1.type='button';
            button1.value=lca_btn_list[i];
            button1.className="layui-btn layui-btn1";
            button1.id = "lca_btn"+(i+1);
            button1.innerHTML = lca_btn_list[i];
            button1.setAttribute('index','LCA')
            lca_div.appendChild(button1);

            button1.addEventListener('click',function(){
                var canT =  document.querySelector('#canT');
                var obj = event.srcElement;
                canT.style.display = 'block';
                console.log(obj.id)
                document.getElementById('angle').innerText = "Current view:"+this.getAttribute('index')+' '+this.value;
                document.getElementById(obj.id).style.backgroundColor = '#009688';

                var left_image =document.querySelector('#left_image');
                var right_img = document.querySelector('#right_img');
                left_image.src = 'static/Projection/' + this.getAttribute('index')+ '/' +this.value + '/main.png';
                right_img.src = 'static/Projection/' + this.getAttribute('index')+ '/' +this.value + '/1.png';
                left_url = 'static/Projection/' + this.getAttribute('index')+ '/' +this.value + '/';
                console.log(left_image)
                console.log(right_img)
            })

        }
            var br=document.createElement("br");
                  lca_div.appendChild(br);
        }

    })










    var rca_div = document.querySelector('#rca');
    var rca_btn = document.querySelector('#rca-btn');
    rca_btn.addEventListener('click',function(){
        var rca_btn_list = ['RAO','LAO','AP'];
        if(rca_div.children.length  === 2)
        {
            for(var i = 0;i<3;i++)
        {
            var button=document.createElement("input");
            button.type='button';
            button.value=rca_btn_list[i];
            button.className="layui-btn layui-btn1";
            button.id = "rca_btn"+(i+1);
            button.innerHTML = rca_btn_list[i];

            button.setAttribute('index','RCA')
            rca_div.appendChild(button);

            button.addEventListener('click',function(){
                var canT =  document.querySelector('#canT');
                var obj = event.srcElement;
                canT.style.display = 'block';
                console.log(obj.id)
                document.getElementById('angle').innerText = "Current view:"+this.getAttribute('index')+' '+this.value;
                document.getElementById(obj.id).style.backgroundColor = '#009688';
                var left_image =document.querySelector('#left_image');
                var right_img = document.querySelector('#right_img');
                left_image.src = 'static/Projection/' + this.getAttribute('index')+ '/' +this.value + '/main.png';
                right_img.src = 'static/Projection/' + this.getAttribute('index')+ '/' +this.value + '/1.png';
                left_url = 'static/Projection/' + this.getAttribute('index')+ '/' +this.value + '/';
                console.log(left_image)
                console.log(right_img)
            })

        }
            var br=document.createElement("br");
                  rca_div.appendChild(br);
        }

    })


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
        console.log('nowxu是：',nowxu)
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
        console.log('nowxu是：',nowxu)
        console.log(left_url)

        right_img.src = left_url + nowxu + '.png'
        console.log(right_img)
    })


})