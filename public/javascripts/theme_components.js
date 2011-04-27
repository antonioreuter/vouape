$(function() {
    $( "#slider-range-max" ).slider({
        range: "max",
        min: 1,
        max: 50,
        value: 5,
        slide: function( event, ui ) {
            $( "#distance" ).val( ui.value )
            $( "#label_distance").val(ui.value + " km.");
        }
    });
    $( "#distance" ).val( $( "#slider-range-max" ).slider( "value" ) )

    $( "#label_distance" ).val( $( "#slider-range-max" ).slider( "value" ) + " km." );

    $( "input[type=submit]" ).button();

    $( "textarea" ).addClass("textClass");


    $("a").not(".link_acesso").button();

    $( "input[type=text]" ).addClass("textClass");


    $("#query_content form").ajaxSend(function(evt, request, settings){
        $("input[type='submit']").attr("disabled","disabled");
        $(".ajaxStatus").prepend("<img id='imgAjaxStatus' src='/images/ajax-loader.gif' title='status'/>");
            
    }).ajaxStop(function(){
        $("input[type='submit']").removeAttr("disabled");
        $("#imgAjaxStatus").remove();
    });

    $("#submit_promotion").click(function(){
        alert("TESTE");
        findPromotionsLocale();
    });


    //When page loads...
    $('#tabs').tabs();

       
});





function load_promotion_theme(){
    
    $( "#inner_promotions" ).accordion({
        fillspace: true,
        animate: true
    });
}

