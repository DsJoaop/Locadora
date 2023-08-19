


function openTab(tabName) {
    var i, tabContent;
    tabContent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabContent.length; i++) {
      tabContent[i].style.display = "none";
    }
    document.getElementById(tabName).style.display = "block";
  }
  
  document.getElementById("ator-form").addEventListener("submit", function(event) {
    event.preventDefault();
    
    // Obtém o valor do campo
    var nomeAtor = document.getElementById("ator-nome").value;
    
    // Realiza validação básica (campo obrigatório)
    if (nomeAtor === "") {
        alert("Por favor, preencha o campo obrigatório.");
        return;
    }
    
    // Aqui você pode adicionar lógica de validação mais específica para o nome do ator
    
    // Se tudo estiver válido, você pode prosseguir com o envio do formulário
    alert("Ator cadastrado com sucesso!");
    document.getElementById("ator-form").reset();
});

document.getElementById("classe-form").addEventListener("submit", function(event) {
    event.preventDefault();
    
    // Obtém os valores dos campos
    var nomeClasse = document.getElementById("classe-nome").value;
    var valorClasse = parseFloat(document.getElementById("classe-valor").value);
    var dataDevolucaoClasse = document.getElementById("classe-data-devolucao").value;
    
    // Realiza validação básica (campos obrigatórios)
    if (nomeClasse === "" || isNaN(valorClasse) || dataDevolucaoClasse === "") {
        alert("Por favor, preencha todos os campos obrigatórios no formato exigido.");
        return;
    }
    
    // Validação do valor numérico
    if (valorClasse <= 0 ) {
        alert("O valor da classe deve ser maior que zero.");
        return;
    }
    
    // Validação do formato de data
    var today = new Date();
    var selectedDate = new Date(dataDevolucaoClasse);
    if (selectedDate <= today) {
        alert("A data de devolução deve ser posterior à data atual.");
        return;
    }
    
    // Se tudo estiver válido, você pode prosseguir com o envio do formulário
    alert("Classe cadastrada com sucesso!");
    document.getElementById("classe-form").reset();
});
  
  openTab('ator');