----------- CRIAÇÃO DAS TABELAS -----------------


---CRIAÇÃO TABELA CATEGORIA

create table categoria (

	id serial primary key,
	nome varchar(255) not null

);

---CRIAÇÃO TABELA PRODUTO

create table produto (

	id serial primary key,
	nome varchar(255) not null,
	descricao varchar(255) not null,
	preco decimal(10,2) not null,
	categoria_id integer not null,
	foreign key (categoria_id) references categoria (id)

);

---CRIAÇÃO TABELA CLIENTE

create table cliente (

	id serial primary key,
	nome varchar(255) not null

);

---CRIAÇÃO TABELA PEDIDO

create table pedido (

	id serial primary key,
	data timestamp not null,
	endereco_entrega text not null,
	cliente_id integer not null,
	foreign key (cliente_id) references cliente (id)

);

---CRIAÇÃO TABELA ITENS DOS PEDIDOS

create table item_pedido (

	id serial primary key,
	produto_id integer not null,
	pedido_id integer not null,
	quantidade integer not null,
	foreign key (produto_id) references produto(id),
	foreign key (pedido_id) references pedido(id)

);

-------- SCRIPT PARA INSERÇÃO DOS DADOS NA TABELA ---------

---OBS: O parâmetro para quantidade de dados inseridos nas tabelas está dentro da função generate_series, como segundo parâmetro, depois do 1.

---INSERÇÃO DAS CATEGORIAS

INSERT INTO categoria (nome)
SELECT 'Categoria'||i
FROM generate_series(1, 5) AS i;

---INSERÇÃO DOS PRODUTOS

INSERT INTO produto (nome, descricao, preco, categoria_id)
SELECT 'Produto'||i, 'Descrição do produto'||i, random()*(100-10)+10, random()*(tamanho-1)+1
FROM generate_series(1, 50) AS i, (SELECT count(*) as tamanho FROM categoria) as c;

---INSERÇÃO DOS CLIENTES

insert into cliente (nome)
SELECT 'Cliente'||i
FROM generate_series(1, 50) AS i;

---INSERÇÃO DOS PEDIDOS

INSERT INTO pedido (data, endereco_entrega, cliente_id)
SELECT NOW() - floor(random() * 365 + 1)::integer * interval '1 day', 'Endereço de entrega '||i, floor(random() * len_clientes + 1)::integer
FROM generate_series(1, 100) AS i, (SELECT count(*) as len_clientes from cliente) as c;


---INSERÇÃO DOS ITENS DOS PEDIDOS

---OBS: Para o caso da inserção dos itens dos pedidos, tive bastante dificuldade em fazer a script preencher vários ItensPedido para cada pedido, portanto para esse caso em específico a script está gerando um itempedido para cada pedido.

INSERT INTO item_pedido (pedido_id, produto_id, quantidade)
SELECT
  (SELECT id FROM pedido where pedido.id = i) AS pedido_id,
  (random()*(len_produtos-1)+1) AS produto_id,
  ROUND(random() * 10 + 1) AS quantidade
FROM generate_series(1, (SELECT COUNT(*) from pedido)) as i, (SELECT COUNT(id) as len_produtos FROM produto) as c

----------- CONSULTAS REQUISITADAS NO DESAFIO ---------------

--OBS: As consultas estão ordenadas conforme foram apresentadas no PDF do desafio, de cima para baixo.

-- * CONSULTA 1:

SELECT nome, descricao, preco
FROM produto
ORDER BY nome ASC;

-- * CONSULTA 2:

SELECT c.nome, COUNT(p.id) as num_produtos_associados
FROM categoria c
LEFT JOIN produto p ON c.id = p.categoria_id
GROUP BY c.id, c.nome
ORDER BY c.nome ASC;

-- * CONSULTA 3:

SELECT 
  p.id as pedido_id,
  p.data, 
  p.endereco_entrega, 
  SUM(produto.preco * item_pedido.quantidade) as total_pedido
FROM 
  pedido p
  JOIN item_pedido ON p.id = item_pedido.pedido_id
  JOIN produto ON produto.id = item_pedido.produto_id
GROUP BY 
  p.id, 
  p.data, 
  p.endereco_entrega
ORDER BY 
  p.data DESC;

-- * CONSULTA 4:

SELECT p.nome, p.descricao, p.preco, SUM(ip.quantidade) as quantidade_total_vendida
FROM produto p
JOIN item_pedido ip ON p.id = ip.produto_id
GROUP BY p.id
HAVING SUM(ip.quantidade) > 0
ORDER BY quantidade_total_vendida DESC;

-- * CONSULTA 5:

--OBS: Preencher o cliente desejado em WHERE c.nome e o perído desejado entre as datas do BETWEEN

SELECT c.nome as nome_cliente, p.data, p.endereco_entrega
FROM pedido p
JOIN cliente c ON p.cliente_id = c.id
WHERE c.nome = 'Cliente25'
AND p.data BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY p.id, c.nome
ORDER BY c.nome ASC, p.data ASC;

-- *CONSULTA 6:

SELECT nome, COUNT(*) as quantidade_replicacoes
FROM produto
GROUP BY nome
HAVING COUNT(*) > 1
ORDER BY quantidade_replicacoes DESC;
