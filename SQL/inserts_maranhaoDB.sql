INSERT INTO produto (nome, descricao, preco, qtdEstoque)
VALUES
  ('Espetinho de Frango', 'Espetinho de frango com molho especial', 12.50, 30),
  ('Espetinho de Carne', 'Espetinho de carne bovina', 15.00, 25),
  ('Arroz de Carreteiro', 'Arroz com carne de sol, feijão e legumes', 18.00, 15),
  ('Cerveja', 'Cerveja gelada em lata', 7.00, 50),
  ('Refrigerante', 'Refrigerante em lata', 5.00, 40);

select * from produto;

INSERT INTO comanda (mesa, clienteNome, abertura, fechamento)
VALUES
  (1, 'Carlos Silva', '2025-02-13 18:00:00', '2025-02-13 20:30:00'),
  (2, 'Mariana Costa', '2025-02-13 18:30:00', '2025-02-13 21:00:00'),
  (3, 'João Pereira', '2025-02-13 19:00:00', '2025-02-13 21:30:00');

INSERT INTO comanda (mesa, clienteNome, abertura, fechamento)
VALUES
  (4, 'Ana Souza', '2025-02-13 19:30:00', '2025-02-13 22:00:00'),
  (5, 'Roberto Lima', '2025-02-13 20:00:00', '2025-02-13 22:30:00');

select * from comanda;

INSERT INTO pedido (idcomanda, idproduto, datapedido, nomepedido, qtdpedido)
VALUES
  (1, 1, '2025-02-13 18:05:00', 'Espetinho de Frango', 2),  -- Pedido de 2 Espetinhos de Frango
  (1, 4, '2025-02-13 18:10:00', 'Cerveja', 3),             -- Pedido de 3 Cervejas
  (2, 2, '2025-02-13 18:35:00', 'Espetinho de Carne', 1),    -- Pedido de 1 Espetinho de Carne
  (2, 5, '2025-02-13 18:40:00', 'Refrigerante', 2),         -- Pedido de 2 Refrigerantes
  (3, 3, '2025-02-13 19:10:00', 'Arroz de Carreteiro', 1);   -- Pedido de 1 Arroz de Carreteiro
  
  select * from pedido;
  select * from comanda;
  select * from produto;
  
  INSERT INTO produto (nome, descricao, preco, qtdEstoque)
VALUES
  ('Espetinho de Linguiça', 'Espetinho de linguiça toscana', 14.00, 20),
  ('Espetinho Misto', 'Espetinho misto com frango e carne', 16.50, 18),
  ('Bife à Parmegiana', 'Bife de carne empanado com molho de queijo', 22.00, 12),
  ('Batata Frita', 'Porção de batata frita crocante', 8.00, 35),
  ('Salada de Maionese', 'Salada com batatas e maionese', 6.50, 25),
  ('Feijão Tropeiro', 'Feijão com farofa e carne de sol', 18.50, 10),
  ('Coxinha', 'Coxinha de frango', 5.00, 50),
  ('Pão de Alho', 'Pão com manteiga de alho', 7.00, 40),
  ('Sopa de Legumes', 'Sopa caseira de legumes', 12.00, 15),
  ('Espetinho de Queijo', 'Espetinho de queijo coalho', 13.00, 30),
  ('Chopp', 'Chopp gelado', 9.00, 60),
  ('Suco Natural', 'Suco natural de laranja', 6.00, 45),
  ('Torta de Limão', 'Torta de limão com base de biscoito', 10.00, 20),
  ('Sobremesa de Chocolate', 'Sobremesa mousse de chocolate', 12.50, 10),
  ('Mojica', 'Prato típico de peixe com arroz e molho de dendê', 28.00, 5);
  
  INSERT INTO comanda (mesa, clienteNome, abertura, fechamento)
