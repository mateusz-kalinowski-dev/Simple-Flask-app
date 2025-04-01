from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/api/v1.0/predict', methods=['GET'])
def predict():
    
    value1 = request.args.get("val1", 0, type=float)  # tutaj leci int
    value2 = request.args.get("val2", 0, type=float)
    target = 5.8
    ans = 0
    if value1 + value2 > target:
        ans = 1
    dict = {"predict": ans,
            "features": {
                "val1": value1,
                "val2": value2
            }} 
    return jsonify(dict)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
else:
    pass
