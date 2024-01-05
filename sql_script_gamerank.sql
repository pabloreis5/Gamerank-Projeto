CREATE DATABASE gamerank
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;

use gamerank;

create table jogos (
	id INT NOT NULL AUTO_INCREMENT,
    nome varchar(50) NOT NULL,
    nota_media DECIMAL(3, 1),	
    ano_lancamento INT,
    genero varchar(20),
    desenvolvedora varchar(30),
    PRIMARY KEY(id)
) default charset = utf8;

SELECT * FROM jogos;	
    
insert into jogos 
	(nome, nota_media, ano_lancamento, genero, desenvolvedora) 
values
	('The Witcher 3: Wild Hunt', 9.3, 2015, 'RPG', 'CD Projekt Red'),
	('The Legend of Zelda: Breath of the Wild', 9.5, 2017, 'Aventura', 'Nintendo'),
	('Red Dead Redemption 2', 9.8, 2018, 'Ação', 'Rockstar Games'),
	('God of War', 9.7, 2018, 'Ação', 'Santa Monica Studio'),
	('Cyberpunk 2077', 7.2, 2020, 'RPG', 'CD Projekt Red'),
	('Assassin''s Creed Valhalla', 8.5, 2020, 'Ação/Aventura', 'Ubisoft'),
	('FIFA 22', 7.9, 2021, 'Esportes', 'EA Sports'),
	('Horizon Zero Dawn', 9.0, 2017, 'Ação/Aventura', 'Guerrilla Games'),
	('Minecraft', 9.8, 2011, 'Sandbox', 'Mojang'),
	('Final Fantasy VII Remake', 9.6, 2020, 'RPG', 'Square Enix'),
	('Grand Theft Auto V', 9.7, 2013, 'Ação/Aventura', 'Rockstar Games'),
	('Super Mario Odyssey', 9.8, 2017, 'Plataforma', 'Nintendo'),
	('Overwatch', 8.5, 2016, 'FPS', 'Blizzard Entertainment'),
	('The Last of Us Part II', 9.5, 2020, 'Ação/Aventura', 'Naughty Dog'),
	('Counter-Strike: Global Offensive', 8.9, 2012, 'FPS', 'Valve'),
	('Animal Crossing: New Horizons', 9.3, 2020, 'Simulação/Social', 'Nintendo'),
	('Persona 5', 9.5, 2016, 'RPG', 'Atlus'),
	('The Elder Scrolls V: Skyrim', 9.4, 2011, 'RPG', 'Bethesda Game Studios'),
	('Bloodborne', 9.0, 2015, 'Ação/RPG', 'FromSoftware'),
	('Fortnite', 7.8, 2017, 'Battle Royale', 'Epic Games'),
	('Resident Evil Village', 8.7, 2021, 'Survival Horror', 'Capcom'),
	('Hades', 9.8, 2020, 'Roguelike', 'Supergiant Games'),
	('Death Stranding', 8.4, 2019, 'Ação', 'Kojima Productions'),
	('The Sims 4', 8.2, 2014, 'Simulação de vida', 'Maxis'),
	('Fallout 4', 8.9, 2015, 'RPG', 'Bethesda Game Studios'),
	('Among Us', 8.0, 2018, 'Festa/Simulação', 'InnerSloth'),
	('Ghost of Tsushima', 9.6, 2020, 'Ação/Aventura', 'Sucker Punch Productions'),
	('Far Cry 5', 8.6, 2018, 'Ação/Aventura', 'Ubisoft'),
	('Uncharted 4: A Thief''s End', 9.7, 2016, 'Ação/Aventura', 'Naughty Dog'),
	('Doom Eternal', 9.0, 2020, 'FPS', 'id Software'),
    ('Titanfall 2', 9.1, 2016, 'FPS', 'Respawn Entertainment'),
	('Stardew Valley', 9.6, 2016, 'Simulação', 'ConcernedApe'),
	('Assassin''s Creed Odyssey', 8.8, 2018, 'Ação/Aventura', 'Ubisoft'),
	('The Legend of Zelda: Twilight Princess', 9.3, 2006, 'Aventura', 'Nintendo'),
	('Batman: Arkham City', 9.4, 2011, 'Ação/Aventura', 'Rocksteady Studios'),
	('Mass Effect 2', 9.5, 2010, 'RPG', 'BioWare'),
	('Celeste', 9.0, 2018, 'Plataforma', 'Matt Makes Games'),
	('Hollow Knight', 9.4, 2017, 'Ação/Aventura', 'Team Cherry'),
	('Dark Souls III', 9.2, 2016, 'Ação/RPG', 'FromSoftware'),
	('Borderlands 2', 9.0, 2012, 'Atirador de saque', 'Gearbox Software'),
	('Civilization VI', 9.1, 2016, 'Estratégia', 'Firaxis Games'),
	('Ori and the Blind Forest', 9.2, 2015, 'Plataforma', 'Moon Studios'),
	('Dragon Age: Inquisition', 9.0, 2014, 'RPG', 'BioWare'),
	('Firewatch', 8.8, 2016, 'Aventura', 'Campo Santo'),
	('Metal Gear Solid V: The Phantom Pain', 9.3, 2015, 'Ação/Aventura', 'Kojima Productions'),
	('Outer Wilds', 9.5, 2019, 'Aventura', 'Mobius Digital'),
	('Sekiro: Shadows Die Twice', 9.7, 2019, 'Ação/Aventura', 'FromSoftware'),
	('The Witcher 2: Assassins of Kings', 9.0, 2011, 'RPG', 'CD Projekt Red'),
	('Nier: Automata', 9.4, 2017, 'RPG', 'PlatinumGames'),
	('Monster Hunter: World', 9.3, 2018, 'RPG de ação', 'Capcom');
    


