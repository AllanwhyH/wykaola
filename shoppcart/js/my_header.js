$(function(){
    //1.动态创建link引用header.css
    $("<link rel='stylesheet' href='css/index-header.css'>").appendTo("head")
    //2.ajax请求header.html片段
    $.ajax({
        url:"http://localhost:3000/shoppcart/index-header.html",//地址
        type:"get",//方式
        success:function(res){
            $("#header").replaceWith(res)
        }
    })
})