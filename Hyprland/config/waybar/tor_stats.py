import stem.control

def get_tor_stats():
    try:
        # Conectar al controlador de Tor
        controller = stem.control.Controller.from_port(port=9051)
        controller.authenticate()

        # Obtener el estado de Tor
        tor_status = controller.get_info("status/bootstrap-phase")
        is_circuit_established = tor_status == "CIRCUIT_ESTABLISHED"

        # Obtener las métricas de subida y bajada
        if is_circuit_established:
            tor_stats = controller.get_info("net/status")
            upload_rate = tor_stats["entry-guards"]["0"]["read"]
            download_rate = tor_stats["exit-relays"]["0"]["written"]
        else:
            upload_rate = 0
            download_rate = 0

        # Imprimir las métricas
        print(f"↓ {download_rate} ↑ {upload_rate}")

    except stem.SocketError as e:
        print(f"Error al conectar al controlador de Tor: {str(e)}")

if __name__ == "__main__":
    get_tor_stats()
