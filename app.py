import secrets
from flask import Flask, render_template, request, flash, redirect, url_for, session, abort
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

def get_username_by_id(user_id):
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT nome FROM usuario WHERE id = ?', (user_id,))
        result = cursor.fetchone()
        if result:
            return result[0]
        else:
            return None 

def get_categories_infos():
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT id, nome, genero, ano_lancamento, descricao_curta, descricao_completa, url_imagem FROM jogos')
        result = cursor.fetchall()

        infos = []

        for row in result:
            id, nome, genero, ano_lancamento, descricao_curta, descricao_completa, url_imagem = row
            infos.append({'id': id, 'nome': nome, 'genero': genero, 'ano_lancamento': ano_lancamento, 'descricao_curta': descricao_curta, 'descricao_completa': descricao_completa, 'url_imagem': url_imagem})
    return infos

def get_games():
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM jogos')
        games = cursor.fetchall()
        return games
    
def get_wishlist_by_user_id(user_id):
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT jogos.id, jogos.nome, jogos.genero, jogos.ano_lancamento, jogos.descricao_curta, jogos.descricao_completa, jogos.url_imagem FROM lista_de_desejos JOIN jogos ON lista_de_desejos.id_jogo = jogos.id WHERE lista_de_desejos.id_usuario = ?', (user_id,))
        result = cursor.fetchall()

        wishlist = []

        for row in result:
            id, nome, genero, ano_lancamento, descricao_curta, descricao_completa, url_imagem = row
            wishlist.append({'id': id, 'nome': nome, 'genero': genero, 'ano_lancamento': ano_lancamento, 'descricao_curta': descricao_curta, 'descricao_completa': descricao_completa, 'url_imagem': url_imagem})
    
        return wishlist

