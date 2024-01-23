CREATE DATABASE gamerank
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;

USE gamerank;

-- Cria tabela de Jogos
CREATE TABLE jogos (
	id INT NOT NULL AUTO_INCREMENT,
    nome varchar(50) NOT NULL,
	ano_lancamento INT,
    genero VARCHAR(20),  
    descricao_curta VARCHAR(200),
	descricao_completa VARCHAR(300),
    nota_media DECIMAL(4, 2),
    url_imagem VARCHAR(50),
    PRIMARY KEY(id)
) DEFAULT CHARSET = utf8;


-- Cria tabela de Usuário
CREATE TABLE usuario (
	id INT NOT NULL AUTO_INCREMENT,
    nome varchar(50) NOT NULL, 
    senha varchar(15) NOT NULL,
    PRIMARY KEY(id)
) DEFAULT CHARSET = utf8;


-- Cria tabela de Avaliações
CREATE TABLE avaliacao (
	id INT NOT NULL AUTO_INCREMENT,
    nota INT not null,
    comentario varchar(500),
	id_jogo INT NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_jogo) REFERENCES jogos(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
) DEFAULT CHARSET = utf8;


-- Cria tabela de Lista de Desejos
CREATE TABLE lista_de_desejos (
	id_jogo INT NOT NULL,
    id_usuario INT NOT NULL,
	FOREIGN KEY(id_jogo) REFERENCES jogos(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
) DEFAULT CHARSET = utf8;


-- Saga resident evil

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
values('Resident Evil 2 Remake', 'Survival horror', 'Resident Evil 2, chamado no Japão de Biohazard RE:2, é um jogo eletrônico de survival horror desenvolvido e publicado pela Capcom, sendo um remake do jogo original de 1998.', 
'Resident Evil 2 é uma recriação do Resident Evil 2 original lançado para o PlayStation em 1998. Ao contrário do original, que usa controles angulares de câmera fixa, esta recriação apresenta uma jogabilidade de tiro em terceira pessoa semelhante à Resident Evil 4 e sucessores. A história se passa na fictícia Raccoon City em Setembro de 1998, onde a Corporação Umbrella causa um surto de um vírus conhecido como G Vírus na cidade e transformou toda a cidade em zumbis.', 
'https://cdn2.steamgriddb.com/thumb/45d2c6868b544067879a7f6b7f327c86.jpg', '2019');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
values('Resident Evil 0','Survival horror','Resident Evil Zero é um jogo eletrônico de survival horror que foi desenvolvido e publicado pela Capcom para o Nintendo GameCube, em 2002. É o quinto jogo da série principal de Resident Evil.',
'Resident Evil 0 revela a verdade sobre o Incidente da Mansão, o catalisador da série Resident Evil. Esta versão remasterizada atualiza o game original com belos gráficos HD e som 5.1, além de opção para um controle modernizado e compatibilidade com TV widescreen. Prepare-se para descobrir os terríveis segredos que se escondem nas origens do mal.',
'https://cdn2.steamgriddb.com/thumb/f0897e959b9ad043dbdc11f4b8f9a115.jpg','2002');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil 3: Nemesis', 'Survival horror', 'Resident Evil 3: Nemesis é um jogo eletrônico de survival horror lançado pela Capcom em 1999 para o PlayStation. É o terceiro jogo principal da série Resident Evil.', 
'O jogo segue Jill Valentine enquanto ela tenta escapar de uma cidade destruída por um vírus mutante que transformou sua população em zumbis. Ao longo do caminho, ela é perseguida por uma criatura poderosa chamada Nemesis. Resident Evil 3: Nemesis é conhecido por sua ação intensa e pela introdução do sistema de escolhas que afetam a história.', 
'https://cdn2.steamgriddb.com/thumb/ad539ad730faa3ecb315e0ebc9a97dbc.png', '1999');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil 4','Survival horror','Resident Evil 4 é um jogo de survival horror lançado pela Capcom em 2005 para várias plataformas. Ele marca uma mudança significativa na jogabilidade da série, com um foco maior na ação e uma perspectiva de terceira pessoa sobre o ombro.',
'Resident Evil 4 segue Leon S. Kennedy em uma missão para resgatar a filha do presidente dos EUA, que foi sequestrada por um culto misterioso na Europa. O jogo é elogiado por sua jogabilidade inovadora e atmosfera envolvente.', 
'https://cdn2.steamgriddb.com/thumb/4c55cc422cab2389c9f1d88eda34da57.jpg', '2005');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil 7: Biohazard','Survival horror','Resident Evil 7: Biohazard é um jogo de survival horror lançado em 2017 pela Capcom. Ele marca o retorno da série às suas raízes de horror mais atmosférico, desta vez com uma perspectiva em primeira pessoa.',
'No jogo, os jogadores controlam Ethan Winters, que procura sua esposa desaparecida em uma mansão isolada na Louisiana. Resident Evil 7: Biohazard é elogiado por seu clima tenso e mudança de estilo.', 
'https://cdn2.steamgriddb.com/thumb/1bd92fc1a8d57db76db351e77904387e.jpg', '2017');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil 5','Survival horror','Resident Evil 5 é um jogo de survival horror lançado pela Capcom em 2009 para várias plataformas. O jogo segue Chris Redfield e Sheva Alomar em uma missão para combater uma ameaça bioterrorista na África.',
'O jogo introduz a mecânica de cooperação, permitindo que dois jogadores joguem juntos online ou offline. Resident Evil 5 recebeu elogios pela jogabilidade e gráficos, mas também alguma controvérsia por sua abordagem mais orientada para a ação.', 
'https://cdn2.steamgriddb.com/thumb/4160090a26bf2b0296821aed16f33f51.jpg', '2009');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil 6','Survival horror','Resident Evil 6 é um jogo de survival horror lançado pela Capcom em 2012 para várias plataformas. O jogo apresenta quatro histórias interconectadas, cada uma com um par de personagens jogáveis.',
'Resident Evil 6 recebeu críticas mistas, sendo elogiado por alguns aspectos, como gráficos e mecânica de combate, mas criticado por sua narrativa complexa e afastamento dos elementos de horror tradicionais da série.', 
'https://cdn2.steamgriddb.com/thumb/93769b104eeff5290cbc38eb2718c0b9.jpg', '2012');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil Village','Survival horror','Resident Evil Village é um jogo de survival horror lançado pela Capcom em 2021 para várias plataformas. O jogo é uma sequência direta de Resident Evil 7: Biohazard e segue Ethan Winters em uma nova aventura sombria.',
'Os jogadores enfrentarão horrores em uma vila misteriosa enquanto tentam resgatar sua filha sequestrada. Resident Evil Village é elogiado por sua atmosfera envolvente e design de níveis.', 
'https://cdn2.steamgriddb.com/thumb/f5d01993fbb44f107bb340e433df194f.jpg', '2021');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil Code: Veronica','Survival horror','Resident Evil Code: Veronica é um jogo de survival horror lançado pela Capcom em 2000 para o Dreamcast. A história segue Claire Redfield em busca de seu irmão Chris, levando-a a uma instalação na Ilha Rockfort e mais tarde para a Antártica.',
'O jogo é conhecido por sua narrativa complexa e jogabilidade desafiadora. Resident Evil Code: Veronica recebeu elogios por sua atmosfera envolvente e sequências cinematográficas.', 
'https://cdn2.steamgriddb.com/thumb/83f52c814551f19ec1228b7e45b1e950.jpg', '2000');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil Revelations','Survival horror','Resident Evil Revelations é um jogo de survival horror lançado pela Capcom em 2012 para o Nintendo 3DS e posteriormente para outras plataformas. O jogo segue Jill Valentine e Chris Redfield enquanto investigam uma ameaça bioterrorista em um navio abandonado.',
'Resident Evil Revelations é elogiado por seu retorno às raízes da série e por manter uma atmosfera tensa. O jogo apresenta episódios intercalados e mecânicas de exploração marítima.', 
'https://cdn2.steamgriddb.com/thumb/52ec1c0cc952d63a8bda67ff969b6968.jpg', '2012');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil Outbreak','Survival horror','Resident Evil Outbreak é um jogo de survival horror lançado pela Capcom em 2003 para o PlayStation 2. É um dos primeiros jogos da série a apresentar o modo multijogador online, permitindo que os jogadores cooperem para sobreviver a eventos apocalípticos em Raccoon City.',
'O jogo apresenta vários personagens jogáveis, cada um com habilidades únicas, e situações dinâmicas que mudam com base nas decisões dos jogadores. Resident Evil Outbreak foi inovador em seu tempo pela abordagem online em um jogo de terror.', 
'https://cdn2.steamgriddb.com/thumb/77f76375a4c041ebe9c2d774a065eebc.jpg', '2003');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil Dead Aim','Survival horror','Resident Evil Dead Aim é um jogo de survival horror lançado pela Capcom em 2003 para o PlayStation 2. O jogo segue Bruce McGivern, um agente da US STRATCOM, enquanto investiga atividades bioterroristas em um cruzeiro.',
'O jogo combina elementos de tiro em primeira pessoa e terceira pessoa, oferecendo uma experiência única na série Resident Evil. Resident Evil Dead Aim recebeu elogios por sua abordagem única e jogabilidade intensa.', 
'https://cdn2.steamgriddb.com/thumb/855b727d56dcc5bbfc7c4e5a28d6f6cb.jpg', '2003');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Resident Evil: The Umbrella Chronicles','Survival horror','Resident Evil: The Umbrella Chronicles é um jogo de tiro em trilhos lançado pela Capcom em 2007 para o Wii e posteriormente para o PlayStation 3. O jogo revisita eventos-chave da série Resident Evil, cobrindo desde o Incidente da Mansão até o colapso da Umbrella Corporation.',
'O jogo permite que os jogadores revivam momentos marcantes da série em uma experiência de tiro cooperativo. Resident Evil: The Umbrella Chronicles é elogiado por sua jogabilidade e recriação de cenários icônicos.', 
'https://cdn2.steamgriddb.com/thumb/56bd105edcd66711274c9b0b325c169e.png', '2007');

