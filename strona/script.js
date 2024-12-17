function showReport() {
    var reportTable = document.getElementById("sales-report");
    reportTable.style.display = "table"; // Zmiana display na "table" pokazuje raport
}

// Ustawienie, aby po kliknięciu przycisku formularza uruchomić showReport()
document.querySelector("form").addEventListener("submit", function (event) {
    event.preventDefault();  // Zapobieganie domyślnemu wysłaniu formularza
    showReport(); // Wywołanie funkcji do pokazania raportu
});