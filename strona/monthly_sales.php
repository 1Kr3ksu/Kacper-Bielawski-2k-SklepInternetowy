<?php
include 'db_connect.php';

// Pobranie miesiąca z parametru GET lub ustawienie domyślnej wartości
$miesiac = isset($_GET['miesiac']) ? $_GET['miesiac'] : date('Y-m');

// Tworzenie zapytania SQL
$query = "SELECT p.nazwa_produktu AS produkt, 
                  SUM(p.cena * z.ilosc) AS suma_sprzedazy, 
                  COUNT(DISTINCT z.order_id) AS liczba_zamowien
           FROM zamówienia z
           INNER JOIN produkty p ON z.produkt_id = p.produkt_id
           WHERE DATE_FORMAT(z.data_zamowienia, '%Y-%m') = '$miesiac'
           GROUP BY p.nazwa_produktu
           ORDER BY suma_sprzedazy DESC;";




// Wykonanie zapytania
$result = mysqli_query($conn, $query);

// Sprawdzenie, czy zapytanie zostało wykonane poprawnie
if (!$result) {
    die("Błąd zapytania SQL: " . mysqli_error($conn));
}
?>

<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <title>Raport Miesięcznej Sprzedaży</title>
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
    <h2>Raport Miesięcznej Sprzedaży</h2>
    <form method="GET" action="monthly_sales.php" class="sales-report-form">
        <label for="miesiac">Wybierz miesiąc:</label>
        <input type="month" id="miesiac" name="miesiac" value="<?php echo htmlspecialchars($miesiac); ?>">
        <button type="submit">Pokaż raport</button>
    </form>
    <br>
    <table id="sales-report" border="1" style="display: none;">
        <tr>
            <th>Produkt</th>
            <th>Suma Sprzedaży (PLN)</th>
            <th>Liczba Zamówień</th>
        </tr>
        <?php
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row['produkt'] . "</td>";
                echo "<td>" . number_format($row['suma_sprzedazy'], 2) . "</td>";
                echo "<td>" . $row['liczba_zamowien'] . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='3'>Brak danych dla wybranego miesiąca.</td></tr>";
        }
        ?>
    </table>
    <script src="script.js"></script>
</body>

</html>