const modal = document.querySelector('.modal-container');
const tbody = document.querySelector('tbody');
const sNome = document.querySelector('#m-nome');
const btnSalvar = document.querySelector('#btnSalvar');

function openModal(edit = false, index = 0) {
    modal.classList.add('active');

    modal.onclick = e => {
        if (e.target.className.indexOf('modal-container') !== -1) {
            modal.classList.remove('active');
        }
    };
}

btnSalvar.onclick = e => {
    if (sNome.value === '') {
        return;
    }

    e.preventDefault();

    modal.classList.remove('active');
   /*  insertItem({ nome: sNome.value }); // Simula inserção na tabela */
    sNome.value = ''; // Limpa o campo de nome
};

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