-- Saga silent hill

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Silent Hill','Survival horror','Silent Hill é um jogo de survival horror lançado pela Konami em 1999 para o PlayStation. O jogo segue Harry Mason, que procura por sua filha adotiva, Cheryl, na misteriosa cidade de Silent Hill.',
'Silent Hill é conhecido por sua atmosfera assustadora, neblina densa e mudanças para o plano alternativo. O jogo é considerado um clássico do gênero survival horror e estabeleceu muitos elementos da série.', 
'https://cdn2.steamgriddb.com/thumb/1dcc077aab5503c56609968fc56e3f1b.jpg', '1999');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Silent Hill 2','Survival horror','Silent Hill 2 é um jogo de survival horror lançado pela Konami em 2001 para o PlayStation 2. O jogo segue James Sunderland, que recebe uma carta de sua falecida esposa, levando-o à sombria cidade de Silent Hill.',
'Silent Hill 2 é conhecido por sua atmosfera opressiva e narrativa psicológica complexa. O jogo é elogiado por seu design de som, gráficos perturbadores e temas maduros.', 
'https://cdn2.steamgriddb.com/thumb/6e5629f2ab9973c09e947a0e1100fb52.jpg', '2001');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Silent Hill 3','Survival horror','Silent Hill 3 é um jogo de survival horror lançado pela Konami em 2003 para o PlayStation 2. O jogo segue Heather Mason, que é arrastada para o mundo assustador de Silent Hill enquanto procura por respostas sobre seu passado.',
'Silent Hill 3 mantém a atmosfera assustadora e surreal da série, explorando temas de culto e terror psicológico. O jogo é elogiado por seus visuais e narrativa envolvente.', 
'https://cdn2.steamgriddb.com/thumb/a228a3fd54f3096e2fdac092e7127afc.jpg', '2003');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Silent Hill 4: The Room','Survival horror','Silent Hill 4: The Room é um jogo de survival horror lançado pela Konami em 2004 para várias plataformas. O jogo segue Henry Townshend, que se encontra trancado em seu apartamento, que se transforma em um portal para o mundo assombrado de Silent Hill.',
'Silent Hill 4: The Room inova a série com uma perspectiva em primeira pessoa e uma narrativa única. O jogo é elogiado por sua atmosfera e reviravoltas na história.', 
'https://cdn2.steamgriddb.com/thumb/a00ffcaff1ed3a0803a8d48d7b4bde91.jpg', '2004');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Silent Hill: Homecoming','Survival horror','Silent Hill: Homecoming é um jogo de survival horror lançado pela Konami em 2008 para várias plataformas. O jogo segue Alex Shepherd, um veterano de guerra que retorna à sua cidade natal para encontrar seu irmão desaparecido, enfrentando horrores sobrenaturais no processo.',
'Silent Hill: Homecoming mistura elementos de combate e exploração, sendo elogiado por seus visuais e narrativa envolvente. O jogo explora temas de traumas e pesadelos pessoais.', 
'https://cdn2.steamgriddb.com/thumb/e3668c4b232ab6fabc71ff3214345cef.jpg', '2008');

-- Saga Doom

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Doom (1993)','Tiro em primeira pessoa','Doom é um jogo de tiro em primeira pessoa lançado pela id Software em 1993 para MS-DOS. O jogo é pioneiro no gênero, colocando os jogadores contra hordas de demônios em instalações de pesquisa em Marte.',
'Doom é conhecido por sua ação frenética, design de níveis inovador e trilha sonora icônica. É considerado um dos jogos mais influentes na história dos videogames.', 
'https://cdn2.steamgriddb.com/thumb/ef58f7ffe086514aa0164c7fc4f6cea8.jpg', '1993');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Doom II: Hell on Earth','Tiro em primeira pessoa','Doom II: Hell on Earth é a sequência do Doom original, lançado pela id Software em 1994 para MS-DOS. O jogo continua a história do Doom, com a Terra agora invadida por demônios.',
'Doom II expande a jogabilidade do original e introduz novos inimigos e armas. É conhecido pela comunidade modding ativa e pela popularidade de seus níveis personalizados.', 
'https://cdn2.steamgriddb.com/thumb/089e64c4c3a1eb2947cd39ca891e4c8e.jpg', '1994');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Doom 3','Tiro em primeira pessoa','Doom 3 é um jogo de tiro em primeira pessoa lançado pela id Software em 2004 para várias plataformas. O jogo segue o protagonista anônimo enquanto luta contra demônios em uma base de pesquisa em Marte.',
'Doom 3 destaca-se por sua atmosfera sombria e gráficos avançados para a época. A jogabilidade enfatiza o horror e a ação tática.', 
'https://cdn2.steamgriddb.com/thumb/ec6f28238ee9d3b0121a7d3335b39a01.jpg', '2004');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Doom (2016)','Tiro em primeira pessoa','Doom, lançado em 2016 pela id Software, é um reboot da série. O jogo coloca os jogadores em Marte, enfrentando hordas de demônios depois de um surto demoníaco.',
'O Doom de 2016 é elogiado por sua jogabilidade intensa, ritmo rápido e mecânicas de combate visceral. A trilha sonora pesada e a campanha single-player são destaques do jogo.', 
'https://cdn2.steamgriddb.com/thumb/e6b2e5d385c1503fbd55b97ba5dc4b77.jpg', '2016');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Doom Eternal','Tiro em primeira pessoa','Doom Eternal, lançado em 2020 pela id Software, é a sequência direta do Doom de 2016. O jogo continua a história, colocando o Doom Slayer contra demônios invadindo a Terra.',
'Doom Eternal expande as mecânicas de combate, oferecendo mais armas, inimigos e movimentos para o jogador. É elogiado por sua ação implacável e design de níveis criativo.', 
'https://cdn2.steamgriddb.com/thumb/35a53eba9befcf53a42be3f0b22a39c2.jpg', '2020');

