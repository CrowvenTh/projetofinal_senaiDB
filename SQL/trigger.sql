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
    SET qtdEstoque = qtdEstoque - NEW.qtdPedido
    WHERE idCardapio = NEW.idCardapio;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER estoque
AFTER INSERT ON pedido
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque();