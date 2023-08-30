const modalAtor = document.querySelector('#container-ator');

let novoNome = document.querySelector('#novo-nome')
let idAtual = document.querySelector('#id-ator')

function openModalAtor(id, nome) {
    modalAtor.classList.add('active');

    idAtual.value = id;                 // Pega o valor do id que foi passado no parâmetro e seta no campo da página.
    novoNome.value = nome;              // Pega o valor do nome que foi passado no parâmetro e seta no campo da página.

    modalAtor.onclick = e => {
        if (e.target.className.indexOf('modal-container') !== -1) {
            modalAtor.classList.remove('active');

            idAtual.value = '';         // Limpa o valor do campo do id
            novoNome.value = '';        // Limpa o valor do campo do nome
        }
    };
}
