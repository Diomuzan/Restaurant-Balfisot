const quantityButton = document.QuerySelectorAll('.input-group');
plusButtons.forEach(function(button) {
    button.addEventListener('click', function() {
        const quantityField = button.previousElementSibling;
        quantityField.value = parseInt(quantityField.value) + 1;
    });
});
const minusButtons = document.querySelectorAll('.minus-button');
minusButtons.forEach(function(button) {
    button.addEventListener('click', function() {
        const quantityField = button.nextElementSibling;
        quantityField.value = Math.max(parseInt(quantityField.value) - 1, 0);
    });
});
