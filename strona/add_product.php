<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Pobieranie danych z formularza
    $nazwa = $_POST['nazwa'];
    $opis = $_POST['opis'];
    $cena = $_POST['cena'];



    // Sprawdzanie, czy wszystkie dane są wypełnione
    if (empty($nazwa) || empty($opis) || empty($cena)) {
        echo "Wszystkie pola muszą być wypełnione.";
    } else {
        // Zapytanie SQL do dodania nowego produktu
        $query = "INSERT INTO produkty (nazwa_produktu, opis, cena) 
                  VALUES ('$nazwa', '$opis', '$cena')";

        // Wykonanie zapytania
        if (mysqli_query($conn, $query)) {
            echo "Produkt został dodany pomyślnie.";
        } else {
            echo "Błąd: " . mysqli_error($conn);
        }
    }
}
?>


<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <title>Dodaj Produkt</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="header">
        <div class="baner">
            <img src="shop-icon.png" alt="logo sklepu" class="logo">
            <h1>Sklep Internetowy</h1>
            <a href="main.php" class="back-button">Powrót</a>
        </div>
    </div>

    <div class="container">
        <div class="content">
            <h1>Dodaj Produkt</h1>
            <form method="POST" action="add_product.php">
                <label for="nazwa">Nazwa produktu:</label>
                <input type="text" name="nazwa" required><br><br>

                <label for="opis">Opis produktu:</label>
                <textarea name="opis" rows="4" required></textarea><br><br>

                <label for="cena">Cena:</label>
                <input type="number" name="cena" step="0.01" required><br><br>

                <button type="submit">Dodaj produkt</button>
            </form>
        </div>
    </div>


</body>

</html>