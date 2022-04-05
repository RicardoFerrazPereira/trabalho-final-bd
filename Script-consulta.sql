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


/*bonus*/

select nome_funcionario, salario 
from funcionario 
order by salario desc
limit 3
offset 1;

