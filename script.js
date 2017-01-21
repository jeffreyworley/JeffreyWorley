

$( document ).ready(function() {

    //main page resizing
	$(window).on("load", function(){

	    if($(window).width() > 890)
	    	$("#indexpage").css("width", "890px");
	    
	    else if($(window).width() > 600)
	    	$("#indexpage").css("width", "600px");
	   
	    else
	    	$("#indexpage").css("width", "300px");
	    
    });

    $(window).on("resize", function(){

	    if($(window).width() > 890)
	    	$("#indexpage").css("width", "890px");
	    
	    else if($(window).width() > 600)
	    	$("#indexpage").css("width", "600px");
	   
	    else
	    	$("#indexpage").css("width", "300px");
	    
    });

    //screen saver resizing
    $(window).on("load", function(){
        if($(window).width() > 890)
            $("#screensaverwindow").css("width", "890px");
        
        else if($(window).width() > 640)
            $("#screensaverwindow").css("width", "700");
    });

    //The about me transistion on the home page
	$('#aboutme')
		.mouseenter(function(){
        	var src = $(this).attr("src").replace("BW2.jpg", ".jpg");
        	$(this).attr("src", src);
        })
        .mouseleave(function(){
        	var src = $(this).attr("src").replace(".jpg", "BW2.jpg");
        	$(this).attr("src", src);
    });

    //Screen saver transition on the homepage
    $('#screensaver')
    	.mouseenter(function(){
    		var src = $(this).attr("src").replace("BW.jpg", ".jpg");
    		$(this).attr("src", src);
    	})
    	.mouseleave(function(){
    		var src = $(this).attr("src").match(/[^\.]+/) + "BW.jpg";
    		$(this).attr("src", src);
   	});
        
    //TSA transition on the homepage
    $('#TSA')
    	.mouseenter(function(){
    		var src = $(this).attr("src").replace("BW.jpg", ".jpg");
    		$(this).attr("src", src);
    	})
    	.mouseleave(function(){
    		var src = $(this).attr("src").match(/[^\.]+/) + "BW.jpg";	
        	$(this).attr("src", src);
   	});

    // FIRST transition on the homepage
    $('#FIRST')
    	.mouseenter(function(){
    		var src = $(this).attr("src").replace("BW.jpg", ".jpg");
    		$(this).attr("src", src);
    	})
    	.mouseleave(function(){
    		var src = $(this).attr("src").match(/[^\.]+/) + "BW.jpg";
    		$(this).attr("src", src);
   	});

    //Research Papers transition on the homepage
    $('#ResearchPapers')
        .mouseenter(function(){
            var src = $(this).attr("src").replace("BW.jpg", ".jpg");
            $(this).attr("src", src);
        })
        .mouseleave(function(){
            var src = $(this).attr("src").match(/[^\.]+/) + "BW.jpg";
            $(this).attr("src", src);
    });
    
 
});


