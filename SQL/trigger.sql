/*DELIMITER $$

create trigger ESTOQUE
after insert on pedido
for each row
begin
UPDATE produto SET qtdEstoque=qtdEstoque - new.qtdPedido WHERE idCardapio=NEW.idCardapio
END
*/

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