-- Saga God of war

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('God of War (2005)','Ação e aventura','God of War é um jogo de ação e aventura lançado pela Santa Monica Studio em 2005 para o PlayStation 2. O jogo segue Kratos, um guerreiro espartano, em sua busca para vingar a morte de sua família e servir os deuses do Olimpo.',
'God of War é conhecido por sua jogabilidade intensa, combate brutal e história mitológica envolvente. O jogo recebeu elogios por seus gráficos impressionantes e narrativa épica.', 
'https://cdn2.steamgriddb.com/thumb/72d0eaa80cc3412fda4a133ca1f884e8.jpg', '2005');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('God of War II','Ação e aventura','God of War II é a sequência direta de God of War, lançado pela Santa Monica Studio em 2007 para o PlayStation 2. O jogo continua a jornada de Kratos, agora em busca de vingança contra os deuses do Olimpo.',
'God of War II expande a jogabilidade e apresenta novos inimigos e locais mitológicos. O jogo é elogiado por sua escala épica e gráficos impressionantes.', 
'https://cdn2.steamgriddb.com/thumb/26800b008b4e5a8ee94d9845f97eff05.png', '2007');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('God of War III','Ação e aventura','God of War III é o terceiro título principal da série, lançado pela Santa Monica Studio em 2010 para o PlayStation 3. O jogo continua a saga de Kratos, agora em sua busca para destruir os deuses do Olimpo.',
'God of War III é conhecido por seus visuais impressionantes, jogabilidade épica e confrontos colossais contra inimigos mitológicos. O jogo recebeu elogios por sua narrativa e design de níveis.', 
'https://cdn2.steamgriddb.com/thumb/999f434a8fbab3206c73c9800da70864.jpg', '2010');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('God of War (2018)','Ação e aventura','God of War, lançado em 2018 pela Santa Monica Studio para o PlayStation 4, é um reboot da série. O jogo segue uma versão mais velha de Kratos em uma jornada com seu filho Atreus pelos reinos nórdicos.',
'God of War de 2018 recebeu aclamação universal por sua narrativa emocional, jogabilidade refinada e gráficos de última geração. O jogo introduz uma perspectiva de câmera sobre o ombro e explorando a mitologia nórdica.', 
'https://cdn2.steamgriddb.com/thumb/5855660034a74cfe0e5fc8d57d17f4ac.jpg', '2018');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('God of War: Chains of Olympus','Ação e aventura','God of War: Chains of Olympus é um jogo de ação e aventura lançado pela Ready at Dawn em 2008 para o PlayStation Portable (PSP). O jogo se passa antes dos eventos do primeiro God of War e segue Kratos enquanto ele lida com as consequências de um pacto com Ares.',
'Chains of Olympus é elogiado por sua jogabilidade sólida, gráficos impressionantes e uma história que adiciona profundidade ao universo de God of War.', 
'https://cdn2.steamgriddb.com/thumb/63719b0a1928ddc9f968cb69bffe2f81.jpg', '2008');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('God of War: Ghost of Sparta','Ação e aventura','God of War: Ghost of Sparta é outro jogo para o PlayStation Portable (PSP), lançado em 2010 pela Ready at Dawn. O jogo explora a jornada de Kratos entre God of War e God of War II, enquanto ele procura por seu irmão Deimos.',
'Ghost of Sparta mantém a qualidade da série principal, oferecendo uma experiência envolvente em uma plataforma portátil. O jogo recebeu elogios por sua narrativa e jogabilidade.', 
'https://cdn2.steamgriddb.com/thumb/eecd44ca6cde2b98f9c7150cb135861c.jpg', '2010');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('God of War: Ascension','Ação e aventura','God of War: Ascension é um prelúdio da série principal, lançado pela Santa Monica Studio em 2013 para o PlayStation 3. O jogo explora os eventos anteriores à trilogia original e segue Kratos enquanto ele luta contra as Fúrias.',
'Ascension introduz mecânicas multiplayer e mantém a ação intensa característica da série. Embora tenha recebido críticas mistas, é considerado uma adição sólida à franquia.', 
'https://cdn2.steamgriddb.com/thumb/08a45f6c13e692943ada130a739b1f68.jpg', '2013');

