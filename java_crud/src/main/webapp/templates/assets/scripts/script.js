function toggleSwitch() {
    // Cria uma constante para o elemento, nesse caso para o 'HTML'.
    const html = document.documentElement;

    /*
    Comando que funciona como um interruptor e verifica se "light" existe dentro das classes de 'HTML'.
    Caso exista, ele automaticamente remove a classe. Caso não exista, ele automaticamente adiciona.
    --- Um caso de condição if/else dentro de uma única linha.
    */
    html.classList.toggle("dark");
}