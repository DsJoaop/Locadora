const modalAtor = document.querySelector('#container-ator');

let novoNome = document.querySelector('#novo-nome')
let idAtual = document.querySelector('#id-ator')



function openModalAtor(id, nome) {
    modalAtor.classList.add('active');

    idAtual.value = id; // Set the value of id-ator input field
    novoNome.value = nome; // Set the value of novo-nome input field

    modalAtor.onclick = e => {
        if (e.target.className.indexOf('modal-container') !== -1) {
            modalAtor.classList.remove('active');

            idAtual.value = ''; // Clear the value of id-ator input field
            novoNome.value = ''; // Clear the value of novo-nome input field
        }


    };


}