-- Saga Far cry

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Far Cry','Tiro em primeira pessoa, Mundo Aberto','Far Cry é um jogo de tiro em primeira pessoa lançado pela Crytek em 2004 para PC. O jogo segue Jack Carver, um ex-soldado que se encontra preso em uma ilha tropical, enfrentando mercenários e mutantes.',
'Far Cry é conhecido por seu vasto ambiente de jogo aberto, jogabilidade tática e gráficos avançados para a época. Ele estabeleceu os elementos centrais da série.', 
'https://cdn2.steamgriddb.com/thumb/e8bcc358d301407a7ebfd7d74a03cbb5.jpg', '2004');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Far Cry 2','Tiro em primeira pessoa, Mundo Aberto','Far Cry 2 é a sequência do original, lançada pela Ubisoft em 2008 para várias plataformas. O jogo se passa em uma região fictícia da África, onde o jogador é um mercenário encarregado de assassinar um traficante de armas.',
'Far Cry 2 introduz elementos de mundo aberto dinâmico, como ciclos de dia e noite e mudanças climáticas. Ele também apresenta um sistema de saúde inovador e uma narrativa não linear.', 
'https://cdn2.steamgriddb.com/thumb/64afb346ce729c37acd43dcabd7648e6.jpg', '2008');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Far Cry 3','Tiro em primeira pessoa, Mundo Aberto, Ação e Aventura','Far Cry 3, lançado em 2012 pela Ubisoft, segue Jason Brody, um turista que se torna um guerreiro na ilha tropical de Rook Islands. Ele enfrenta piratas e mercenários enquanto busca resgatar seus amigos.',
'Far Cry 3 é elogiado por sua narrativa envolvente, vilão memorável (Vaas Montenegro) e jogabilidade de mundo aberto. Ele também introduziu elementos de crafting e caça.', 
'https://cdn2.steamgriddb.com/thumb/ec694462fa475389dc49c9fe579b261c.jpg', '2012');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Far Cry 4','Tiro em primeira pessoa, Mundo Aberto, Ação e Aventura','Far Cry 4, lançado em 2014 pela Ubisoft, se passa na região fictícia de Kyrat, nos Himalaias. O jogador assume o papel de Ajay Ghale, envolvido em um conflito civil enquanto busca cumprir o último desejo de sua mãe.',
'Far Cry 4 mantém os elementos de mundo aberto e introduz um vasto cenário montanhoso. Oferece escolhas morais e um modo cooperativo para dois jogadores.', 
'https://cdn2.steamgriddb.com/thumb/19e8eca3844064c94a2f9c838df1541d.jpg', '2014');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Far Cry 5','Tiro em primeira pessoa, Mundo Aberto, Ação e Aventura','Far Cry 5, lançado em 2018 pela Ubisoft, se passa em Hope County, Montana. O jogador enfrenta Joseph Seed, líder de um culto apocalíptico, enquanto luta para libertar a região.',
'Far Cry 5 destaca-se por seu cenário americano e abordagem de mundo aberto. Ele permite ao jogador personalizar seu personagem e conta com uma narrativa intensa.', 
'https://cdn2.steamgriddb.com/thumb/74119562764bfb58423037ae2d67a4aa.jpg', '2018');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Far Cry Primal','Tiro em primeira pessoa, Mundo Aberto, Ação e Aventura','Far Cry Primal, lançado em 2016 pela Ubisoft, é ambientado na Idade da Pedra, em uma terra fictícia chamada Oros. O jogador assume o papel de Takkar, um caçador da tribo Wenja, enquanto enfrenta predadores e rivais.',
'Far Cry Primal destaca-se por sua ambientação única na pré-história, onde o jogador utiliza armas primitivas e interage com animais selvagens. A jogabilidade de mundo aberto é uma característica marcante do título.', 
'https://cdn2.steamgriddb.com/thumb/86f28a2a578fddee0a1bf5ada332d3b2.jpg', '2016');

-- Saga GTA

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Grand Theft Auto III','Ação, Mundo Aberto','Grand Theft Auto III, lançado em 2001 pela Rockstar Games, é um jogo de ação em mundo aberto. O jogador assume o papel de Claude, um criminoso que busca vingança em Liberty City.',
'GTA III é notável por ser o primeiro jogo da série em 3D, oferecendo uma experiência de mundo aberto inovadora. Ele estabeleceu muitos elementos que se tornaram padrões na franquia.', 
'https://cdn2.steamgriddb.com/thumb/00da3036c4f9e0858880633f661aaf27.jpg', '2001');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Grand Theft Auto: Vice City','Ação, Mundo Aberto','Grand Theft Auto: Vice City, lançado em 2002 pela Rockstar Games, se passa na década de 1980 em Vice City. O jogador controla Tommy Vercetti, um criminoso que busca construir um império do crime.',
'Vice City é elogiado por sua atmosfera retrô, trilha sonora marcante e narrativa envolvente. Ele ampliou a jogabilidade introduzida em GTA III.', 
'https://cdn2.steamgriddb.com/thumb/83733fa438d421bd912bff044069cae2.jpg', '2002');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Grand Theft Auto: San Andreas','Ação, Mundo Aberto','Grand Theft Auto: San Andreas, lançado em 2004 pela Rockstar Games, é ambientado na fictícia San Andreas. O jogador controla CJ, que retorna à sua cidade natal para descobrir a verdade por trás do assassinato de sua mãe.',
'San Andreas é conhecido pela sua vastidão e diversidade de ambientes, oferecendo uma experiência de mundo aberto ainda mais expansiva. Ele apresenta elementos de RPG e uma narrativa épica.', 
'https://cdn2.steamgriddb.com/thumb/c4e954b93dc03b0f846db4051a1e6d25.jpg', '2004');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Grand Theft Auto IV','Ação, Mundo Aberto','Grand Theft Auto IV, lançado em 2008 pela Rockstar Games, se passa na cidade fictícia de Liberty City. O jogador controla Niko Bellic, um imigrante do leste europeu em busca do "Sonho Americano".',
'GTA IV é elogiado por sua narrativa madura e personagens complexos. Ele apresenta um motor gráfico avançado e uma visão mais realista da jogabilidade em mundo aberto.', 
'https://cdn2.steamgriddb.com/thumb/b9763bdff688a0af26e130bab41feb61.jpg', '2008');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Grand Theft Auto V','Ação, Mundo Aberto','Grand Theft Auto V, lançado em 2013 pela Rockstar Games, se passa em Los Santos e suas áreas circundantes. O jogo apresenta três protagonistas jogáveis, cada um com sua própria história interligada.',
'GTA V é conhecido pela sua escala impressionante, narrativa rica e variedade de atividades. Ele inclui um modo multiplayer online chamado Grand Theft Auto Online, que expande a experiência além da campanha principal.', 
'https://cdn2.steamgriddb.com/thumb/7a87609a1305e8c75748d20fd3a410ba.jpg', '2013');

