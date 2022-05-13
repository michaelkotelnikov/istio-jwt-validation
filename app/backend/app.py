from flask import Flask
import random

app = Flask(__name__)


@app.route('/id')
def company_id():
    n = random.randint(0,1000)
    print(n)
    return str(n)


if __name__ == '__main__':
    app.run()
