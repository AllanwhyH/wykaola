$(function(){
    $.ajax({
        url:"http://localhost:3000/index/Products",
        type:"get",
        dataType:"json",//ajax可自动将json转为obj
        success:function(res){
            console.log(res)
            /*会场图片*/
            var html="";
            for(var p of res.slice(0,4)){
                var {img}=p;
                html+=`
                <li><a class="pic" style="height:332px;" href="#"><img src="${img}" alt=""></a></li>`
            }
            var divCard=document.querySelector("#rowOfResource>ul>li>ul");
            divCard.innerHTML=html;

            /*今日限时购*/
            var html="";
            for(var p of res.slice(4,8)){
                var {title,details,img,price,price_del,xcount}=p;
                html+=`<li class="goods f-cb">
                    <a class="pic" href="#">
                        <img src="${img}" alt="" class="img-lazyload img-lazyloaded">
                    </a>
                    <div class="detail">
                        <h3 class="intro">
                            <a href="#">${title}</a>
                        </h3>
                        <h3 class="shortTitle">
                            <a href="#">${details}</a>
                        </h3>
                        <p class="price">
                            <b>￥</b>
                            ${price}
                            <span>￥</span>
                            <del>${price_del}</del>
                        </p>
                        <div class="process process-limit">${xcount}</div>
                        <a class="btn f-hover" href="#">立即抢购</a>
                    </div>
                </li>
                `
            }
            var divCard=document.querySelector("#jrxsg>section>ul");
            divCard.innerHTML=html;
            var {img}=res[8];
            var html=`<a href="#" class="pic">
                <img src="${img}" alt="" class="img-lazyload img-lazyloaded">
            </a>`
            var divCard=document.querySelector("#jrxsg>section>aside")
            divCard.innerHTML=html;

            /*今日上新*/
            var {title,img,img2}=res[9];
            var html=`<li class="itm item-brand-new"><a href="#">
                        <div class="good-info">
                            <div class="image-wrap">
                                <img class="img f-hover" src="${img}" alt="">
                            </div>
                            <div class="recomds-brand-mask">
                                <p class="desc">港式老牌糕点</p>
                                <p class="profix">
                                    <span>
                                        月饼每满
                                        <i>199</i>
                                        减
                                        <i>20</i>
                                        元
                                    </span>
                                </p>
                            </div>
                        </div>
                        <div class="brand-info">
                            <div class="image-wrap">
                                <img src="${img2}" alt="">
                            </div>
                            <p class="brand-name">
                                <span>${title}</span>
                            </p>
                        </div>
                    </a>
                </li>`
            for(var p of res.slice(10,16)){
                var {title,img,price,price_del}=p;
                html+=`<li class="itm itm-goods">
                        <a class="pic" href="#">
                            <img src="${img}" alt="">
                        </a>
                        <a class="tit" href="#">${title}</a>
                        <p class="price">
                            <span class="cur">
                                ￥
                                <b>${price}</b>
                            </span>
                            <span class="mkt">
                                ￥
                                <del>${price_del}</del>
                            </span>
                        </p>
                    </li>`
            }
            var {img,title}=res[16];
            html+=`<li class="itm itm-goods">
                <a class="pic" href="#" style="background:url(${img}) left center no-repeat rgb(255,255,255);">
                </a>
                <a class="tit" href="#">${title}</a>
            </li>-->`
            var divCard=document.querySelector("#jrsx>div>ul")
            divCard.innerHTML=html;

            /*热门品牌*/
            var html="";
            for(var p of res.slice(17,20)){
                var {img,title,details}=p;
                html+=`<li class="itm">
                    <a href="#"><img class="img" src="${img}" alt=""></a>
                    <div class="txt">
                        <p class="name">${title}</p>
                        <p class="desc">${details}</p>
                    </div>
                </li>`
            }
            var divCard=document.querySelector("#pcBrandModuleId>section>div>ul")
            divCard.innerHTML=html;
            var html="";
            for(var p of res.slice(20,28)){
                var {img,title,details}=p;
                html+=`<li class="itm">
                    <div class="info" style="width:100%;">
                        <img class="img" src="${img}" alt="">
                        <p class="desc">${title}</p>
                    </div>
                    <div class="actions">
                        <a class="follow" href="#">+关注</a>
                        <p class="followers">${details}</p>
                        <a class="enter" href="#">进入品牌</a>
                    </div>
                </li>`
            }
            var divCard=document.querySelector("#pcBrandModuleId>section>ul")
            divCard.innerHTML=html;

            /*母婴专区-函数product进行各专区调用*/
            function product(first,startM,endM,startR,endR,rmai1,rmai2,ID){
                var {img}=res[first];
                var html=`<img class="img-lazyload opacity1 img-lazyloaded" src="${img}" alt="" width="330px;" height="541px;">`;
                var divCard=document.querySelector("#"+ID+">div.cont>div.part1>a")
                divCard.innerHTML=html; 
                var html="";
                for(var p of res.slice(startM,endM)){
                    var {title,details,img}=p;
                    html+=`<li class="itm"><a class="pic" href="#">
                        <h3 class="tit">${title}</h3>
                        <p class="desc s-fc2">${details}</p>
                        <img class="img-lazyload img-lazyloaded" src="${img}" alt="" width="180px;" height="144px;">
                    </a></li>`;
                }
                var divCard=document.querySelector("#"+ID+">div.cont>div.partm>ul")
                divCard.innerHTML=html; 
                var html="";
                for(var p of res.slice(startR,endR)){
                    var {title,img,price,price_del}=p;
                    html+=`<div class="itemsale clearfix">
                        <a class="pic" href="#">
                            <img width="75px;" height="75px;" src="${img}" alt="">
                        </a>
                        <div class="proinfo">
                            <h3 class="tit">
                                <a class="protitle" href="#" title="${details}">${details}</a>
                            </h3>
                            <p class="curprice">
                                <span class="symbol">￥</span>
                                <strong>${price}</strong>
                                <span class="item2">
                                    ￥
                                    <del>${price_del}</del>
                                </span>
                            </p>
                        </div>
                    </div>`
                }
                var divCard=document.querySelector("#"+ID+">div.cont>div.party>div>div")
                divCard.innerHTML=html; 
                /*母婴-热卖品牌*/
                var html="";
                for(var p of res.slice(rmai1,rmai2)){
                    var {img}=p;
                    html+=`<a class="pic" href="#">
                        <img src="${img}" alt="">
                        <span class="follow"></span>
                        <span class="toast">已关注</span>
                    </a>`
                }
                var divCard=document.querySelector("#"+ID+">div.w-logolist>div.brandListContainer")
                divCard.innerHTML=html; 
            }
            product(28,35,39,63,67,95,100,"my");
            /*美容彩妆*/
            product(29,39,43,67,71,100,105,"meir");
            /*服饰鞋包*/
            product(30,43,47,71,75,105,110,"shirt");
            /*家居个护*/
            product(31,47,51,75,79,110,115,"homeju");
            /*营养保健*/
            product(32,51,55,79,83,115,120,"yyang");
            /*数码家电*/
            product(33,55,59,83,87,120,125,"sma");
            /*运动户外*/
            product(34,59,63,87,91,125,130,"sport");

            /*猜你喜欢*/
            var html="";
            for(var p of res.slice(91,95)){
                var {img,title,price,price_del}=p;
                html+=`<li class="itm itm-goods">
                    <a class="pic" href="#">
                        <img width="180px;" height="180px;" src="${img}" alt="">
                    </a>
                    <a class="tit" href="#">${title}</a>
                    <p class="price">
                        <span class="cur">
                            ￥
                            <b>${price}</b>
                        </span>
                        <span class="mkt">
                            ￥
                            <del>${price_del}</del>
                        </span>
                    </p>
                </li>`
            }
            var divCard=document.querySelector("#ylike>div>ul")
            divCard.innerHTML=html; 

        }
    })
})