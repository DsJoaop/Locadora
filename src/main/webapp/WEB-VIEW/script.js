const modal = document.querySelector('.modal-container');
let linksExcluir = document.querySelectorAll(".deletar a");

function openModal() {
    modal.classList.add('active');

    modal.onclick = e => {
        if (e.target.className.indexOf('modal-container') !== -1) {
            modal.classList.remove('active');
        }

    };
}

linksExcluir.forEach(function(link) {
    link.addEventListener("click", function(event) {
        event.preventDefault();

        let resposta = window.confirm("Tem certeza que deseja excluir?");

        if (resposta) {
            window.location.href = link.href;
        } else {
            alert("Exclusão cancelada.");
        }
    });
});
