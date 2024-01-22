
const title = document.querySelector('[g-id=title]')
const redirection = document.querySelector('[g-id=redirection]')

const typeWhriter = (title, redirection)=> {
    try {
        
        const textArrayTitle = title.innerHTML.split('');
        title.innerHTML = '';

        const textArrayRedirection = redirection.innerHTML.split('');
        redirection.innerHTML = '';

        textArrayTitle.forEach((letter, i)=> {

            setTimeout(function(){
                title.innerHTML += letter
            }, 190 * i)
        });

        textArrayRedirection.forEach((letter, i)=> {

            setTimeout(function(){
                redirection.innerHTML += letter
            }, 140 * i)
        });

    } catch (erro) {
        console.log(erro)
    }
}

typeWhriter(title, redirection)


$(".btn-success").click(function() {
    var gameId = $(this).data("id");

    $.ajax({
        url: '/add_to_wishlist',
        type: 'post',
        data: {
            'game_id': gameId
        },
        success: function(response) {
            alert("Jogo adicionado à lista de desejos com sucesso!");
        },
        error: function(response) {
            alert("Houve um erro ao adicionar o jogo à lista de desejos. Por favor, tente novamente.");
        }
    });
});