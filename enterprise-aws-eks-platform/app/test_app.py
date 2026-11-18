from app import app


def test_root_returns_service_details():
    client = app.test_client()
    response = client.get("/")
    assert response.status_code == 200
    assert response.json["service"] == "enterprise-platform-api"


def test_health_and_readiness():
    client = app.test_client()
    assert client.get("/health").status_code == 200
    assert client.get("/ready").status_code == 200
