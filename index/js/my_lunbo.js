function task(){
    var ul=document.getElementById("show_pic");
    var img=ul.querySelector(".showImg");

    var td=document.getElementById("icon_num");
    var span=td.children[0].children[0];
    var a=span.querySelector(".active");
    a.className="";

    img.className="";
    var next=img.nextElementSibling;
    var a_next=a.nextElementSibling;
    if(next!=null && a_next!=null){
        next.className="showImg";
        a_next.className="active";
    }else{
        img.parentNode.children[0].className="showImg";
        a.parentNode.children[0].className="active";
    }
}
var timer=setInterval(task,3000);
show_pic.onmouseover=function(){
    clearInterval(timer);
};
show_pic.onmouseout=function(){
    timer=setInterval(task,3000)
};
icon_num.onmouseover=function(){
    clearInterval(timer);
};
icon_num.onmouseout=function(){
    timer=setInterval(task,3000)
};
