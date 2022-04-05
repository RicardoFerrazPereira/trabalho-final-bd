/* 5.a*/
select nome_produto, nome_categoria, nome_funcionario
from produto p
inner join categoria c on p.codigo_categoria = c.codigo_categoria 
inner join funcionario f on f.codigo_funcionario = p.codigo_funcionario
order by nome_funcionario


/* 5.b*/
select codigo_pedido, nome, sobrenome, ddd_principal, telefone_principal, ddd_secundario, telefone_secundario
from pedido p
inner join cliente c
on p.codigo_cliente = c.codigo_cliente
inner join telefone_cliente tc 
on tc.codigo_telefone = c.codigo_telefone;

/*5.c*/

select pedido.codigo_pedido, nome, sobrenome, data_pedido, nome_produto, quantidade_comprada from item_compra
inner join produto
on(item_compra.codigo_produto = produto.codigo_produto)
inner join pedido 
on(item_compra.codigo_pedido = pedido.codigo_pedido)
inner join cliente
on(pedido.codigo_cliente = cliente.codigo_cliente);
--where pedido.codigo_pedido = 1,2,3...

/*5.d*/

select codigo_pedido, nome, sobrenome from pedido 
inner join cliente 
on(cliente.codigo_cliente = pedido.codigo_cliente)
order by nome 

/*bônus*/
select count(codigo_pedido) as quantidade_pedido, nome, sobrenome from pedido
	inner join cliente 
	on(pedido.codigo_cliente = cliente.codigo_cliente)
group by nome, sobrenome
order by nome, sobrenome asc;


/*bonus*/
select nome_funcionario, salario 
from funcionario 
order by salario desc
limit 3
offset 1;

