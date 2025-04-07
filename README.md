# Flask API Prediction Service

Prosty serwis API zbudowany przy użyciu Flask, zawiera model - regułe decyzyjną, który przyjmuje dwa parametry wejściowe w URL i wykonuje predykcję na podstawie tych wartości.

## Środowisko
Aby uruchomić aplikację należ wykonać 2 kroki po sklonowaniu repo.
```
cd Simple-Flask-app
docker-compose up
```

## Działanie API

API przyjmuje dwa parametry wejściowe (`val1` i `val2`) w URL, a następnie sumuje te wartości. Jeśli suma jest większa niż wartość progowa (5.8), zwraca wynik predykcji równy `1`, w przeciwnym razie `0`.

#### Endpoint:
`GET /api/v1.0/predict`

Przykładowy request w Python:
```python
params = {
  'val1': 3.2,
  'val2': 2.7
}
url = "http://127.0.0.1:5000/api/v1.0/predict"
response = requests.get(url, params=params)

if response.status_code == 200:
    print(response.json())
else:
    print(f"Error: {response.status_code}")
```
Odpowiedź:
```json
{
  "predict": 1,
  "features": {
    "val1": 3.2,
    "val2": 2.7
  }
}
