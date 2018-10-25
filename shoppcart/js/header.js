$(function(){
    //link引用header.css
    $("<link rel='stylesheet' href='css/index-header.css'>").appendTo("head")
    $.ajax({
        url:"http://localhost:3000/index-header.html",
        type:"get",
        success:function(){
            $("#header").replaceWith(res)
        }
    })
})