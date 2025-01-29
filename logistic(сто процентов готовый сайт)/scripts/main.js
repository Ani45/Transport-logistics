// Элементы
const overlay = document.getElementById('overlay');
const closeBtn = document.getElementById('close-btn');
const form = document.getElementById('main-form');

// Показать оверлей
function showOverlay() {
    overlay.classList.add('visible');
}

// Скрыть оверлей
function hideOverlay() {
    overlay.classList.remove('visible');
}

// Обработчик отправки формы
form.addEventListener('submit', function (event) {
    event.preventDefault(); // Останавливаем отправку формы
    showOverlay(); // Показываем оверлей
});

closeBtn.addEventListener('click', hideOverlay);

