create database "8bits" ;
CREATE TABLE "cliente" (
  "codigo_cliente" serial not null,
  "nome" varchar(50) not null,
  "sobrenome" varchar(100) not null,
  "login" varchar(15) not null,
  "senha" varchar(8) not null,
  "email_cliente" varchar(30) not null,
  "cpf_cliente" int8 not null,
  "data_nascimento" date not null,
  "codigo_telefone" integer not null,
  "codigo_endereco" integer not null,
  PRIMARY KEY ("codigo_cliente")
);

CREATE TABLE "pedido" (
  "codigo_pedido" serial not null,
  "data_pedido" date not null,
  "codigo_cliente" integer not null,
  "codigo_item" integer not null,
  PRIMARY KEY ("codigo_pedido"),
  CONSTRAINT "FK_pedido.codigo_cliente"
    FOREIGN KEY ("codigo_cliente")
      REFERENCES "cliente"("codigo_cliente")
);

CREATE TABLE "telefone" (
  "codigo_telefone" serial not null,
  "telefone_principal" integer not null,
  "telefone_secundario" integer,
  PRIMARY KEY ("codigo_telefone")
);

CREATE TABLE "funcionario" (
  "codigo_funcionario" serial not null,
  "nome_funcionario" varchar(50) not null,
  "cpf_funcionario" int8 not null,
  "salario" decimal,
  PRIMARY KEY ("codigo_funcionario")
);

CREATE TABLE "categoria" (
  "codigo_categoria" serial not null,
  "nome_categoria" varchar(50)  not null,
  "codigo_produto" integer not null,
  PRIMARY KEY ("codigo_categoria")
);

CREATE TABLE "endereco_cliente" (
  "codigo_endereco" serial not null,
  "rua" varchar(200),
  "numero_casa" integer,
  "bairro" varchar(50),
  "cidade" varchar(50),
  "estado" varchar(50),
  "cep" integer,
  PRIMARY KEY ("codigo_endereco")
);

CREATE TABLE "item_compra" (
  "codigo_item" serial not null,
  "quantidade_comprada" integer not null,
  "codigo_produto" integer not null,
  PRIMARY KEY ("codigo_item")
);

CREATE TABLE "produto" (
  "codigo_produto" serial not null,
  "nome_produto" varchar(50) not null,
  "quantidade_estoque" integer not null,
  "data_fabricacao" date,
  "valor_unitario" decimal not null,
  "data_cadastro" date,
  "codigo_funcionario" integer not null,
  PRIMARY KEY ("codigo_produto")
 );


alter table produto add CONSTRAINT "FK_produto.codigo_funcionario" FOREIGN KEY ("codigo_funcionario")
 REFERENCES "funcionario"("codigo_funcionario"); 

alter table cliente add CONSTRAINT "FK_cliente.codigo_endereco" FOREIGN KEY ("codigo_endereco")
 REFERENCES "endereco_cliente"("codigo_endereco"); 


alter table "categoria" add CONSTRAINT "FK_categoria.codigo_produto" FOREIGN KEY ("codigo_produto")
 REFERENCES "produto"("codigo_produto");

 
alter table item_compra add CONSTRAINT "FK_item_compra.codigo_produto" FOREIGN KEY ("codigo_produto")
 REFERENCES "produto"("codigo_produto"); 

alter table pedido add CONSTRAINT "FK_pedido.codigo_item" FOREIGN KEY ("codigo_item")
 REFERENCES "item_compra"("codigo_item"); 


insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Thiago', 99988877700, 2000);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Andrea', 11122233366, 2500);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Vanessa',22233366655, 3000);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Ricardo',33344455566, 3500);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Ariane', 44455566699, 4000);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Douglas',55566699988, 4500);


alter table telefone rename to telefone_cliente;
alter table cliente add CONSTRAINT "FK_cliente.codigo_telefone" FOREIGN KEY ("codigo_telefone") REFERENCES "telefone_cliente"("codigo_telefone");
alter table telefone_cliente rename column telefone_principal to ddd_principal
alter table telefone_cliente rename column telefone_secundario to telefone_principal
alter table telefone_cliente add column ddd_secundario integer; ]
alter table telefone_cliente add column telefone_secundario integer; 
alter table endereco_cliente add column cep integer not null;
alter table endereco_cliente add column rua varchar(30) not null;
alter table endereco_cliente add column numero integer not null;
alter table endereco_cliente add column complemento varchar(15);
alter table endereco_cliente add column bairro varchar(20) not null;
alter table endereco_cliente add column cidade varchar(20) not null;
alter table endereco_cliente add column estado varchar(2) not null;

insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (21, 998889988, 21, 26435343);
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (21, 998889989, 21, 26435344);
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (21, 998889990, 21, 26435345);
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (21, 998889991, 21, 26435346);
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960550, 'Rua Rui Barbosa', 200, ' ' , 'Agri�es', 'Teres�polis', 'RJ');
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960555, 'Av. Slooper', 1500, 'casa 01' , 'Alto', 'Teres�polis', 'RJ');
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960552, 'Rua Parana', 10, ' ', 'Centro', 'Teres�polis', 'RJ');
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960560, 'Av. Lucio Meira', 1830, 'ap. 502' , 'Barra', 'Teres�polis', 'RJ');
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Jose', 'Ferreira', 'jose', 'j12345' , 'jose@gmail.com', 07635687920, '1990-10-10', 1, 1);
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Maria', 'Antunes', 'maria', 'm12345' , 'mariae@gmail.com', 87635687920, '1991-9-20', 2, 2);
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Flavio', 'Malone', 'flavio', 'f12345' , 'flavio@gmail.com', 97635687920, '1977-01-5', 3, 3);
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Renata', 'Castro', 'renata', 'r12345' , 'renata@gmail.com', 94565687920, '1980-07-09', 4, 4);



insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario)
values('Pc Serratec', 3,'2022-02-22',2499.99,'2022-04-02',6 );
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario)
values('Serra Station 8',4,'2022-02-02',5499.99,'2022-04-02',5);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario)
values('Super L�gica',2,'2022-02-10',3499.99,'2022-04-02',3);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario)
values('N�o Entendo Switch',5,'2022-02-10',2499.99,'2022-04-02',6);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario)
values('Serra Drive',1,'2022-02-10',1099.99,'2022-04-02',1);





