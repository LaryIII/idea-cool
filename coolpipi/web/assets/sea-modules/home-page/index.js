seajs.config({
	plugins:['shim'],
    alias:{
    	'$':'gallery/jquery/1.7.2/jquery.js',
        'bootstrap':'gallery/bootstrap/bootstrap.js'
    }
})

seajs.use(['$','bootstrap'],function($,bootstrap){
	//高度自适应
	var height = document.body.scrollHeight > document.documentElement.clientHeight ? document.body.scrollHeight : document.documentElement.clientHeight;
	$('.gallery-item').height(height);

	//定义鼠标滚轮事件
	var step = 100;
	var scrollFunc = function(e){
		var e = e || window.event;
		var direct = 0;
		if(e.wheelDelta){
			direct = e.wheelDelta > 0 ? -1:1;
		}else if(e.detail){
			direct = e.detail > 0 ? 1:-1;
		}
		var old = $(window).scrollLeft();
		$(window).scrollLeft(old + step*direct);
	}
	if(document.addEventListener){ 
		$('.gallery')[0].addEventListener('DOMMouseScroll',scrollFunc,false); 
	}//W3C 
	$('.gallery')[0].onmousewheel=$('.gallery')[0].onmousewheel=scrollFunc;//IE/Opera/Chrome

	//透明效果
	$('ul.gallery li').hover(function(e){
		$(this).siblings().css({'opacity':0.6});
	},function(e){
		$(this).siblings().css({'opacity':1});
	});

	//登录
	

	//home键
	var homeBtnToggle = function(){
		var width = document.documentElement.scrollWidth > document.body.scrollWidth ? document.documentElement.scrollWidth : document.body.scrollWidth;
		$('.slide-down-box').css({'width':width});
		$('.slide-down-box').slideToggle('slow');
		
		$('#mask').css({'width':width,'height':height-155});
		$('#mask').fadeToggle('slow');
	}
	$('#homeBtn').click(homeBtnToggle);
	$('#mask').click(homeBtnToggle);

})