-- Saga Souls like

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Dark Souls','Ação, RPG','Dark Souls, lançado em 2011 pela FromSoftware, é um jogo de ação e RPG. Os jogadores exploram o reino de Lordran, enfrentando inimigos desafiadores e chefes poderosos enquanto buscam cumprir seu destino.',
'Dark Souls é conhecido por sua dificuldade elevada, atmosfera sombria e narrativa misteriosa. O jogo enfatiza a exploração e o combate estratégico.', 
'https://cdn2.steamgriddb.com/thumb/4ddc45a9de1065695a90e87be37471c0.jpg', '2011');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Dark Souls II','Ação, RPG','Dark Souls II, lançado em 2014 pela FromSoftware, se passa em um mundo diferente de Lordran. Os jogadores enfrentam novos desafios e uma narrativa que explora a maldição do não morrer.',
'Dark Souls II mantém a dificuldade característica da série, introduzindo mecânicas de jogo aprimoradas. O jogo também possui uma expansão chamada "Scholar of the First Sin".', 
'https://cdn2.steamgriddb.com/thumb/d4a65d5fdc8766cf2c55e8267c5d7c72.jpg', '2014');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Dark Souls III','Ação, RPG','Dark Souls III, lançado em 2016 pela FromSoftware, conclui a trilogia Dark Souls. Os jogadores exploram o reino de Lothric, enfrentando inimigos e chefes desafiadores enquanto descobrem os segredos finais.',
'Dark Souls III aprimora os gráficos e a jogabilidade da série, oferecendo uma experiência emocionante para os fãs. O jogo inclui DLCs que expandem ainda mais a narrativa.', 
'https://cdn2.steamgriddb.com/thumb/9085f5ef67f2f7f0f38e869ffb5016a1.jpg', '2016');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Demon''s Souls (Remake)','Ação, RPG','Demon''s Souls (Remake), lançado em 2020 pela Bluepoint Games, é um remake do jogo original de 2009. Os jogadores exploram o reino de Boletaria, enfrentando desafios implacáveis e chefes colossais.',
'O remake de Demon''s Souls apresenta visuais incríveis, mantendo a essência do jogo original. Ele é conhecido por suas mecânicas de combate precisas e atmosfera única.', 
'https://cdn2.steamgriddb.com/thumb/7f260734198733fb642f90df1d2b580a.jpg', '2020');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Bloodborne', 'Ação, RPG', 'Bloodborne, lançado em 2015 pela FromSoftware, é um jogo de ação e RPG. Os jogadores exploram a cidade gótica de Yharnam, enfrentando criaturas grotescas e desvendando mistérios sombrios.',
'Bloodborne é conhecido por sua jogabilidade desafiadora, atmosfera macabra e design de níveis intricado. O jogo é ambientado em um mundo gótico-horror e é altamente elogiado pela crítica.', 
'https://cdn2.steamgriddb.com/thumb/021399af062379408df9c358a1a83cdb.jpg', '2015');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Sekiro: Shadows Die Twice', 'Ação, Aventura', 'Sekiro: Shadows Die Twice, lançado em 2019 pela FromSoftware, é um jogo de ação e aventura. Os jogadores assumem o papel de Wolf, um shinobi com a missão de resgatar seu mestre e enfrentar inimigos mortais.',
'Sekiro se destaca por sua jogabilidade intensa e sistema de combate visceral. Ambientado no Japão feudal, o jogo oferece uma experiência desafiadora e uma narrativa cativante.', 
'https://cdn2.steamgriddb.com/thumb/acfa41c81ad86a8713bdc3c9ec0d0b68.jpg', '2019');

