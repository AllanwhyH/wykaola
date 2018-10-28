$("[data-trigger=dropdown]").parent().on("mouseover",function(){
    $(this).children().last().show();
})
.on("mouseout",function(){
    $(this).children().last().hide();
})