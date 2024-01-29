
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


$(document).ready(function() {
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

    $(".btn-danger").click(function() {
        let gameID = $(this).data("id");

        $.ajax({
            url: '/delete_game',
            type: 'delete',
            data: {
                'game_id': gameID
            },
            success: function(response) {
                alert("Jogo deletado com sucesso!");
            },
            error: function(response) {
                alert("Houve um erro ao deletar jogo.");
            }
        });
    });

    $(".btn-update").click(function() {
        let gameID = $('[g-id="id"]').val();
        let nome = $('[g-id="nome"]').val();
        let lancamento = $('[g-id="lancamento"]').val();
        let genero = $('[g-id="genero"]').val();
        let descricao_curta = $('[g-id="descricao-curta"]').val();
        let descricao_completa = $('[g-id="descricao-completa"]').val();
        let url = $('[g-id="url"]').val();
      
        console.log(gameID);
        debugger;

        $.ajax({
            url: '/update_game',
            type: 'put',
            data: {
                'game_id': gameID,
                'nome': nome,
                'lancamento': lancamento,
                'genero': genero,
                'descricao_curta': descricao_curta,
                'descricao_completa': descricao_completa,
                'url': url
            }, 
            success: function(response) {
                alert("Jogo atualizado com sucesso!");
            },
            error: function(response) {
                alert("Houve um erro ao atualizar o jogo.");
            }
        });
    });
});