def get_lista_de_desejos_by_user_id(user_id):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT jogos.*
        FROM lista_de_desejos
        JOIN jogos ON lista_de_desejos.id_jogo = jogos.id
        WHERE lista_de_desejos.id_usuario = ?
    """, (user_id,))
    rows = cur.fetchall()
    columns = [column[0] for column in cur.description]
    lista_de_desejos = [dict(zip(columns, row)) for row in rows]
    conn.close()
    return lista_de_desejos

def get_games_dict():
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM jogos')
        games = [dict(zip([column[0] for column in cursor.description], row)) for row in cursor.fetchall()]
        return games

def add_avaliacao(user_id, id_jogo, nota, comentario):
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('INSERT INTO avaliacao (nota, comentario, id_jogo, id_usuario) VALUES (?, ?, ?, ?)', (nota, comentario, id_jogo, user_id))
        conn.commit()

        recalcula_media_de_notas(id_jogo)

def get_media_de_notas():
    with get_connection() as conn:
        cur = conn.cursor()
        #caso o valor for NULL, substitui por 0
        cur.execute("""
            SELECT id_jogo, COALESCE(AVG(nota), 0.0) as media 
            FROM avaliacao
            GROUP BY id_jogo
        """)
        result = cur.fetchall()

        media_por_jogo = {}

        for row in result:
            id_jogo = row[0]
            media = row[1]

            media_por_jogo[id_jogo] = media
    return media_por_jogo

def recalcula_media_de_notas(id_jogo):
    with get_connection() as conn:
        cur = conn.cursor()
        #caso o valor for NULL, substitui por 0
        cur.execute("""
            SELECT COALESCE(AVG(nota), 0.0) as media 
            FROM avaliacao
            WHERE id_jogo = ?
        """, (id_jogo,))
        
        nova_media = cur.fetchone()[0]

        cur.execute("""
            UPDATE jogos
            SET nota_media = ?
            WHERE id = ?        
        """, (nova_media), (id_jogo))
        conn.commit()

def get_ranking():
    with get_connection() as conn:
        cur = conn.cursor()
        cur.execute("""
            SELECT jogos.nome, jogos.url_imagem, jogos.descricao_completa, jogos.nota_media, COUNT(avaliacao.id_jogo) as contagem
            FROM jogos
            JOIN avaliacao ON jogos.id = avaliacao.id_jogo
            GROUP BY jogos.id
            ORDER BY media DESC, contagem DESC
        """)
        columns = [column[0] for column in cur.description]
        return [dict(zip(columns, row)) for row in cur.fetchall()] 


 
def create_game(nome_jogo, lancamento_jogo, genero_jogo, descricao_curta, descricao_completa, url_imagem):
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('INSERT INTO jogos (nome, ano_lancamento, genero, descricao_curta, descricao_completa, url_imagem) VALUES (?, ?, ?, ?, ?, ?)',
                       (nome_jogo, lancamento_jogo, genero_jogo, descricao_curta, descricao_completa, url_imagem))
        conn.commit()

def delete_game(id_jogo):
    with get_connection() as conn:   
        cursor = conn.cursor()
        cursor.execute('DELETE FROM jogos WHERE id = ?', (id_jogo)) # definir para apagar com as dependências das foreinkeys que existe
        conn.commit()

def update_game(id_jogo, nome_jogo, lancamento_jogo, genero_jogo, descricao_curta, descricao_completa, url_imagem):  
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("""
        UPDATE jogos
        SET nome = ?,
        ano_lancamento = ?,
        genero = ?,
        descricao_curta = ?,
        descricao_completa = ?,
        nota_media = ?,
        url_imagem = ?
        WHERE id = ?')
        """), (nome_jogo, lancamento_jogo, genero_jogo, descricao_curta, descricao_completa, url_imagem, id_jogo)
        cursor.commit()





#>>>>>>>>>>ROTAS<<<<<<<<<<<<<

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
                user_id, user_name, _ = user
                session['user_id'] = user_id
                flash('Login bem sucedido!', 'success')
                if name == 'admin':
                    return redirect(url_for('adminpage'))  # Redireciona para a página do administrador se o nome do usuário for 'admin'
                else:
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
    games = get_games()
    return render_template('html/pages/categories.html', games=games)

@app.route('/home')
def home():
    return render_template('html/pages/homepage.html')

@app.route('/ranking')
def ranking():
    ranking = get_ranking()
    return render_template('html/pages/ranking.html', ranking=ranking)

@app.route('/profile', methods=['GET', 'POST'])
def profile():
    if 'user_id' in session:
        user_id = session['user_id']
        user_name = get_username_by_id(user_id)
        lista_de_desejos = get_lista_de_desejos_by_user_id(user_id)
        jogos = get_games_dict()  # Buscar todos os jogos
        if jogos is None:
            jogos = []
        if request.method == 'POST':
            id_jogo = request.form.get('jogo')
            nota = request.form.get('nota')
            comentario = request.form.get('comentario')
            add_avaliacao(user_id, id_jogo, nota, comentario)
            flash('Avaliação enviada com sucesso!', 'success')
            return redirect(url_for('profile'))  # Redireciona para a mesma página
        return render_template('html/pages/profile.html', name=user_name, lista_de_desejos=lista_de_desejos, jogos=jogos)
    else:
        flash('Você precisa fazer login para acessar esta página.', 'warning')
        return redirect(url_for('login'))

@app.route('/adminpage', methods=['GET', 'POST', 'UPDATE', 'DELETE'])
def adminpage():
    if request.method == 'POST':
        nome = request.form['nome']
        lancamento = request.form['lancamento']
        genero = request.form['genero']
        descricao_curta = request.form['descricao_curta']
        descricao_completa = request.form['descricao_completa']
        url_imagem = request.form['url_imagem']

        # fazer validação dos campos
        if nome == "":
            flash('Preencha o campo Nome!', 'warning')
        elif lancamento == "":
            flash('Preencha o campo Ano de lançamento!', 'warning')
        elif genero == "":
            flash('Preencha o campo Gênero!', 'warning')
        elif descricao_curta == "":
            flash('Preencha o campo Descrição curta!', 'warning')
        elif descricao_completa == "":
            flash('Preencha o campo de Descrição completa!', 'warning')
        elif url_imagem == "":
            flash('Preencha o campo de URL da imagem!', 'warning')

        #inserção
        create_game(nome, lancamento, genero, descricao_curta, descricao_completa, url_imagem)
        flash(f'Jogo "{nome}" adicionado com sucesso!', 'success')
            
    if request.method == 'UPDATE':
        id = request.form['id']
        nome = request.form['nome']
        lancamento = request.form['lancamento']
        genero = request.form['genero']
        descricao_curta = request.form['descricao_curta']
        descricao_completa = request.form['descricao_completa']
        url_imagem = request.form['url_imagem']
        
        # fazer validação dos campos
        if id == "":
            flash('Preencha o campo ID!', 'warning')
        elif nome == "":
            flash('Preencha o campo Nome!', 'warning')
        elif lancamento == "":
            flash('Preencha o campo Ano de lançamento!', 'warning')
        elif genero == "":
            flash('Preencha o campo Gênero!', 'warning')
        elif descricao_curta == "":
            flash('Preencha o campo Descrição curta!', 'warning')
        elif descricao_completa == "":
            flash('Preencha o campo de Descrição completa!', 'warning')
        elif url_imagem == "":
            flash('Preencha o campo de URL da imagem!', 'warning')

        # update 
        update_game(id, nome, lancamento, genero, descricao_curta, descricao_completa, url_imagem)
        flash(f'Jogo "{nome}" atualizado com sucesso! (ID: {id})', 'success')
        
        return 0

    games = get_games()
    return render_template('html/pages/adminpage.html', games=games)

""" @app.route('/submit_data', methods=['POST'])
def submit_data():
    nome = request.form['nome']
    ano_lancamento = request.form['ano_lancamento']
    genero = request.form['genero']
    descricao_curta = request.form['descricao_curta']
    descricao_completa = request.form['descricao_completa']
    url_imagem = request.form['url_imagem']

    with get_connection() as conn:
        try:
            cursor = conn.cursor()
            cursor.execute('INSERT INTO jogos (nome, ano_lancamento, genero, descricao_curta, descricao_completa, url_imagem) VALUES (?, ?, ?, ?, ?, ?)', (nome, ano_lancamento, genero, descricao_curta, descricao_completa, url_imagem))
            conn.commit()
            flash('Dados inseridos com sucesso!', 'success')
        except:
            flash('Erro ao inserir os dados. Tente novamente!', 'error')

    return redirect(url_for('adminpage'))
# inserção dos jogos está aqui """

@app.route('/add_to_wishlist', methods=['POST'])
def add_to_wishlist():
    if 'user_id' not in session:
        abort(403)  # Retorna um erro 403 se o usuário não estiver logado

    game_id = request.form.get('game_id')
    user_id = session['user_id']

    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('INSERT INTO lista_de_desejos (id_jogo, id_usuario) VALUES (?, ?)', (game_id, user_id))
        conn.commit()

    return '', 204  # Retorna um status 204 (No Content) para indicar que a operação foi bem-sucedida











if __name__ == '__main__':
    app.run(debug=True)