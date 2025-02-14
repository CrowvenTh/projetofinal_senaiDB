-- create schema if not exists churrascoMaranhao default character set utf8;
drop database churrascoMaranhao;
create database churrascoMaranhao;

-- use churrascoMaranhao;

create table if not exists produto(
	idProduto serial,
	nome varchar(150) not null,
    descricao varchar(255) not null,
    preco decimal(5,2) not null,
    qtdEstoque int,
    	constraint PK_produto primary key(idProduto)
);
-- alter table if exists produto rename column "descrição" to descricao;

create table if not exists comanda(
	idComanda serial,
    mesa int not null,
    clienteNome varchar(255),
    abertura timestamp not null,
    fechamento timestamp not null,
		constraint PK_comanda primary key(idComanda)
);

create table if not exists pedido(
	idPedido serial,
    idComanda int,
    idProduto int,
    dataPedido timestamp not null,
    nomePedido varchar(150) not null,
    qtdPedido int not null,
		constraint PK_pedido primary key(idPedido),
        constraint FK_pedido_comanda foreign key(idComanda) references comanda(idComanda),
        constraint FK_pedido_produto foreign key(idProduto) references produto(idProduto)
);

-- CONSULTAS
-- Listar todas as comandas abertas.
select 
	abertura 
		from comanda
	where fechamento = null;

-- Consultar o cardápio completo.
select 
	nome, 
	descricao, 
	preco, 
	qtdEstoque 
		from produto;
select 
	* 
	from produto;

-- Obter o histórico de pedidos realizados.
select 
	datapedido as hora, 
	nomepedido, 
	qtdpedido 
		from pedido
order by 1 desc;

-- Verificar quais pratos foram pedidos em uma determinada comanda.
select 
	nomePedido as pratos,
	qtdPedido as Qtd
		from pedido p
			inner join comanda c
				on p.idComanda = c.idcomanda
		where c.clientenome = 'Carlos Silva';

select * from pedido;

-- Calcular o total gasto por cada comanda.

select idComanda, sum(pr.preco) as "preço", sum(pe.qtdPedido) from produto as pr
	inner join pedido as pe
		on pr.idproduto = pe.idproduto
group by idComanda, qtdPedido;

-- Implemente uma consulta SQL para identificar qual prato foi o mais pedido e quantas vezes ele foi solicitado.

