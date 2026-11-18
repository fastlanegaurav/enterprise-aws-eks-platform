from flask import Flask, jsonify
import os
import time

app = Flask(__name__)
START_TIME = time.time()
VERSION = os.getenv("APP_VERSION", "dev")


@app.get("/")
def index():
    return jsonify(
        service="enterprise-platform-api",
        version=VERSION,
        message="Hello from the Enterprise AWS EKS Platform",
    )


@app.get("/health")
def health():
    return jsonify(status="healthy"), 200


@app.get("/ready")
def ready():
    return jsonify(status="ready"), 200


@app.get("/metrics-info")
def metrics_info():
    # Informational endpoint only; integrate a Prometheus client for real metrics.
    return jsonify(uptime_seconds=round(time.time() - START_TIME, 2)), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8080")))
