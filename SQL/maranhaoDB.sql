-- create schema if not exists churrascoMaranhao default character set utf8;
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

alter table comanda alter column fechamento drop not null;

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
	mesa as Mesa,
	clientenome as Cliente,	
	abertura as Abertura,
-- 	fechamento,
	nomepedido as Pedido,
	qtdpedido as Quantidade
from comanda c 
	inner join 
		pedido p
			on c.idcomanda = p.idcomanda
				where fechamento is null;

-- Consultar o cardápio completo.
select 
	nome, 
	descricao, 
	preco, 
	qtdEstoque 
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
	sum(qtdPedido) as Qtd
		from pedido p
			inner join comanda c
				on p.idComanda = c.idcomanda
		where c.idcomanda = 9
group by nomePedido;


-- Calcular o total gasto por cada comanda.
select idComanda, sum(pr.preco) as "preço", sum(pe.qtdPedido) as Qtd from produto as pr
	inner join pedido as pe
		on pr.idproduto = pe.idproduto
	group by idComanda
order by 2 desc;

-- Implemente uma consulta SQL para identificar qual prato foi o mais pedido e quantas vezes ele foi solicitado.
select pr.nome as Prato, sum(pe.qtdpedido) as "Total pedido" from produto as pr
	inner join pedido as pe
		on pr.idproduto = pe.idproduto
	group by pr.nome, pe.qtdPedido
order by 2 desc
limit 1;


CREATE OR REPLACE FUNCTION atualizar_estoque()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE produto
    SET qtdestoque = qtdestoque - NEW.qtdpedido
    WHERE idproduto = NEW.idproduto;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER estoque
AFTER INSERT ON pedido
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque();

INSERT INTO pedido (idProduto, qtdPedido,nomepedido, datapedido) VALUES (4, 5, 'Cerveja', now()); 

select 
	pr.idproduto as ID, 
	pe.nomepedido as prato, 
	sum(pe.qtdpedido) as pedido,
	pr.qtdestoque as Estoque 
from
	produto as pr
		inner join pedido as pe
			on pr.idproduto = pe.idproduto
		group by pe.nomepedido, pr.idproduto, pe.qtdpedido;

