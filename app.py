from flask import Flask, render_template

app = Flask(__name__, static_url_path='/static')

@app.route('/')
def login():
    return render_template('html/register/login.html')

@app.route('/register')
def register():
    return render_template('html/register/register.html')

@app.route('/categories')
def categories():
    return render_template('html/pages/categories.html')

@app.route('/home')
def home():
    return render_template('html/pages/homepage.html')

@app.route('/ranking')
def ranking():
    return render_template('html/pages/ranking.html')

# @app.route('/logo')
# def logo():
#     return render_template('html/pages/ranking.html')


if __name__ == '__main__':
    app.run(debug=True)