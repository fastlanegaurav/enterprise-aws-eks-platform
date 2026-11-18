# Platform API

Minimal Flask service used to validate the platform delivery path.

- `GET /`: service metadata
- `GET /health`: liveness endpoint
- `GET /ready`: readiness endpoint
- `GET /metrics-info`: basic uptime information (not a Prometheus exporter)

Run locally with `pip install -r requirements-dev.txt && pytest -q && python app.py`.
