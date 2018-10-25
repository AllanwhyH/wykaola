
//var $divLift=$("")
window.onscroll=function(){
    var scrollTop=document.documentElement.scrollTop;
    var indexleft=document.getElementById("indexleft");
    var indexright=document.getElementById("indexBarNew");
    if(scrollTop>=700){
        indexleft.style.display="block";
        indexright.style.display="block";
    }else{
        indexleft.style.display="none";
        indexright.style.display="none";
    }
     
    /*$fs.each((i,f)=>{
        offsetTop=$(f).offset().top;//获取当前楼层距离body的距离
        if(innerHeight/2+scrollTop>offsetTop){//如果楼层过中线
            $divLift.children(`:eq(${i})`).addClass("")//给当前电梯按钮显示 亮
            .siblings().removeClass("")//移除其他按钮的样式
        }
    })*/
};
/*$divLift.on("click","button",function(){
    //获取点击的第几个按钮
    var i=$(this).index();
    var offsetTop=$(``).offset().top;//获取对应楼层距离页面顶部的总距离
    //让页面滚动到和楼层距离body顶部总距离相同的位置
    $("html").animate({
        scriollTop:offsetTop
    },500)
})*/