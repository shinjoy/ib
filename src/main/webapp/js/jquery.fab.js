(function($){
	
	
    if(!$.jfab){
        $.jfab = new Object();
    };
    
    $.jfab.fab = function(el, links, options){
        var
            base = this,
            mainBtn,
            subBtns;
        
        base.$el = $(el);
        base.el = el;
        base.$el.data("kc.fab", base);
        base.$el.addClass("jfab_wrapper");
        var toogleAnimation = function(e){
        	
        	
            if ($(this).attr('data-link-href').length > 0){
            	
                if ($(this).attr('data-link-target')){
                   // window.open($(this).attr('data-link-href'), $(this).attr('data-link-target'));
                }else{
                  //  window.location.href = $(this).attr('data-link-href');
                }
            }
            
            if ($(".jfab_overlay").length > 0){
        		$(".jfab_overlay").remove();
              
        	}else{
        		$('#maskingLayOut').append('<div class="jfab_overlay" ></div>');	
        		
        		/*var overlayZindex =  
        		
        		Math.max.apply(null,$.map($('body > *'), function(e,n){
        			console.log($(e).html());
        			if($(e).css('position')=='absolute') return parseInt($(e).css('z-index'))||1;
        		}));

        		console.log(overlayZindex)*/
        	}
            
            subBtns.animate({
                opacity: "toggle",
                height: "toggle"
            }, 200);
            if (options.rotate) {
                mainBtn.toggleClass('rotate');
            }
        };
        var hide = function(e){
            subBtns.animate({
                opacity: "hide",
                height: "hide"
            }, 100);
            if (options.rotate) {
                mainBtn.removeClass('rotate');
            }
            var agent = navigator.userAgent.toLowerCase();

           /*  if (agent.indexOf("safari") != -1) {
            	alert("사파리 브라우저입니다.");
            	
            } */

            $("#maskingLayOut").empty();
        };
       
        base.init = function(){
          
            if (typeof( options ) === "undefined" || options === null){
                options = {
                    rotate: false
                };
            }
            base.options = $.extend({},$.jfab.fab.defaultOptions, options);
            base.links = links;
            if (base.links.length > 0){
                mainBtnLink = base.links[0];
                /* colorStyle = (mainBtnLink.background)? "color:"+mainBtnLink.color+";" : ""; */
                background = (mainBtnLink.background)? "background:"+mainBtnLink.background+";" : "";
                mainBtnLinkHtml = "<button data-link-href='"+((mainBtnLink.url)?mainBtnLink.url:"")+"' data-link-target='"+((mainBtnLink.target)?mainBtnLink.target:"")+"' class='jfab_main_btn' style='"+background+"'></button>";
               
                subBtnsHtml = "";
                base.links.shift();
                /* Loop through the remaining links array */
                for (var i = 0; i < base.links.length; i++) {
                    /* colorStyle = (base.links[i].color)? "color:"+base.links[i].color+";" : ""; */
                    bgColorStyle = (base.links[i].background)? "background:"+base.links[i].background+";" : "";
                    subBtnsHtml += "<div><button data-link-href='"+(base.links[i].url?base.links[i].url:"")+"' data-link-target='"+((base.links[i].target)?base.links[i].target:"")+"' class='sub_fab_btn' style='"+bgColorStyle+"'></button></div>";
                    
                }
                subBtnsHtml = "<div class='jfab_btns_wrapper'>"+subBtnsHtml+"</div>";
                base.$el.append(subBtnsHtml).append(mainBtnLinkHtml);

            }else{
                if (typeof console == "undefined") {
                    window.console = {
                        log: function (msg) {
                            alert(msg);
                        }
                    };
                }
                
            }
            mainBtn = base.$el.find(".jfab_main_btn");
            subBtns = base.$el.find(".jfab_btns_wrapper");

            mainBtn.click(toogleAnimation);
            mainBtn.focusout(hide);

            subBtns.find('.sub_fab_btn').on('mousedown', function(e){
                if ($(this).attr('data-link-href').length > 0){
                    if ($(this).attr('data-link-target')){
                        window.open($(this).attr('data-link-href'), $(this).attr('data-link-target'));
                    }else{
                        window.location.href = $(this).attr('data-link-href');
                    }
                }
            });
        };
        base.init();
    };
    
    $.jfab.fab.defaultOptions = {};
    
    $.fn.jqueryFab = function(links, options){
        return this.each(function(){
            (new $.jfab.fab(this, links, options));
        });
    };
    
})(jQuery);
