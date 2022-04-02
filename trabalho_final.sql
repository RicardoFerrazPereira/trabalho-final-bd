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


alter table funcionario add CONSTRAINT "FK_produto.codigo_funcionario" FOREIGN KEY ("codigo_funcionario")
 REFERENCES "produto"("codigo_produto"); 

alter table telefone add CONSTRAINT "FK_cliente.codigo_telefone" FOREIGN KEY ("codigo_telefone")
 REFERENCES "cliente"("codigo_cliente"); 

alter table endereco_cliente add CONSTRAINT "FK_cliente.codigo_endereco" FOREIGN KEY ("codigo_endereco")
 REFERENCES "cliente"("codigo_cliente"); 

alter table categoria add CONSTRAINT "FK_produto.codigo_categoria" FOREIGN KEY ("codigo_categoria")
 REFERENCES "produto"("codigo_produto"); 
 
alter table produto add CONSTRAINT "FK_item_compra.codigo_produto" FOREIGN KEY ("codigo_produto")
 REFERENCES "item_compra"("codigo_item"); 

alter table item_compra add CONSTRAINT "FK_pedido.codigo_item" FOREIGN KEY ("codigo_item")
 REFERENCES "pedido"("codigo_pedido"); 
