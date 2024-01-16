from flask import Flask, render_template, request
import mysql.connector


app = Flask(__name__, static_url_path='/static')

# Configuração do banco de dados
db_config = {
    'host': 'servidor',
    'user': 'usuario',
    'password': 'senha',
    'database': 'nome_do_banco_de_dados'
}

# Função para criar uma conexão com o banco de dados
def get_db_connection():
    conexao = mysql.connector.connect(**db_config)
    return conexao



@app.route('/')
def login():
    return render_template('html/register/login.html')

@app.context_processor
def inject_active():
    def is_active(endpoint): #recebe o endpoint (rota) e verifica se é igual o endpoint atual, se for ele retorna a classeactive, se não retorna vazio
        return 'active' if request.endpoint == endpoint else ''
    return dict(is_active=is_active)

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

@app.route('/profile')
def profile():
    return render_template('html/pages/profile.html')

# @app.route('/logo')
# def logo():
#     return render_template('html/pages/ranking.html')

if __name__ == '__main__':
    app.run(debug=True)