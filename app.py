import secrets
from flask import Flask, render_template, request, flash, redirect, url_for
import sqlite3


app = Flask(__name__, static_url_path='/static')
# Gera uma chave secreta hexadecimal de 16 bytes (32 caracteres)
app.secret_key = secrets.token_hex(16)  




# Cria um cursor
def get_connection():
    return sqlite3.connect('bd_gamerank.db')

def get_users_names():
    with get_connection() as conn: 
        cursor = conn.cursor() #usando o cursor em uma mesma thread
        cursor.execute('SELECT nome from usuario')
        # Recupere todos os resultados como uma lista de tuplas
        result = cursor.fetchall()

        names = []

        for r in result:
            name = r[0] #coluna 0 é a coluna nome armazenada no result
            names.append(name)
    
        return names





@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        name = request.form.get('nome')
        password = request.form.get('senha')

        if not name or not password:
            flash('Usuário ou senha não fornecidos. Tente novamente!', 'warning')
            return redirect(url_for('login'))

        with get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM usuario WHERE nome = ? AND senha = ?', (name, password))
            user = cursor.fetchone()

            if user is None:
                flash('Usuário não existe ou credenciais incorretas. Tente novamente!')
                return redirect(url_for('login'))
            else:
                flash('Login bem sucedido!', 'success')
                return redirect(url_for('home'))

    return render_template('html/register/login.html')



@app.context_processor
def inject_active():
    def is_active(endpoint): #recebe o endpoint (rota) e verifica se é igual o endpoint atual, se for ele retorna a classeactive, se não retorna vazio
        return 'active' if request.endpoint == endpoint else ''
    return dict(is_active=is_active)

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['nome']
        password = request.form['senha']
        confirmPassword = request.form['confirmar_senha']

        #exceção de formulário incompleto
        if name == "":
            flash('Preencha o campo Usuário!', 'warning')
        elif password == "":
            flash('Preencha o campo Senha!', 'warning')
        elif confirmPassword == "":
            flash('Preencha o campo Confirmar Senha!', 'warning')

        #exceção de nome inválido
        for n in get_users_names():
            if name == n:
                flash('Nome inválido. Tente novamente!', 'warning') 
                return redirect(url_for('register'))

        #exceção de senhas incompatíveis
        if password != confirmPassword:
            flash('Senhas diferentes. Tente novamente!')
            return redirect(url_for('register'))
        
        #Inserindo no bd
        with get_connection() as conn:
            try:
                cursor = conn.cursor()  
                cursor.execute('INSERT INTO usuario (nome, senha) VALUES (?, ?)', (name, confirmPassword))
                conn.commit() 
                flash('Usuário registrado com sucesso!', 'success')
            except:
                flash('Erro ao registrar o usuário. Tente novamente!', 'error')

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

@app.route('/bd')
def view_bd():
    users = get_users_names()
    return render_template('html/pages/view_bd.html', users=users)


# @app.route('/logo')
# def logo():
#     return render_template('html/pages/ranking.html')

if __name__ == '__main__':
    app.run(debug=True)
    app.run(host='0.0.0.0', port=5000)