-- Saga Crash Bandicoot

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Bandicoot', 'Plataforma', 'Crash Bandicoot, lançado em 1996 pela Naughty Dog, é um jogo de plataforma clássico. Os jogadores controlam Crash, um marsupial que luta contra o vilão Dr. Neo Cortex para salvar sua namorada Tawna.',
'Crash Bandicoot é conhecido por seus gráficos coloridos, jogabilidade envolvente e desafios de plataforma. Ele foi um dos primeiros títulos a destacar o potencial da PlayStation.', 
'https://cdn2.steamgriddb.com/thumb/8282b546dda9ec05515966ba0fe3e5d1.jpg', '1996');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Bandicoot 2: Cortex Strikes Back', 'Plataforma', 'Crash Bandicoot 2: Cortex Strikes Back, lançado em 1997 pela Naughty Dog, é a sequência do jogo original. Crash deve coletar cristais para ajudar o vilão Dr. Neo Cortex a salvar o mundo.',
'O jogo expande a fórmula do primeiro, apresentando novos movimentos para Crash e níveis mais complexos. Ele continua a ser um clássico adorado pelos fãs de jogos de plataforma.', 
'https://cdn2.steamgriddb.com/thumb/389aaafbbaf38add414487fb6a1ea607.jpg', '1997');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Bandicoot 3: Warped', 'Plataforma', 'Crash Bandicoot 3: Warped, lançado em 1998 pela Naughty Dog, é a terceira entrada da série principal. Crash e sua irmã Coco devem impedir os planos malignos de Dr. Neo Cortex e Uka Uka.',
'Warped introduz habilidades especiais e veículos para Crash, além de uma variedade de fases diferentes. O jogo é considerado um ponto alto na série Crash Bandicoot.', 
'https://cdn2.steamgriddb.com/thumb/57a56845ea8e3e282d66359a51691fc0.jpg', '1998');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Bandicoot 3: Warped', 'Plataforma', 'Crash Bandicoot 3: Warped, lançado em 1998 pela Naughty Dog, é a terceira entrada da série principal. Crash e sua irmã Coco devem impedir os planos malignos de Dr. Neo Cortex e Uka Uka.',
'Warped introduz habilidades especiais e veículos para Crash, além de uma variedade de fases diferentes. O jogo é considerado um ponto alto na série Crash Bandicoot.', 
'https://cdn2.steamgriddb.com/thumb/04514b9893dd1719269aea025015ebe9.jpg', '1998');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Team Racing', 'Corrida', 'Crash Team Racing, lançado em 1999 pela Naughty Dog, é um jogo de corrida com personagens da série Crash Bandicoot. Os jogadores competem para derrotar o vilão Nitros Oxide e salvar a Terra.',
'Crash Team Racing é elogiado por sua jogabilidade divertida e desafiadora, oferecendo uma alternativa cativante aos jogos de corrida da época. O jogo ganhou uma legião de fãs.', 
'https://cdn2.steamgriddb.com/thumb/92a9d12e16b804e2b1a4abebecdbfb13.jpg', '1999');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Bash', 'Ação, Party', 'Crash Bash, lançado em 2000 pela Eurocom, é um jogo de festa baseado na série Crash Bandicoot. Jogadores participam de uma variedade de mini-jogos para competir contra outros personagens.',
'Crash Bash oferece diversão multiplayer com uma variedade de modos de jogo. É lembrado por suas competições multiplayer e desafios criativos.', 
'https://cdn2.steamgriddb.com/thumb/2665710968187070e2a3a703c3c1170e.jpg', '2000');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Bandicoot: The Wrath of Cortex', 'Plataforma', 'Crash Bandicoot: The Wrath of Cortex, lançado em 2001 pela Traveller''s Tales, é um jogo de plataforma e a quarta entrada principal na série. Crash deve impedir os planos de vingança do vilão Crunch Bandicoot.',
'The Wrath of Cortex mantém a jogabilidade clássica da série, introduzindo novas habilidades e fases desafiantes. O jogo foi lançado para várias plataformas.', 
'https://cdn2.steamgriddb.com/thumb/8f525be9215d86f58355460286cccd32.jpg', '2001');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Nitro Kart', 'Corrida', 'Crash Nitro Kart, lançado em 2003 pela Vicarious Visions, é um jogo de corrida baseado na série Crash Bandicoot. Crash e seus amigos competem contra os alienígenas de Velo para salvar a Terra.',
'Nitro Kart oferece corridas emocionantes e modos multiplayer, expandindo o universo de Crash Bandicoot para o gênero de corrida. O jogo foi lançado para várias plataformas.', 
'https://cdn2.steamgriddb.com/thumb/305b4101de6e18dd7bf1ca14f0f534eb.jpg', '2003');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Twinsanity', 'Ação, Aventura', 'Crash Twinsanity, lançado em 2004 pela Traveller''s Tales, é um jogo de ação e aventura. Crash une forças com seu inimigo Dr. Neo Cortex para enfrentar uma ameaça ainda maior.',
'Twinsanity apresenta uma narrativa única e humorística, mantendo a jogabilidade clássica da série. Os jogadores exploram ambientes abertos e participam de várias interações entre Crash e Cortex.', 
'https://cdn2.steamgriddb.com/thumb/2d76b54ba6edfbfbf547c7c2e76ed586.jpg', '2004');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Tag Team Racing', 'Corrida', 'Crash Tag Team Racing, lançado em 2005 pela Radical Entertainment, é um jogo de corrida. Os jogadores podem combinar seus veículos em corridas emocionantes e participar de desafios malucos.',
'Tag Team Racing mistura elementos de corrida e combate, proporcionando uma experiência única. O jogo inclui modos single-player e multiplayer.', 
'https://cdn2.steamgriddb.com/thumb/42e63e1b4d6aa921fd566bdef26e5ef4.jpg', '2005');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash of the Titans', 'Ação, Aventura', 'Crash of the Titans, lançado em 2007 pela Radical Entertainment, é um jogo de ação e aventura. Crash luta para salvar sua irmã Coco, que foi capturada pelo vilão Neo Cortex.',
'Crash of the Titans introduz mecânicas de combate mais robustas e a capacidade de controlar inimigos. O jogo mantém o estilo humorístico da série Crash Bandicoot.', 
'https://cdn2.steamgriddb.com/thumb/bc6dec9604a8492c23cbd2a647918586.png', '2007');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash: Mind Over Mutant', 'Ação, Aventura', 'Crash: Mind Over Mutant, lançado em 2008 pela Radical Entertainment, é um jogo de ação e aventura. Crash luta contra as forças do maligno Dr. Neo Cortex e seu exército de mutantes.',
'Mind Over Mutant apresenta uma jogabilidade expansiva, permitindo que Crash controle inimigos mutantes. Os jogadores exploram um mundo aberto e enfrentam desafios inéditos.', 
'https://cdn2.steamgriddb.com/thumb/f570bd23dab3563703638856f9d0952d.jpg', '2008');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Bandicoot N. Sane Trilogy', 'Plataforma', 'Crash Bandicoot N. Sane Trilogy, lançado em 2017 pela Vicarious Visions, é uma coleção remasterizada dos três primeiros jogos da série. Os jogadores revivem as aventuras clássicas de Crash com gráficos modernos.',
'A trilogia inclui remakes de Crash Bandicoot, Crash Bandicoot 2: Cortex Strikes Back e Crash Bandicoot 3: Warped. Oferece uma experiência nostálgica para fãs e novos jogadores.', 
'https://cdn2.steamgriddb.com/thumb/f241c94ab5de4142677fdc6968ca6ec7.png', '2017');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Crash Team Racing Nitro-Fueled', 'Corrida', 'Crash Team Racing Nitro-Fueled, lançado em 2019 pela Beenox, é uma remasterização do jogo original de corrida. Os jogadores competem em pistas clássicas com personagens da série Crash Bandicoot.',
'Nitro-Fueled traz de volta a emoção do jogo de corrida original com visuais atualizados e novos recursos. Inclui personagens, pistas e modos de jogo do Crash Nitro Kart.', 
'https://cdn2.steamgriddb.com/thumb/a0637e79c5b79afe6dd9bcabdb94040e.jpg', '2019');

