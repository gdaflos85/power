<?php
header('Content-Type: application/json; charset=utf-8');
require_once __DIR__ . '/configuration.php';

$mysqli = new mysqli($db_host, $db_username, $db_password, $db_name);
if ($mysqli->connect_error) {
    die(json_encode(['error' => $mysqli->connect_error]));
}
$mysqli->set_charset("utf8mb4");

$res = $mysqli->query("SELECT id, name, url FROM rsthemes_pages WHERE url LIKE '%reseller%'");
$pages = [];
while ($row = $res->fetch_assoc()) {
    $pages[] = $row;
}

$sections = [];
if (!empty($pages)) {
    $page_id = $pages[0]['id'];
    $sres = $mysqli->query("SELECT id, page_id, section, settings FROM rsthemes_page_sections WHERE page_id = $page_id");
    while ($srow = $sres->fetch_assoc()) {
        $sections[] = $srow;
    }
}

echo json_encode(['pages' => $pages, 'sections' => $sections], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
@unlink(__FILE__);
