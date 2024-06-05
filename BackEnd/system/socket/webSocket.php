<?php
require __DIR__ . '/vendor/autoload.php';

use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;
use Ratchet\Server\IoServer;
use Ratchet\WebSocket\WsServer;

class MyWebSocket implements MessageComponentInterface {
    protected $clients;

    public function __construct() {
        $this->clients = new \SplObjectStorage;
    }

    public function onOpen(ConnectionInterface $conn) {
        $this->clients->attach($conn);
        echo "Client connected ({$conn->resourceId})\n";
    }

    public function onMessage(ConnectionInterface $from, $msg) {
        echo "Received message from ({$from->resourceId}): {$msg}\n";

        // Itt kezelheted a beérkezett üzenetet

        // Példa: küldj egy választ vissza a kliensnek
        $from->send("WebSocket enabled: true");
    }

    public function onClose(ConnectionInterface $conn) {
        $this->clients->detach($conn);
        echo "Client ({$conn->resourceId}) disconnected\n";
    }

    public function onError(ConnectionInterface $conn, \Exception $e) {
        echo "An error occurred: {$e->getMessage()}\n";
        $conn->close();
    }
}

$server = IoServer::factory(
    new WsServer(new MyWebSocket()),
    8080
);

echo "WebSocket server is running...\n";

$server->run();
