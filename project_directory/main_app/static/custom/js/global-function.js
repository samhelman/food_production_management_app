//set the loading circle on or off by using true or false
function set_loading(condition){
    if(condition){
        $(".loader").show();
        $(".black-background-loading").show();
    }else{
        $(".loader").hide();
        $(".black-background-loading").hide();
    }
}
//loading progress bar
function LoadingAnimate(seconds){
    $('.progress-bar').animate({width: '100%'},seconds);
}

function format_values(number){
    if(number == null || number == ''){
        return '0.00'
    }
    return '$'+parseFloat(number).toFixed(2).toLocaleString();
}

//loading progress bar
function SetProgressBar(condition,text,seconds) {
    if(condition){
        $(".progress-bar-display").show();
        $('.type-loading-explain').html(text);
        LoadingAnimate(seconds*1000);
        $(".black-background-loading").show();
    }else{
        $(".progress-bar-display").hide();
        $('.type-loading-explain').html("");
        $(".black-background-loading").hide();
        $('.progress-bar').animate({width: '100%'},500);
    }
}

function code_maker(word){
    var words = word.split(" ");
    var code = '';
    for (var i = 0 ; i < words.length; i+=1){
        code = code + words[i].charAt(0).toUpperCase();
    }
    return code;
}


//the default dragover listener, if not prevented, will still load the file that was dropped
//and change the browser page to what ever you dragged and drop
// window.addEventListener("dragover", function(e) {
//     e.preventDefault();
// });
//
// window.addEventListener("drop", function(e) {
//     var path = e.path;
//     var path_length = path.length;
//     var in_modal_add = false;
//     for(var i=0; i < path_length; i++){
//         if($(path[i]).hasClass('inside-file-drop-modal')){
//             in_modal_add = true;
//         }
//     }
//     e.preventDefault();
//     if(in_modal_add){
//         $('#pricelist-item-file-edit').prop('files', e.dataTransfer.files);
//         $('.file-status').text(e.dataTransfer.files[0].name);
//         $('.price-list-item-file-name-input').val(e.dataTransfer.files[0].name);
//         $('.price-list-item-file-name-input').trigger('change');
//     }
//     e.dataTransfer.effectAllowed = "none";
//     e.dataTransfer.dropEffect = "none";
// });