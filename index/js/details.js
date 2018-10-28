$(function(){
    if(location.search.indexOf("lid=")!=-1){
        var lid=location.search.split("=")[1];
        (async function(){
            var res=await $.ajax({
                url:"http://localhost:3000/details",
                type:"get",
                data:{lid},
                dataType:"json",
                success:function(res){
                    console.log(res)
                    //解构返回的数据信息
                    var {img_country,country,name,title,details,price,price_del,img1,img2}=res.product[0];
                    //头信息
                    var html=`<img src="${img_country}" alt="">
                        <span>${country}</span>
                        <span class="split">|</span>
                        <a href="javascript:;" class="brand">${name}</a>`;
                    var divCard=document.querySelector("#SP>dt.orig-country")
                    divCard.innerHTML=html;  
                    var html=`<span>${title}</span>`;
                    var divCard=document.getElementById("Title");
                    divCard.innerHTML=html;

                    //详情介绍
                    var html=`<dt class="subTit">${details}</dt>`
                    var divCard=document.getElementById("Details");
                    divCard.innerHTML=html;

                    //价格
                    var html=`<div class="m-price">
                        <span class="m-line-title m-price-title j-price-title">售价</span>
                        <div class="m-price-cnt">
                            <span class="PInfo_r currentPrice">￥<span>${price.toFixed(2)}</span>
                            </span>
                            <span class="PInfo_r marketPrice addprice j-marketprice">参考价格&nbsp;&nbsp;￥<span>${price_del.toFixed(2)}</span>
                            </span>
                        </div>
                    </div>`
                    var divCard=document.getElementById("Price");
                    divCard.innerHTML=html;

                    //服务
                    var html=`<img class="postage-img" src="${img_country}" alt="">
                        <p class="postage-title" >
                            <span class="m-tit">全球直采</span>
                        </p>
                        <span class="postage-line active"></span>`
                    var divCard=document.getElementById("country")
                    divCard.innerHTML=html;
                    
                    //商品颜色图片
                    var html=`<li class="imgbox selectedLi" data-vid="" title="银色">
                            <a href="javascript:void(0);" hidefoucs="true">
                                <img src="${img1}" alt="" width="50px;" height="50px;">
                            </a>
                            <i>
                                <span clas="i-con-checked"></span>
                            </i>
                        </li>
                        <li class="imgbox" data-vid="" title="深空灰">
                            <a href="javascript:void(0);" hidefoucs="true">
                                <img src="${img2}" alt="" width="50px;" height="50px;">
                            </a>
                        </li>
                        <li class="selectedImgDesc show">
                            <p class="selectedImgTit">已选择</p>
                            <p class="selectedDesc">银色</p>
                        </li>
                        <li class="selectedImgDesc">
                            <p class="selectedImgTit">已选择</p>
                            <p class="selectedDesc">银色</p>
                        </li>`
                    var divCard=document.getElementById("j_skuwrap").children[1].children[1].children[0];
                    divCard.innerHTML=html;

                    //相关推荐
                    var html="";
                    for(var p of res.product.slice(1)){
                        var {title,img1,price,price_del,p_text}=p;
                        html+=`<div class="newRecomItemWrap newRecomItemWrap-1">
                            <a href="#" class="itemIng">
                                <img src="${img1}" alt="" style="opacity:1;" width="110px;" height="110px;">
                            </a>
                            <p class="itemTitle">
                                <a class="protitle" href="#">${title}</a>
                            </p>
                            <div class="itemInfo clearfix">
                                <p class="price">
                                    <span class="symbol">￥</span>${price}
                                    <span class="marprice">￥
                                        <del>${price_del}</del>
                                    </span>
                                </p>
                                <a href="#" class="comment">${p_text}</a>
                            </div>
                        </div>`
                    }
                    var divCard=document.querySelector("#j-listsimilar>div");
                    divCard.innerHTML=html;

                    //大中小图片
                    var html=""
                    for(var p of res.pics){
                        var {sm,md,lg}=p;
                        html+=` <li><a href="javascript:;">
                            <img src="${sm}" alt="" data-md="${md}" data-lg="${lg}">
                        </a>
                    </li>`
                    }
                    var ul=document.getElementById("litimgUl");
                    ul.innerHTML=html;
                    ul.style.width=64*res.pics.length+"px";

                    //找中图片位置，并从数据库替换
                    var mImg=document.querySelector("#showImgBox>img");
                    mImg.src=res.pics[0].md;
                    //找大图片位置，并从数据库替换
                    var lgImg=document.getElementById("showImgBig")
                    lgImg.src=res.pics[0].lg;

                    //鼠标进入切换中图片和大图片
                    ul.onmouseover=function(e){
                        if(e.target.nodeName==="IMG"){
                            var img=e.target;
                            var md=img.dataset.md;
                            var lg=img.dataset.lg;
                            mImg.src=`${md}`;
                            lgImg.src=`${lg}`;
                            
                        }
                    }

                    
                    //小图片的左右移动
                    var $ul=$("#litimgUl");
                    //左边的按钮-后退功能
                    var $left=$("#j-producthead>div>div>a:first");
                    //右边的按钮-前进功能
                    var $right=$left.next();
                    console.log($right,$left)
                    //如果pics中的图片总数<=4
                    if(res.pics.length<=4)
                        //右边按钮添加 class="disabled" 
                        $right.addClass("disabled")
                    var moved=0;//记录已经左移的图片个数
                    $left.on("click",function(){
                        var $left=$(this);
                        if(!$left.is(".disabled")){
                            moved--;//已经左移的图片-1
                            //ul的marginLeft始终等于：-1i宽度的*64左移图片个数
                            $ul.css("marginLeft",-81*moved)//不用加px
                            $right.removeClass("disabled")
                            if(moved==0)
                                $left.addClass("disabled")
                        }
                    })
                    $right.on("click",function(){
                        var $right=$(this);
                        if(!$right.is(".disabled")){
                            moved++//已经左移的图片+1
                            $ul.css("marginLeft",-81*moved)
                            //让左移的按钮去除disabled
                            $left.removeClass("disabled")
                            //如果pics中图总数个数-move次数==4
                            if(res.pics.length-moved==4)
                                //为右边按钮加上disabled
                                $right.addClass("disabled")
                        }
                    })
                    
                    //放大镜效果
                    var $mImg=$(mImg),//中图片
                        $lgImg=$(lgImg),//大图片
                        $mask=$("#showImgBox>b.shadow"),//透明罩
                        $smask=$("#super");
                    var MSIZE=200,//mask的大小
                        MAX=400-MSIZE;//top和left的最大值
                    $smask.mouseenter(
                        function(){
                            $mask.css("display","block")
                        }
                    )
                    $smask.mouseleave(
                        function(){
                            $mask.css("display","none")
                        }
                    )
                }   
                
            })
            
        })()
    }
})