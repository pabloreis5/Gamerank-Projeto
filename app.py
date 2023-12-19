from flask import Flask, render_template

app = Flask(__name__, static_url_path='/static')

@app.route('/')
def login():
    return render_template('html/register/login.html')

if __name__ == '__main__':
    app.run(debug=True)