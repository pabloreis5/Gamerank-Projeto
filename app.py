from flask import Flask, render_template, request
import mysql.connector


app = Flask(__name__, static_url_path='/static')

# Configuração do banco de dados
db_config = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'gamerank',
    'password': '6337311',
    'database': 'gamerank_bd'
}

# Função para criar uma conexão com o banco de dados
def get_db_connection():
    conexao = mysql.connector.connect(**db_config)
    return conexao

def test_db_connection():
    conexao = None
    try:
        conexao = get_db_connection()
        cursor = conexao.cursor()
        cursor.execute("SELECT 1")
        result = cursor.fetchone()
        if result:
            return "Conexão com o banco de dados foi bem-sucedida."
        else:
            return "Conexão com o banco de dados falhou."
    except mysql.connector.Error as e:
        return f"Erro ao conectar ao banco de dados: {e}"
    finally:
        if conexao and conexao.is_connected():
            if 'cursor' in locals():
                cursor.close()
            conexao.close()

# Teste a conexão
print(test_db_connection())





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