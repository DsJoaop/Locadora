const modalClasse = document.querySelector('#container-classe');

let novoNome = document.querySelector('#novo-nome');
let novoValor = document.querySelector('#novo-valor');
let idAtual = document.querySelector('#id-classe');
let novaData = document.querySelector('#nova-data');



function openModalClasse(id, nome, valor, data) {
    modalClasse.classList.add('active');

    idAtual.value = id; // Set the value of id-ator input field
    novoNome.value = nome; // Set the value of novo-nome input field
    novaData.value = data;
    novoValor.value = valor;


    modalClasse.onclick = e => {
        if (e.target.className.indexOf('modal-container') !== -1) {
            modalClasse.classList.remove('active');

            idAtual.value = ''; // Set the value of id-ator input field
            novoNome.value = ''; // Set the value of novo-nome input field
            novaData.value = '';
            novoValor.value = '';
        }


    };

}
