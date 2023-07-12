
function dynamicLoadJs(url, callback) {
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
    if (typeof (callback) == 'function') {
        script.onload = script.onreadystatechange = function () {
            if (!this.readyState || this.readyState === "loaded" || this.readyState === "complete") {
                callback();
                script.onload = script.onreadystatechange = null;
            }
        };
    }
    head.appendChild(script);
}

dynamicLoadJs("../static/js/jquery-3.2.1.min.js",)




// 模式配置
const modeOptions = {
    light: {
        '--background-color': '#fff',
        '--box-shadow': '0 1px 8px 0 rgba(0, 0, 0, 0.1)',
        '--box-shadow-hover': '0 2px 16px 0 rgba(0, 0, 0, 0.2)',
        '--text-color': '#242424',
        '--text-color-sub': '#7F7F7F',
        '--border-color': '#eaecef',
    },
    read: {
        '--background-color': '#f5f5d5',
        '--box-shadow': '0 1px 8px 0 rgba(0, 0, 0, 0.1)',
        '--box-shadow-hover': '0 2px 16px 0 rgba(0, 0, 0, 0.2)',
        '--text-color': '#004050',
        '--text-color-sub': '#7F7F7F',
        '--border-color': 'rgba(0, 0, 0, 0.15)',
    },
    dark: {
        '--background-color': '#181818',
        '--box-shadow': '0 1px 8px 0 rgba(255, 255, 255, .6)',
        '--box-shadow-hover': '0 2px 16px 0 rgba(255, 255, 255, .7)',
        '--text-color': 'rgba(255, 255, 255, .8)',
        '--text-color-sub': '#8B8B8B',
        '--border-color': 'rgba(255, 255, 255, .3)',
    }
}
// 设置模式
function setMode(mode) {
    const rootElement = document.querySelector(':root');
    const options = modeOptions[mode];
    // 遍历设置
    for (const k in options) {
        rootElement.style.setProperty(k, options[k]);
    }
    rootElement.setAttribute("data-theme", mode);
    // 当前模式
    // {#const curMode = document.querySelector('.cur-mode');#}
    // {#curMode.innerHTML = mode;#}
}
function setCookie(name,value)

{
    //此 cookie 将被保存 30 天
    if(getCookie(name))
    {
        console.log('改变之前的值：',document.cookie)
        console.log('已经有了')
        console.log(document.cookie['mode'])
        var Days = 30;
        var exp = new Date();
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
        console.log(document.cookie)
    }


}


function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) return unescape(arr[2]);
    return null;

}
function get_cookies()
{
    var value = null
    console.log(document.cookie)
    $.ajax({
            url:'/return_cookies',
            type: 'GET',
            data: {
                'mode':'mode',
            },
            async: false,
            traditional: true,
            success: function (e) {
                //console.log('当前数据：',e.data)
                value = e.data
            },
            error: function (request) {
                console.log('错误',request['mode'])

            }
          })
    return value
}
function set_cookies(name,value)
{

    console.log(document.cookie)
    $.ajax({
            url:'/updatecookie',
            type: 'POST',
            data: {
                'name':name,
                'value':value
            },
            async: false,
            traditional: true,
            success: function (e) {
                //console.log('当前数据：',e.data)
                value = e.data
            },
            error: function (request) {
                console.log('错误',request['mode'])

            }
          })
}
window.addEventListener('load',function(){
    var value = get_cookies()
    if (value == null){
        setMode("light");
    }
    else{
        console.log('value:',value)
        setMode(value);
    }
    document.querySelector(".btn").addEventListener("click", (e) => {
        console.log('wrong')
        set_cookies('mode',e.target.getAttribute("mode"))
        var val = get_cookies()
        setMode(val);

    })
})

