const modal = document.querySelector('.modal-container');
const modalAtor = document.querySelector('.modal-container-editAtor');

let novoNome = document.querySelector('#novo-nome')
let idAtual = document.querySelector('#id-ator')


function openModal() {
    modal.classList.add('active');

    modal.onclick = e => {
        if (e.target.className.indexOf('modal-container') !== -1) {
            modal.classList.remove('active');
        }

    };
}

function openModalAtor(id, nome) {
    modalAtor.classList.add('active');

    idAtual.value = id; // Set the value of id-ator input field
    novoNome.value = nome; // Set the value of novo-nome input field
}

// Modify the click event listener for modalAtor to clear the values
modalAtor.addEventListener('click', e => {
    if (e.target.className.includes('modal-container-editAtor')) {
        modalAtor.classList.remove('active');
        idAtual.value = ''; // Clear the value of id-ator input field
        novoNome.value = ''; // Clear the value of novo-nome input field
    }
});
