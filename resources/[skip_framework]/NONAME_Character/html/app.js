var entered = false;
var rotate = 0;



$(document).ready(function(){
    $('.multichar-container').show();
    $('.delete-container').hide()
    $('.create-container').hide()

    $('.delete-container').removeClass()
    $('.create-container').removeClass()
    
    window.addEventListener('message', function(event) {
        var data = event.data;
        
        if (data.status === 'charSelect'){
            if (data.status == true){
                $('.multichar-container').fadeIn(250);
            } else {
                $('.multichar-container').fadeOut(250);
            }
        }

        if (data.type === 'setupCharacters'){
            var characters = data.characters;
            if (characters !== null){
                
            }
        }
    })
})