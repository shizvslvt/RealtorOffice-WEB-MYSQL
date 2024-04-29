<?php
function errorHandler($exception) {
    // Получение абсолютного пути к файлу с ошибкой
    $file = $exception->getFile();

    // Получение пути к корню проекта
    $root = $_SERVER['DOCUMENT_ROOT'];

    // Удаление части пути перед корнем проекта
    $relative_path = str_replace($root, '', $file);

    // Получение номера строки с ошибкой
    $line = $exception->getLine();

    // Вывод информации об ошибке
    echo '<div class="error-message">Error in ' . $relative_path . ' on line ' . $line . ': ' . $exception->getMessage() . '</div>';
}


set_exception_handler('errorHandler');