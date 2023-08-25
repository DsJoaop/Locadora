const modal = document.querySelector('.modal-container');
let linksExcluir = document.querySelectorAll(".deletar a");
const popup = document.querySelector('.popup-exclusao');
const btSim = document.getElementById('confirmar-exclusao')
const btNao = document.getElementById('rejeitar-exclusao')
let btSimClick = false;
let btNaoClick = false;


function openModal() {
    modal.classList.add('active');

    modal.onclick = e => {
        if (e.target.className.indexOf('modal-container') !== -1) {
            modal.classList.remove('active');
        }

    };
}

btNao.addEventListener('click', function () {
    btNaoClick = true;
});

btSim.addEventListener('click', function () {
    btSimClick = true;
});


linksExcluir.forEach(function (link) {
    link.addEventListener("click", function (event) {
        event.preventDefault();
        popup.classList.add('active');

        popup.onclick = e => {
            if (e.target.className.indexOf('modal-container') !== -1) {
                popup.classList.remove('active');
            } else if (btSimClick) {
                window.location.href = link.href;
                popup.classList.remove('active');
                btSimClick = false;
                btNaoClick = false;
            } else if (btNaoClick) {
                popup.classList.remove('active');
                btSimClick = false;
                btNaoClick = false;
            }


        }
    });
});


