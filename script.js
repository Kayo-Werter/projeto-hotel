//botão de topo tela principal 
document.addEventListener("DOMContentLoaded", function () {
    var btnTop = document.getElementById("btnTop");

    // oculta o botão dependendo da posição da página
    window.onscroll = function () {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            btnTop.style.display = "block";
        } else {
            btnTop.style.display = "none";
        }
    };

    // rolar suavemente para o topo
    btnTop.addEventListener("click", function () {
        document.body.scrollTop = 0; // Para navegadores da web
        document.documentElement.scrollTop = 0; // Para IE/Edge
    });
});