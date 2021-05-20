-- Criando e selecionando o banco de dados
create database projetoIndividual;
use projetoIndividual;

-- Criando a tabela 'usuario'
create table usuario (
idUsuario int primary key auto_increment, 
nomeUsuario varchar(45), 
ddd char(2), 
celular char(9),
email varchar(45), 
senha varchar(45)
);

-- Criando a tabela 'conteudo'
create table conteudo(
idConteudo int primary key, 
nomeConteudo varchar(45), 
tecnica varchar(30)
);

-- Criando a tabela 'suporte'
create table suporte(
idSuporte int primary key auto_increment, 
nomeUsuario varchar(45), 
assunto varchar(30), 
resposta char(3) check (resposta = 'Sim' or resposta = 'Não'),
fkUsuario int, 
foreign key (fkUsuario) references usuario (idUsuario)
) auto_increment = 100;

-- Criando a tabela associativa 'conteudoUsuario'
create table conteudoUsuario(
fkUsuario int, 
foreign key (fkUsuario) references usuario (idUsuario), 
fkConteudo int, 
foreign key (fkConteudo) references conteudo (idConteudo), 
primary key (fkUsuario, fkConteudo), 
qntdAcesso char(6)
);

-- Inserindo os dados da entidade 'usuario'
insert into usuario values (null, 'Maria Cecília Rossi', '11', '977882270', 'mcecilia.rossi@hotmail.com', 'cecilia07111959'), 
						   (null, 'Viviane Silva', '19', '949004585', 'vivianesilva@bol.com.br', '19032003'), 
                           (null, 'Fernando Monteiro', '51', '990087611', 'fersos_monteiro@gmail,com', '0123459876'), 
                           (null, 'Bruna Pereira', '68', '923400993', 'bru.pereira@gmail.com', '18092018'), 
                           (null, 'Matheus Santos', '11', '987755544', 'matheus_santoss@hotmail.com', '081119');
	
-- Inserindo os dados da entidade 'conteudo'
insert into conteudo values (1, 'Desenho básico', 'Linha, ponto e traço'), 
						    (2, 'Desenho básico', 'Luz e sombra'), 
                            (3, 'Desenho básico', 'Eixos horizontais e verticais'), 
                            (4, 'Desenho artístico', 'Técnica seca'), 
                            (5, 'Desenho em quadrinhos', 'Roteiro'), 
                            (6, 'Desenho em quadrinhos', 'Enquadramento'), 
                            (7, 'Desenho e técnicas mentais', 'Teoria da cor'), 
                            (8, 'Caricatura', 'Retrato e distorções'), 
                            (9, 'Anatomia e ilustração', 'Proporção'), 
                            (10, 'Artes Kids', 'Técnicas úmidas');
                            
-- Inserindo dados na entidade 'Suporte'
insert into suporte values(null, 'Fernando Monteiro', 'Dificuldade de acesso', 'Sim', 3), 
						  (null, 'Viviane Silva', 'Dados mais precisos', 'Sim', 2);
                          
-- Inserindo dados na entidade associativa 'conteudoUsuario'
insert into conteudoUsuario values(1, 1, '3'), 
								  (1, 2, '1'), 
                                  (2, 2, '2'), 
                                  (3, 8, '10'), 
                                  (3, 6, '1'), 
                                  (4, 10, '30'), 
                                  (5, 5, '3');

-- Selecionando as entidades separadamente
select * from usuario;
select * from conteudo;
select * from suporte;
select * from conteudoUsuario;

-- Selecionando a tabela usuario e suporte 
select * from usuario inner join suporte on fkUsuario = idUsuario;

-- Mostrando todos os conteudos e os conteudoUsuario
select * from conteudo left join conteudoUsuario on fkConteudo = idConteudo inner join usuario on fkUsuario = idUsuario;









