const modalClasse = document.querySelector('#container-classe');

let novoNome = document.querySelector('#novo-nome');
let novoValor = document.querySelector('#novo-valor');
let idAtual = document.querySelector('#id-classe');
let novaData = document.querySelector('#nova-data');

function openModalClasse(id, nome, valor, data) {
    modalClasse.classList.add('active');

    idAtual.value = id;         // Pega o valor do id que foi passado no parâmetro e seta no campo da página.
    novoNome.value = nome;      // Pega o valor do nome que foi passado no parâmetro e seta no campo da página.
    novoValor.value = valor;    // Pega o valor do valor que foi passado no parâmetro e seta no campo da página.
    novaData.value = data;      // Pega o valor da data que foi passada no parâmetro e seta no campo da página.

    modalClasse.onclick = e => {
        if (e.target.className.indexOf('modal-container') !== -1) {
            modalClasse.classList.remove('active');

            idAtual.value = '';     // Limpa o valor do campo do id
            novoNome.value = '';    // Limpa o valor do campo do nome
            novaData.value = '';    // Limpa o valor do campo da data
            novoValor.value = '';   // Limpa o valor do campo do valor
        }
    };
}
