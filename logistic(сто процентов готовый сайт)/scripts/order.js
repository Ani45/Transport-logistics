const progressBar = document.getElementById('progressBar');
const totalSumSpan = document.getElementById('totalSum');
const currentKmSpan = document.getElementById('currentKm');
const orderForm = document.getElementById('orderForm');

progressBar.addEventListener('input', () => {
    const distance = parseInt(progressBar.value, 10); // Текущее значение range
    const cost = distance * 150; // Стоимость
    currentKmSpan.textContent = `${distance} км`; // Обновляем расстояние
    totalSumSpan.textContent = `Сумма: ${cost} руб.`; // Обновляем стоимость
});

// Сохранение данных в localStorage при отправке формы
orderForm.addEventListener('submit', (event) => {
    event.preventDefault();

    const startPoint = document.getElementById('startPoint').value;
    const endPoint = document.getElementById('endPoint').value;
    const weight = document.getElementById('weight').value;
    const distance = parseInt(progressBar.value, 10);
    const cost = distance * 150;

    // Сохраняем данные в localStorage
    const orders = JSON.parse(localStorage.getItem('orders')) || [];
    orders.push({ startPoint, endPoint, weight, distance, cost });
    localStorage.setItem('orders', JSON.stringify(orders));

    // Переход на страницу с заказами
    window.location.href = 'profile.html';
});