VALUES
  (6, 'Lucas Martins', '2025-02-13 18:15:00', '2025-02-13 20:45:00'),
  (7, 'Fernanda Oliveira', '2025-02-13 18:45:00', '2025-02-13 21:15:00'),
  (8, 'Tatiane Gomes', '2025-02-13 19:00:00', '2025-02-13 21:30:00'),
  (9, 'Pedro Henrique', '2025-02-13 19:30:00', '2025-02-13 22:00:00'),
  (10, 'Juliana Costa', '2025-02-13 20:00:00', '2025-02-13 22:30:00'),
  (11, 'Paulo Silva', '2025-02-13 20:30:00', '2025-02-13 23:00:00'),
  (12, 'Marcos Pereira', '2025-02-13 21:00:00', '2025-02-13 23:30:00'),
  (13, 'Cláudia Rocha', '2025-02-13 21:15:00', '2025-02-13 23:45:00'),
  (14, 'Gabriel Santos', '2025-02-13 21:30:00', '2025-02-13 23:59:00'),
  (15, 'Simone Alves', '2025-02-13 22:00:00', '2025-02-13 23:45:00'),
  (16, 'Roberta Ferreira', '2025-02-13 22:30:00', '2025-02-13 23:59:00'),
  (17, 'Daniel Costa', '2025-02-13 23:00:00', '2025-02-13 23:59:00'),
  (18, 'Carla Souza', '2025-02-13 18:20:00', '2025-02-13 20:50:00'),
  (19, 'Felipe Lima', '2025-02-13 18:50:00', '2025-02-13 21:10:00'),
  (20, 'Robson Almeida', '2025-02-13 19:10:00', '2025-02-13 21:40:00');
  (38, 21, 'Paulo Mantega', '2025-02-13 18:15:00', null);
  (39, 22, 'Mauro coelho', '2025-02-05 19:40:00', null);
  (40, 23, 'Maira Faisão', '2025-02-19 20:50:00', null);


  INSERT INTO pedido (idComanda, idProduto, dataPedido, nomePedido, qtdPedido)
VALUES
  (6, 1, '2025-02-13 18:20:00', 'Espetinho de Frango', 2),
  (6, 4, '2025-02-13 18:25:00', 'Cerveja', 3),
  (7, 2, '2025-02-13 18:50:00', 'Espetinho de Carne', 1),
  (7, 5, '2025-02-13 18:55:00', 'Refrigerante', 2),
  (8, 3, '2025-02-13 19:05:00', 'Bife à Parmegiana', 1),
  (8, 9, '2025-02-13 19:10:00', 'Pão de Alho', 1),
  (9, 6, '2025-02-13 19:35:00', 'Feijão Tropeiro', 2),
  (9, 7, '2025-02-13 19:40:00', 'Coxinha', 5),
  (10, 8, '2025-02-13 20:05:00', 'Batata Frita', 2),
  (10, 3, '2025-02-13 20:10:00', 'Bife à Parmegiana', 1),
  (11, 10, '2025-02-13 20:35:00', 'Espetinho de Queijo', 2),
  (11, 6, '2025-02-13 20:40:00', 'Feijão Tropeiro', 1),
  (12, 12, '2025-02-13 21:00:00', 'Sopa de Legumes', 2),
  (12, 13, '2025-02-13 21:05:00', 'Torta de Limão', 1),
  (13, 14, '2025-02-13 21:20:00', 'Sobremesa de Chocolate', 2),
  (14, 15, '2025-02-13 21:40:00', 'Mojica', 1),
  (15, 5, '2025-02-13 22:10:00', 'Salada de Maionese', 2),
  (16, 1, '2025-02-13 22:25:00', 'Espetinho de Frango', 1),
  (17, 3, '2025-02-13 22:40:00', 'Bife à Parmegiana', 1),
  (18, 11, '2025-02-13 18:25:00', 'Chopp', 3),
  (19, 7, '2025-02-13 19:00:00', 'Coxinha', 3),
  (20, 6, '2025-02-13 19:15:00', 'Feijão Tropeiro', 1);

  (41, 38, 17, '2025-02-13 18:15:00', 'Suco Natural', 4),
  (42, 39, 12, '2025-02-05 19:40:00', 'Coxinha', 8),
  (43, 40, 15, '2025-02-19 20:50:00', 'Espetinho de Queijo', 5);

  select * from pedido;
  select * from comanda;
  select * from produto;
  
