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

    modalAtor.onclick = e => {
        if (e.target.className.indexOf('modal-container-editAtor') !== -1) {
            modalAtor.classList.remove('active');
        }

        nome = novoNome.value;
        id = idAtual.value;
    };
}




/*
function insertItem(item) {
    let tr = document.createElement('tr');

    tr.innerHTML = `
    <td>${item.id}</td>
    <td>${item.nome}</td>
    <td class="acao">
      <button onclick="editItem(${item.id})"><i class='bx bx-edit' ></i></button>
    </td>
    <td class="acao">
      <button onclick="deleteItem(${item.id})"><i class='bx bx-trash'></i></button>
    </td>
  `;

    tbody.appendChild(tr);
}
*/
/*
function loadItens() {
    fetch('AtorController')
        .then(response => response.json())
        .then(data => {
            tbody.innerHTML = '';
            data.forEach(item => insertItem(item));
        })
        .catch(error => {
            console.error('Erro ao obter dados:', error);
        });
}

loadItens();
*/