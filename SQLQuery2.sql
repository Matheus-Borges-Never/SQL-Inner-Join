create database locadora

create table cliente(
codcli int primary key identity(1,1),
nome varchar(50) not null,
endereco varchar(70) not null,
complemento varchar(20),
CPF char(11) not null,
CNH varchar(13) not null,
CEP numeric(8) not null,
Profissao varchar(30) not null,
Renda_mensal numeric(7,2) not null,
motivo_aluguel varchar(100) not null,
estado_civil varchar(15) not null,
tel_fixo char(10) not null,
tel_celular char(11) not null,
data_nasc date not null,
constraint UQ_cpf unique (CPF)
)

create table veiculo(
codveic int primary key identity(1,1),
categoria varchar(50) not null,
modelo varchar(50) not null,
marca varchar(50) not null,
fabricante varchar(50) not null,
ano_fabricacao char(4) not null,
capacidade varchar(50) not null,
localizacao varchar(50) not null,
observacao varchar(50),
ano numeric(4) not null,
chassi varchar (17) not null,
placa varchar (7) not null,
cor varchar (30) not null,
potencia numeric(2,1) not null,)

insert into cliente values('José Silva','Rua josé de carlos - Centro 1411 Franca SP','Ap',11122268325,562332147,14405555,'Sapateiro',2000,'Estou viajando com a familia','Casado',1637022222,16991245252,'1970-01-17')
insert into cliente values('Fausto Manzan','Rua Koel - Centro 1211 Franca SP','Casa',11122233422,562332141,14405565,'Analista de Projetos',5200,'Estou viajando com os amigos','Solteiro',1632021111,16998851212,'1990-05-15')

insert into veiculo 
values ('Carro','Celta','Chevrolet','Chevrolet', '2010', '5', 'Franca - SP', '', '2010', '123456789ASDFGHJK', 'ABC3213', 'Preta', '1.0')

delete from cliente where codcli = 22
delete from cliente where codcli = 24

create table aluga(
codaluga int primary key identity(1,1),
codcli int not null,
codveic int not null,
constraint fk_cliente
foreign key (codcli)
references cliente (codcli),
constraint fk_veiculo
foreign key (codveic)
references veiculo (codveic)
)

insert into aluga
values (2,1)


Select c.nome, c.cpf, v.modelo, v.cor
from aluga a inner join cliente c 
on a.codcli = c.codcli
inner join veiculo v 
on a.codveic = v.codveic

select * from cliente order by nome