-- Saga Tekken

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Tekken', 'Luta', 'Tekken, lançado em 1994 pela Namco, é um jogo de luta. A saga Tekken é conhecida por seus personagens únicos e variados estilos de luta. O torneio King of Iron Fist é o pano de fundo para as batalhas épicas.',
'Tekken estabeleceu-se como uma das principais franquias de jogos de luta, oferecendo jogabilidade técnica e gráficos impressionantes para sua época.', 
'https://cdn2.steamgriddb.com/thumb/df952959a69bbc4cf649113a7cc59cd6.jpg', '1994');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Tekken 3', 'Luta', 'Tekken 3, lançado em 1997 pela Namco, é um jogo de luta. O jogo introduz novos personagens e aprimora a jogabilidade da série. O enredo gira em torno de um novo torneio King of Iron Fist.',
'Tekken 3 é frequentemente considerado um dos melhores jogos da saga, com gráficos avançados para a época e uma extensa lista de personagens jogáveis.', 
'https://cdn2.steamgriddb.com/thumb/a85032c0a15f3c7048a8077595f2ee66.jpg', '1997');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Tekken 5', 'Luta', 'Tekken 5, lançado em 2005 pela Namco, é um jogo de luta. O enredo se concentra na rivalidade entre os membros do Mishima Zaibatsu. Tekken 5 introduz novos modos de jogo e personagens.',
'Tekken 5 é elogiado por sua jogabilidade profunda, gráficos aprimorados e variedade de modos. Tornou-se um marco na saga Tekken.', 
'https://cdn2.steamgriddb.com/thumb/6064e6d3493f8079cfc90a3ba5536fdc.png', '2005');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Tekken 7', 'Luta', 'Tekken 7, lançado em 2015 nos fliperamas e em 2017 para outras plataformas, é o mais recente da série principal. O jogo conclui a história da saga Mishima e apresenta novos personagens e mecânicas.',
'Tekken 7 mantém a tradição da série com lutas intensas e gráficos de última geração. É amplamente apreciado pela comunidade de jogos de luta.', 
'https://cdn2.steamgriddb.com/thumb/698c42c967a68312997479c5bde6cb28.jpg', '2015');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Tekken 2', 'Luta', 'Tekken 2, lançado em 1995 pela Namco, é a sequência do jogo original. O torneio King of Iron Fist continua, com novos personagens e melhorias na jogabilidade. A história aprofunda os conflitos familiares entre os Mishima.',
'Tekken 2 expande o elenco e aprofunda os enredos pessoais dos personagens. Foi um sucesso significativo para a saga Tekken.', 
'https://cdn2.steamgriddb.com/thumb/94d201f72713f45cdf4ed7257253a636.jpg', '1995');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Tekken 6', 'Luta', 'Tekken 6, lançado em 2007 nos fliperamas e em 2009 para outras plataformas, continua a saga Mishima. O jogo introduz novos personagens e expande a história do conflito. Tekken 6 apresenta o sistema "Rage" e fases dinâmicas.',
'Tekken 6 é conhecido por sua jogabilidade aprimorada e extenso elenco de personagens. A narrativa complexa continua a explorar as rivalidades familiares.', 
'https://cdn2.steamgriddb.com/thumb/3ae3b9d70e3a1be516add1d7e16bfd20.jpg', '2007');

INSERT INTO jogos(nome, genero, descricao_curta, descricao_completa, url_imagem, ano_lancamento)
VALUES('Tekken 4', 'Luta', 'Tekken 4, lançado em 2001 pela Namco, é o quarto jogo da série principal. A narrativa avança com eventos importantes na história do Mishima Zaibatsu. Tekken 4 apresenta modos de luta interativos e ambientes em 3D.',
'Tekken 4 recebeu elogios por suas melhorias gráficas e novas mecânicas de jogo. A história continua a explorar os conflitos familiares entre os Mishima.', 
'https://cdn2.steamgriddb.com/thumb/d104d5b8a463f3d6e50b773f9203a926.jpg', '2001');





