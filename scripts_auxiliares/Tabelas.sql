Rem
Rem TABELAS.SQL
Rem CRIADO EM Jun'98 POR ODÉCIO SOUZA, 
Rem baseado no script summit2a.sql da Oracle Education
Rem 
Rem
Rem CUIDADO !!!  !!!  !!!  !!!  !!!  !!!  !!!  !!!  !!!
Rem Antes de criadas as tabelas, todos os objetos existentes
Rem serão DESTRUIDOS  !!!  !!!  !!!  !!!  !!!  !!!  !!!
Rem
set echo off
alter session set NLS_date_format = 'dd-MON-yyyy'; 
alter session set NLS_territory = America;
alter session set NLS_language = English;



-- connect &Usuario/&senha@&banco

prompt CUIDADO !!!  !!!  todos os objetos existentes serão DESTRUIDOS  !!!  !!!  
prompt Pressione [Enter] para continuar, [Ctrl]+[C] para desistir
pause
prompt CUIDADO !!!  !!!  Tem certeza ??? ???  
prompt Pressione [Enter] para continuar, [Ctrl]+[C] para desistir
pause

set feedback off
set heading off
set pagesize 0
spool droptabs.lis
select 'drop '||object_type||' '||object_name||' CASCADE CONSTRAINTS'||chr(10)||'/'
from user_objects
where object_type not in ( 'INDEX','CLUSTER','DATABASE LINK', 'SYNONYM', 
'SEQUENCE','PROCEDURE','PACKAGE BODY','PACKAGE','FUNCTION','TRIGGER')
order by object_type desc
/
spool off
spool dropothe.lis
select 'drop '||object_type||' '||object_name||chr(10)||'/'
from user_objects
where object_type in ('CLUSTER','DATABASE LINK', 'SYNONYM', 'SEQUENCE',
    'PROCEDURE','PACKAGE BODY','FUNCTION','PACKAGE')
order by object_type desc
/
spool off
start droptabs.lis
start dropothe.lis

set pagesize 17
set heading on

set feedback off
prompt Criando e populando Tabelas e Sequencias.  Aguarde.

CREATE SEQUENCE cliente_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 216
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE SEQUENCE depto_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 51
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE SEQUENCE empregado_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 26
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE SEQUENCE imagem_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1981
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE SEQUENCE textolongo_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1369
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE SEQUENCE pedido_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 113
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE SEQUENCE produto_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 50537
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE SEQUENCE regiao_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 6
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE SEQUENCE armazem_cod
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 10502
   NOCACHE 
   NOORDER 
   NOCYCLE
/
CREATE TABLE cliente 
(cod                        NUMBER(7) 
   CONSTRAINT cod_cliente_nn NOT NULL,
 nome                      VARCHAR2(50) 
   CONSTRAINT nome_cliente_nn NOT NULL,
 fone                      VARCHAR2(25),
 endereco                  VARCHAR2(400),
 cidade                    VARCHAR2(30),
 estado                    VARCHAR2(20),
 pais                      VARCHAR2(30),
 cep                       VARCHAR2(75),
 tipo_credito              VARCHAR2(9),
 cod_vendedor              NUMBER(7),
 cod_regiao                 NUMBER(7),
 comentario                VARCHAR2(255),
     CONSTRAINT cod_cliente_pk PRIMARY KEY (cod),
     CONSTRAINT tipo_credito_cliente_ck
        CHECK (tipo_credito IN ('EXCELENTE', 'BOM', 'RUIM')))
/
INSERT INTO cliente VALUES (
   201, 'Canarinho', '55-11-2066101',
   '72 Via Bahia', 'Sao Paulo', NULL, 'Brasil', NULL,
   'EXCELENTE', 12, 2, 'O cliente normalmente adquire grandes quantidades e possue ' ||
   'um alto total de compras.  Condcao perfeita enquanto seu credito continuar ' ||
   'excelente.')
/
INSERT INTO cliente VALUES (
   202, 'Simms Athletics', '81-20101',
   '6741 Takashi Blvd.', 'Osaka', NULL, 'Japao', NULL,
   'RUIM', 14, 4, 'Deve pagar sempre a vista, ate que sua situacao de credito melhore.')
/
INSERT INTO cliente VALUES (
   203, 'Delhi Sports', '91-10351',
   '11368 Chanakya', 'New Delhi', NULL, 'India', NULL,
   'BOM', 14, 4, 'Cliente especializado em equipamentos de Baiseball, sendo o maior ' ||
   'varejista da India.')
/
INSERT INTO cliente VALUES (
   204, 'Womansport', '1-206-104-0103',
   '281 King Street', 'Seattle', 'Washington', 'USA', '98101',
   'EXCELENTE', 11, 1, NULL)
/
INSERT INTO cliente VALUES (
   205, 'Kam''s Sporting Goods', '852-3692888',
   '15 Henessey Road', 'Hong Kong', NULL, NULL, NULL,
   'EXCELENTE', 15, 4, NULL)
/
INSERT INTO cliente VALUES (
   206, 'Sportique', '33-2257201',
   '172 Rue de Rivoli', 'Cannes', NULL, 'France', NULL,
   'EXCELENTE', 15, 5, 'Cliente especializado em futebol.  Tem preferencia por ' ||
   'accessorios em cores brilhantes.')
/
INSERT INTO cliente VALUES (
   207, 'Sweet Rock Sports', '234-6036201',
   '6 Saint Antoine', 'Lagos', NULL, 'Nigeria', NULL,
   'BOM', NULL, 3, NULL)
/
INSERT INTO cliente VALUES (
   208, 'Muench Sports', '49-527454',
   '435 Gruenestrasse', 'Stuttgart', NULL, 'Germany', NULL,
   'BOM', 15, 5, 'Cliente normalmente paga pequenos pedidos a vista e ' ||
   'grandes pedidos a credito.')
/
INSERT INTO cliente VALUES (
   209, 'Beisbol Si!', '809-352689',
   '792 Playa Del Mar', 'San Pedro de Macon''s', NULL, 'Dominican Republic', 
   NULL, 'EXCELENTE', 11, 1, NULL)
/
INSERT INTO cliente VALUES (
   210, 'Futbol Sonora', '52-404562',
   '3 Via Saguaro', 'Nogales', NULL, 'Mexico', NULL,
   'EXCELENTE', 12, 2, 'Cliente dificilmente encontrado por telefone. Tentar correio.')
/
INSERT INTO cliente VALUES (
   211, 'Kuhn''s Sports', '42-111292',
   '7 Modrany', 'Prague', NULL, 'Czechoslovakia', NULL,
   'EXCELENTE', 15, 5, NULL)
/
INSERT INTO cliente VALUES (
   212, 'Hamada Sport', '20-1209211',
   '57A Corniche', 'Alexandria', NULL, 'Egypt', NULL,
   'EXCELENTE', 13, 3, 'Cliente especializado em equipamentos de mergulho.')
/
INSERT INTO cliente VALUES (
   213, 'Big John''s Sports Emporium', '1-415-555-6281',
   '4783 18th Street', 'San Francisco', 'CA', 'USA', '94117',
   'EXCELENTE', 11, 1, 'Cliente possue um confiavel e alto nivel de credito.')
/
INSERT INTO cliente VALUES (
   214, 'Ojibway Retail', '1-716-555-7171',
   '415 Main Street', 'Buffalo', 'NY', 'USA', '14202',
   'RUIM', 11, 1, NULL)
/
INSERT INTO cliente VALUES (
   215, 'Sporta Russia', '7-3892456',
   '6000 Yekatamina', 'Saint Petersburg', NULL, 'Russia', NULL,
   'RUIM', 15, 5, 'Cliente extremamente amigavel mas tem dificuldades em pagar ' ||
   'contas. Insistir em pagamento a vista.')
/
COMMIT
/
CREATE TABLE depto 
(cod                         NUMBER(7) 
   CONSTRAINT cod_depto_nn NOT NULL,
 nome                       VARCHAR2(25) 
   CONSTRAINT nome_depto_nn NOT NULL,
 cod_regiao                  NUMBER(7),
     CONSTRAINT cod_depto_pk PRIMARY KEY (cod),
     CONSTRAINT nome_depto_cod_regiao_uk UNIQUE (nome, cod_regiao))
/
INSERT INTO depto VALUES (
   10, 'Financeiro', 1)
/
INSERT INTO depto VALUES (
   31, 'Vendas', 1)
/
INSERT INTO depto VALUES (
   32, 'Vendas', 2)
/
INSERT INTO depto VALUES (
   33, 'Vendas', 3)
/
INSERT INTO depto VALUES (
   34, 'Vendas', 4)
/
INSERT INTO depto VALUES (
   35, 'Vendas', 5)
/
INSERT INTO depto VALUES (
   41, 'Operacoes', 1)
/
INSERT INTO depto VALUES (
   42, 'Operacoes', 2)
/
INSERT INTO depto VALUES (
   43, 'Operacoes', 3)
/
INSERT INTO depto VALUES (
   44, 'Operacoes', 4)
/
INSERT INTO depto VALUES (
   45, 'Operacoes', 5)
/
INSERT INTO depto VALUES (
   50, 'Administracao', 1)
/
COMMIT
/
CREATE TABLE empregado 
(cod                         NUMBER(7) 
   CONSTRAINT cod_empregado_nn NOT NULL,
 nome                       VARCHAR2(25),
 sobrenome                  VARCHAR2(25) 
   CONSTRAINT sobrenome_empregado_nn NOT NULL,
 userid                     VARCHAR2(8)
   CONSTRAINT userid_empregado_nn NOT NULL,
 admissao                   DATE,
 comentario                 VARCHAR2(255),
 cod_gerente                 NUMBER(7),
 cargo                      VARCHAR2(25),
 cod_depto                   NUMBER(7),
 salario                    NUMBER(11, 2),
 comissao                   NUMBER(4, 2),
     CONSTRAINT cod_empregado_pk PRIMARY KEY (cod),
     CONSTRAINT userid_empregado_uk UNIQUE (userid),
     CONSTRAINT comissao_empregado_ck
        CHECK (comissao IN (10, 12.5, 15, 17.5, 20)))
/
INSERT INTO empregado VALUES (
  1, 'Carmen', 'Miranda', 'cmiranda',
   to_date('03-MAR-1996 8:30', 'dd-mon-yyyy hh24:mi'), NULL, NULL, 'Presidente',
   50, 2500, NULL)
/
INSERT INTO empregado VALUES (
   2, 'Marcos', 'Marques', 'mmarques',
   '08-MAR-1996', NULL, 1, 'VP, Operacoes',
   41, 1450, NULL)
/
INSERT INTO empregado VALUES (
   3, 'Marcelo', 'Miranda', 'mmiranda',
   '17-JUN-1997', NULL, 1, 'VP, Vendas',
   31, 1400, NULL)
/
INSERT INTO empregado VALUES (
   4, 'Veronica', 'Vieira', 'vevieira', 
   '07-APR-1996', NULL, 1, 'VP, Financeiro', 
   10, 1450, NULL)
/
INSERT INTO empregado VALUES (
   5, 'Fernando', 'Fernandes', 'ffernand',
   '04-MAR-1996', NULL, 1, 'VP, Administracao',
   50, 1550, NULL)
/
INSERT INTO empregado VALUES (
   6, 'Andre', 'Andrade', 'aandrade',
   '18-JAN-1997', NULL, 2, 'Gerente de Armazem',
   41, 1200, NULL)
/
INSERT INTO empregado VALUES (
   7, 'Roberta', 'Rocha', 'robrocha',
   '14-MAY-1996', NULL, 2, 'Gerente de Armazem',
   42, 1250, NULL)
/
INSERT INTO empregado VALUES (
   8, 'Vitor', 'Vandre', 'vivandre',
   '07-APR-1996', NULL, 2, 'Gerente de Armazem',
   43, 1100, NULL)
/
INSERT INTO empregado VALUES (
   9, 'Antenor', 'Antunes', 'aantunes',
   '09-FEB-1998', NULL, 2, 'Gerente de Armazem',
   44, 1300, NULL)
/
INSERT INTO empregado VALUES (
   10, 'Carlos', 'Carvalho', 'ccarvalh',
   '27-FEB-1997', NULL, 2, 'Gerente de Armazem',
   45, 1307, NULL)
/
INSERT INTO empregado VALUES (
   11, 'Jose', 'Jariel', 'jojariel',
   '14-MAY-1996', NULL, 3, 'Vendedor',
   31, 1400, 10)
/
INSERT INTO empregado VALUES (
   12, 'Rodolfo', 'Rodrigues', 'rorodrig',
   '18-JAN-1998', NULL, 3, 'Vendedor',
   32, 1490, 12.5)
/
INSERT INTO empregado VALUES (
   13, 'Marcel', 'Mendes', 'mamendes',
   '18-FEB-1997', NULL, 3, 'Vendedor',
   33, 1515, 10)
/
INSERT INTO empregado VALUES (
   14, 'Nilson', 'Nogueira', 'nnogueir',
   '22-JAN-1998', NULL, 3, 'Vendedor',
   34, 1525, 15)
/
INSERT INTO empregado VALUES (
   15, 'Sandra', 'Sadia', 'sansadia',
   '09-OCT-1997', NULL, 3, 'Vendedor',
   35, 1450, 17.5)
/
INSERT INTO empregado VALUES (
   16, 'Elena', 'Ernandes', 'eernande',
   '07-FEB-1998', NULL, 6, 'Auxiliar',
   41, 1400, NULL)
/
INSERT INTO empregado VALUES (
   17, 'Lucas', 'Leite', 'lucleite',
   '08-MAR-1996', NULL, 6, 'Auxiliar',
   41, 940, NULL)
/
INSERT INTO empregado VALUES (
   18, 'Olavo', 'Oliveira', 'ooliveir',
   '09-FEB-1997', NULL, 7, 'Auxiliar',
   42, 1200, NULL)
/
INSERT INTO empregado VALUES (
   19, 'Silvia', 'Silva', 'sasilva',
   '06-AUG-1997', NULL, 7, 'Auxiliar',
   42, 795, NULL)
/
INSERT INTO empregado VALUES (
   20, 'Antonio', 'Alvares', 'aalvares',
   '21-JUL-1997', NULL, 8, 'Auxiliar',
   43, 750, NULL)
/
INSERT INTO empregado VALUES (
   21, 'Bernardo', 'Bernardes', 'bbernade',
   '26-MAY-1997', NULL, 8, 'Auxiliar',
   43, 850, NULL)
/
INSERT INTO empregado VALUES (
   22, 'Arnaldo', 'Antunes', 'aantune',
   '30-NOV-1996', NULL, 9, 'Auxiliar',
   44, 800, NULL)
/
INSERT INTO empregado VALUES (
   23, 'Silvio', 'Silva', 'sosilva',
   '17-OCT-1996', NULL, 9, 'Auxiliar',
   34, 795, NULL)
/
INSERT INTO empregado VALUES (
   24, 'Samuel', 'Souza', 'samsouza',
   '17-MAR-1997', NULL, 10, 'Auxiliar',
   45, 860, NULL)
/
INSERT INTO empregado VALUES (
   25, 'Salomao', 'Souza', 'salsouza',
   '09-MAY-1997', NULL, 10, 'Auxiliar',
   45, 1100, NULL)
/
COMMIT
/
CREATE TABLE imagem 
(cod                         NUMBER(7) 
   CONSTRAINT cod_imagem_nn NOT NULL,
 formato                    VARCHAR2(25),
 usa_arquivo                VARCHAR2(1),
 nome_arquivo               VARCHAR2(255),
 imagem                     LONG RAW,
     CONSTRAINT cod_imagem_pk
        PRIMARY KEY (cod),
     CONSTRAINT formato_imagem_ck
        CHECK (formato in ('JFIFF', 'JTIFF')),
     CONSTRAINT usa_arquivo_imagem_ck
        CHECK (usa_arquivo in ('S', 'N')))
/
INSERT INTO imagem VALUES (
   1001, 'JTIFF', 'S', 'bunboot.tif', NULL)
/
INSERT INTO imagem VALUES (
   1002, 'JTIFF', 'S', 'aceboot.tif', NULL)
/
INSERT INTO imagem VALUES (
   1003, 'JTIFF', 'S', 'proboot.tif', NULL)
/
INSERT INTO imagem VALUES (
   1011, 'JTIFF', 'S', 'bunpole.tif', NULL)
/
INSERT INTO imagem VALUES (
   1012, 'JTIFF', 'S', 'acepole.tif', NULL)
/
INSERT INTO imagem VALUES (
   1013, 'JTIFF', 'S', 'propole.tif', NULL)
/
INSERT INTO imagem VALUES (
   1291, 'JTIFF', 'S', 'gpbike.tif', NULL)
/
INSERT INTO imagem VALUES (
   1296, 'JTIFF', 'S', 'himbike.tif', NULL)
/
INSERT INTO imagem VALUES (
   1829, 'JTIFF', 'S', 'safthelm.tif', NULL)
/
INSERT INTO imagem VALUES (
   1381, 'JTIFF', 'S', 'probar.tif', NULL)
/
INSERT INTO imagem VALUES (
   1382, 'JTIFF', 'S', 'curlbar.tif', NULL)
/
INSERT INTO imagem VALUES (
   1119, 'JTIFF', 'S', 'baseball.tif', NULL)
/
INSERT INTO imagem VALUES (
   1223, 'JTIFF', 'S', 'chaphelm.tif', NULL)
/
INSERT INTO imagem VALUES (
   1367, 'JTIFF', 'S', 'grglove.tif', NULL)
/
INSERT INTO imagem VALUES (
   1368, 'JTIFF', 'S', 'alglove.tif', NULL)
/
INSERT INTO imagem VALUES (
   1369, 'JTIFF', 'S', 'stglove.tif', NULL)
/
INSERT INTO imagem VALUES (
   1480, 'JTIFF', 'S', 'cabbat.tif', NULL)
/
INSERT INTO imagem VALUES (
   1482, 'JTIFF', 'S', 'pucbat.tif', NULL)
/
INSERT INTO imagem VALUES (
   1486, 'JTIFF', 'S', 'winbat.tif', NULL)
/
COMMIT
/
CREATE TABLE inventario 
(cod_produto                 NUMBER(7) 
   CONSTRAINT cod_produto_inventario_nn NOT NULL,
 cod_armazem                 NUMBER(7) 
   CONSTRAINT cod_armazem_inventario_nn NOT NULL,
 quantidade_em_estoque      NUMBER(9),
 ponto_de_reposicao         NUMBER(9),
 maximo_em_estoque          NUMBER(9),
 comentario_se_sem_estoque  VARCHAR2(255),
 data_de_reposicao               DATE,
     CONSTRAINT cod_prod_cod_armaz_invent_pk
        PRIMARY KEY (cod_produto, cod_armazem))
/
INSERT INTO inventario VALUES (
   10011, 101, 650, 625, 1100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10012, 101, 600, 560, 1000, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10013, 101, 400, 400, 700, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10021, 101, 500, 425, 740, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10022, 101, 300, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10023, 101, 400, 300, 525, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20106, 101, 993, 625, 1000, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20108, 101, 700, 700, 1225, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20201, 101, 802, 800, 1400, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20510, 101, 1389, 850, 1400, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20512, 101, 850, 850, 1450, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30321, 101, 2000, 1500, 2500, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30326, 101, 2100, 2000, 3500, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30421, 101, 1822, 1800, 3150, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30426, 101, 2250, 2000, 3500, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30433, 101, 650, 600, 1050, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32779, 101, 2120, 1250, 2200, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32861, 101, 505, 500, 875, NULL, NULL)
/
INSERT INTO inventario VALUES (
   40421, 101, 578, 350, 600, NULL, NULL)
/
INSERT INTO inventario VALUES (
   40422, 101, 0, 350, 600, 'Venda extraordinariamente boa...', '08-FEB-1998')
/
INSERT INTO inventario VALUES (
   41010, 101, 250, 250, 437, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41020, 101, 471, 450, 750, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41050, 101, 501, 450, 750, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41080, 101, 400, 400, 700, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41100, 101, 350, 350, 600, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50169, 101, 2530, 1500, 2600, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50273, 101, 233, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50417, 101, 518, 500, 875, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50418, 101, 244, 100, 275, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50419, 101, 230, 120, 310, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50530, 101, 669, 400, 700, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50532, 101, 0, 100, 175, 'Esperando a primavera.', '12-APR-1998')
/
INSERT INTO inventario VALUES (
   50536, 101, 173, 100, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20106, 201, 220, 150, 260, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20108, 201, 166, 150, 260, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20201, 201, 320, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20510, 201, 175, 100, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20512, 201, 162, 100, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30321, 201, 96, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30326, 201, 147, 120, 210, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30421, 201, 102, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30426, 201, 200, 120, 210, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30433, 201, 130, 130, 230, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32779, 201, 180, 150, 260, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32861, 201, 132, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50169, 201, 225, 220, 385, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50273, 201, 75, 60, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50417, 201, 82, 60, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50418, 201, 98, 60, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50419, 201, 77, 60, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50530, 201, 62, 60, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50532, 201, 67, 60, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50536, 201, 97, 60, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20510, 301, 69, 40, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20512, 301, 28, 20, 50, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30321, 301, 85, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30421, 301, 102, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30433, 301, 35, 20, 35, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32779, 301, 102, 95, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32861, 301, 57, 50, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   40421, 301, 70, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   40422, 301, 65, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41010, 301, 59, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41020, 301, 61, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41050, 301, 49, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41080, 301, 50, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41100, 301, 42, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20510, 401, 88, 50, 100, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20512, 401, 75, 75, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30321, 401, 102, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30326, 401, 113, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30421, 401, 85, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30426, 401, 135, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30433, 401, 0, 100, 175, 'Lote defeituoso. Fornecedor somente resolvera  ' ||
   'a situacao em Fevereiro.', '07-SEP-1997')
/
INSERT INTO inventario VALUES (
   32779, 401, 135, 100, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32861, 401, 250, 150, 250, NULL, NULL)
/
INSERT INTO inventario VALUES (
   40421, 401, 47, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   40422, 401, 50, 40, 70, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41010, 401, 80, 70, 220, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41020, 401, 91, 70, 220, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41050, 401, 169, 70, 220, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41080, 401, 100, 70, 220, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41100, 401, 75, 70, 220, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50169, 401, 240, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50273, 401, 224, 150, 280, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50417, 401, 130, 120, 210, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50418, 401, 156, 100, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50419, 401, 151, 150, 280, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50530, 401, 119, 100, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50532, 401, 233, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   50536, 401, 138, 100, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10012, 10501, 300, 300, 525, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10013, 10501, 314, 300, 525, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10022, 10501, 502, 300, 525, NULL, NULL)
/
INSERT INTO inventario VALUES (
   10023, 10501, 500, 300, 525, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20106, 10501, 150, 100, 175, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20108, 10501, 222, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20201, 10501, 275, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20510, 10501, 57, 50, 87, NULL, NULL)
/
INSERT INTO inventario VALUES (
   20512, 10501, 62, 50, 87, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30321, 10501, 194, 150, 275, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30326, 10501, 277, 250, 440, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30421, 10501, 190, 150, 275, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30426, 10501, 423, 250, 450, NULL, NULL)
/
INSERT INTO inventario VALUES (
   30433, 10501, 273, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32779, 10501, 280, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   32861, 10501, 288, 200, 350, NULL, NULL)
/
INSERT INTO inventario VALUES (
   40421, 10501, 97, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   40422, 10501, 90, 80, 140, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41010, 10501, 151, 140, 245, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41020, 10501, 224, 140, 245, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41050, 10501, 157, 140, 245, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41080, 10501, 159, 140, 245, NULL, NULL)
/
INSERT INTO inventario VALUES (
   41100, 10501, 141, 140, 245, NULL, NULL)
/
COMMIT
/
CREATE TABLE item 
(cod_pedido                 NUMBER(7) 
   CONSTRAINT cod_pedido_item_nn NOT NULL,
 cod_item                   NUMBER(7) 
   CONSTRAINT cod_item_item_nn NOT NULL,
 cod_produto                NUMBER(7) 
   CONSTRAINT cod_produto_item_nn NOT NULL,
 preco                      NUMBER(11, 2),
 quantidade                 NUMBER(9),
 quantidade_embarcada        NUMBER(9),
     CONSTRAINT cod_pedido_cod_item_item_pk PRIMARY KEY (cod_pedido, cod_item),
     CONSTRAINT cod_pedido_cod_produto_item_uk UNIQUE (cod_pedido, cod_produto))
/
INSERT INTO item VALUES (
   100, 1, 10011, 135, 500, 500)
/
INSERT INTO item VALUES (
   100, 2, 10013, 380, 400, 400)
/
INSERT INTO item VALUES (
   100, 3, 10021, 14, 500, 500)
/
INSERT INTO item VALUES (
   100, 5, 30326, 582, 600, 600)
/
INSERT INTO item VALUES (
   100, 7, 41010, 8, 250, 250)
/
INSERT INTO item VALUES (
   100, 6, 30433, 20, 450, 450)
/
INSERT INTO item VALUES (
   100, 4, 10023, 36, 400, 400)
/
INSERT INTO item VALUES (
   101, 1, 30421, 16, 15, 15)
/
INSERT INTO item VALUES (
   101, 3, 41010, 8, 20, 20)
/
INSERT INTO item VALUES (
   101, 5, 50169, 4.29, 40, 40)
/
INSERT INTO item VALUES (
   101, 6, 50417, 80, 27, 27)
/
INSERT INTO item VALUES (
   101, 7, 50530, 45, 50, 50)
/
INSERT INTO item VALUES (
   101, 4, 41100, 45, 35, 35)
/
INSERT INTO item VALUES (
   101, 2, 40422, 50, 30, 30)
/
INSERT INTO item VALUES (
   102, 1, 20108, 28, 100, 100)
/
INSERT INTO item VALUES (
   102, 2, 20201, 123, 45, 45)
/
INSERT INTO item VALUES (
   103, 1, 30433, 20, 15, 15)
/
INSERT INTO item VALUES (
   103, 2, 32779, 7, 11, 11)
/
INSERT INTO item VALUES (
   104, 1, 20510, 9, 7, 7)
/
INSERT INTO item VALUES (
   104, 4, 30421, 16, 35, 35)
/
INSERT INTO item VALUES (
   104, 2, 20512, 8, 12, 12)
/
INSERT INTO item VALUES (
   104, 3, 30321, 1669, 19, 19)
/
INSERT INTO item VALUES (
   105, 1, 50273, 22.89, 16, 16)
/
INSERT INTO item VALUES (
   105, 3, 50532, 47, 28, 28)
/
INSERT INTO item VALUES (
   105, 2, 50419, 80, 13, 13)
/
INSERT INTO item VALUES (
   106, 1, 20108, 28, 46, 46)
/
INSERT INTO item VALUES (
   106, 4, 50273, 22.89, 75, 75)
/
INSERT INTO item VALUES (
   106, 5, 50418, 75, 98, 98)
/
INSERT INTO item VALUES (
   106, 6, 50419, 80, 27, 27)
/
INSERT INTO item VALUES (
   106, 2, 20201, 123, 21, 21)
/
INSERT INTO item VALUES (
   106, 3, 50169, 4.29, 125, 125)
/
INSERT INTO item VALUES (
   107, 1, 20106, 11, 50, 50)
/
INSERT INTO item VALUES (
   107, 3, 20201, 115, 130, 130)
/
INSERT INTO item VALUES (
   107, 5, 30421, 16, 55, 55)
/
INSERT INTO item VALUES (
   107, 4, 30321, 1669, 75, 75)
/
INSERT INTO item VALUES (
   107, 2, 20108, 28, 22, 22)
/
INSERT INTO item VALUES (
   108, 1, 20510, 9, 9, 9)
/
INSERT INTO item VALUES (
   108, 6, 41080, 35, 50, 50)
/
INSERT INTO item VALUES (
   108, 7, 41100, 45, 42, 42)
/
INSERT INTO item VALUES (
   108, 5, 32861, 60, 57, 57)
/
INSERT INTO item VALUES (
   108, 2, 20512, 8, 18, 18)
/
INSERT INTO item VALUES (
   108, 4, 32779, 7, 60, 60)
/
INSERT INTO item VALUES (
   108, 3, 30321, 1669, 85, 85)
/
INSERT INTO item VALUES (
   109, 1, 10011, 140, 150, 150)
/
INSERT INTO item VALUES (
   109, 5, 30426, 18.25, 500, 500)
/
INSERT INTO item VALUES (
   109, 7, 50418, 75, 43, 43)
/
INSERT INTO item VALUES (
   109, 6, 32861, 60, 50, 50)
/
INSERT INTO item VALUES (
   109, 4, 30326, 582, 1500, 1500)
/
INSERT INTO item VALUES (
   109, 2, 10012, 175, 600, 600)
/
INSERT INTO item VALUES (
   109, 3, 10022, 21.95, 300, 300)
/
INSERT INTO item VALUES (
   110, 1, 50273, 22.89, 17, 17)
/
INSERT INTO item VALUES (
   110, 2, 50536, 50, 23, 23)
/
INSERT INTO item VALUES (
   111, 1, 40421, 65, 27, 27)
/
INSERT INTO item VALUES (
   111, 2, 41080, 35, 29, 29)
/
INSERT INTO item VALUES (
   97, 1, 20106, 9, 1000, 1000)
/
INSERT INTO item VALUES (
   97, 2, 30321, 1500, 50, 50)
/
INSERT INTO item VALUES (
   98, 1, 40421, 85, 7, 7)
/
INSERT INTO item VALUES (
   99, 1, 20510, 9, 18, 18)
/
INSERT INTO item VALUES (
   99, 2, 20512, 8, 25, 25)
/
INSERT INTO item VALUES (
   99, 3, 50417, 80, 53, 53)
/
INSERT INTO item VALUES (
   99, 4, 50530, 45, 69, 69)
/
INSERT INTO item VALUES (
   112, 1, 20106, 11, 50, 50)
/
COMMIT
/
CREATE TABLE textolongo 
(cod                        NUMBER(7) 
   CONSTRAINT cod_textolongo_nn NOT NULL,
 usa_arquivo                VARCHAR2(1),
 nome_arquivo               VARCHAR2(255),
 texto                      VARCHAR2(2000),
     CONSTRAINT cod_textolongo_pk PRIMARY KEY (cod),
     CONSTRAINT textolongo_usa_arquivo_ck
        CHECK (usa_arquivo in ('S', 'N')))
/
INSERT INTO textolongo VALUES (
   1017, 'N', NULL, 
   'Joelheira para quaisquer atividades fisicas inclindo ciclismo e patinacao '||
   '(4 rodas, em linha e gelo). Tambem testado para suportar atividades como levantameto '||
   'de peso. Cintos de velcro permitem ajuste facil em qualquer tamanho. Revestimento '||
   'externo em varias cores, podem ser vendidos para combinar com qualquer uniforme.'||
   ' Pode ser utilizada na praia para cobrir joelhos mal formados.')
/
INSERT INTO textolongo VALUES (
   1019, 'N', NULL, 
   'Cotoveleira para quaisquer atividades fisicas inclindo ciclismo e patinacao '||
   '(4 rodas, em linha e gelo). Tambem testado para suportar atividades como levantameto '||
   'de peso. Cintos de velcro permitem ajuste facil em qualquer tamanho. Revestimento '||
   'externo em varias cores, podem ser vendidos para combinar com qualquer uniforme.')
/
INSERT INTO textolongo VALUES (
   1037, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   1039, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   1043, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   1286, 'N', NULL, 
   'Este e a unica garrafa de liquidos que voce precisara. Ela e leve e duravel, '||
   'sendo garantida para longa exposicao a exercicios. Vem com um conveniente adaptador '||
   'de velcro, proprio para ajusta-la a sua bicicleta ou qualquer outro equipamento '||
   'esportivo.')
/
INSERT INTO textolongo VALUES (
   1368, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   517, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   518, 'N', NULL, 
   'Perfeito para o iniciante. Entrada posteriror (de facil adaptacao a '||
   'qualquer engate), ajuste de controle de pressao para facil acesso. '||
   'Grande variedade de cores permite combinar com qualquer uniforme.')
/
INSERT INTO textolongo VALUES (
   519, 'N', NULL, 
   'Se voce ja domina as tecnicas basicas do esqui, esta pronto para este produto. '||
   'Seus acessorios sao auto-ajustaveis e se adaptarao aos seus conhecimentos e veloci'||
   'dade. Projetado para seguranca extra em ladeiras e saltos.')
/
INSERT INTO textolongo VALUES (
   520, 'N', NULL, 
   'Este produto combina atributos para profissionais do esqui com alta tecnica, '||
   'provendo-lhes o devido conforto. E construido com fibra que mantera seus pes '||
   'a temperatura do corpo. Estando perto da perfeicao, nao procure por mais nada! '||
   'Este e o melhor!')
/
INSERT INTO textolongo VALUES (
   527, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   528, 'N', NULL, 
   'Vara de esqui em aluminio extra-leve, possue diversos tamanhos e '||
   'cores vibrantes. Tiras de ajuste muito confortaveis.')
/
INSERT INTO textolongo VALUES (
   529, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   530, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   557, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   587, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   607, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   613, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   615, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   676, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   708, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   780, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   828, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   833, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   924, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   925, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   926, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   927, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   928, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   929, NULL, NULL, NULL)
/
INSERT INTO textolongo VALUES (
   933, 'N', NULL, 
   'Os mais fortes e confiaveis pneus para apaixonados por ciclismo em trilhas. '||
   'Garantido para manter-se cheios, o que reduzira outras marcas ao ferro-velho. '||
   'Esses pneus podem levar voce a lugares onde ninguem jamais ousou pedalar. '||
   'Tamanhos para qualquer marca de bicicletas para trilhas. Blindagens em aco dispo'||
   'niveis atraves de encomenda especifica.')
/
INSERT INTO textolongo VALUES (
   940, NULL, NULL, NULL)
/
COMMIT
/
CREATE TABLE pedido 
(cod                        NUMBER(7) 
   CONSTRAINT cod_pedido_nn NOT NULL,
 cod_cliente                NUMBER(7) 
   CONSTRAINT cod_cliente_pedido_nn NOT NULL,
 data_pedido                DATE,
 data_embarque              DATE,
 cod_vendedor               NUMBER(7),
 total                      NUMBER(11, 2),
 tipo_pagamento             VARCHAR2(7),
 embarque_completo          VARCHAR2(1),
     CONSTRAINT cod_pedido_pk PRIMARY KEY (cod),
     CONSTRAINT tipo_pagamento_pedido_ck
        CHECK (tipo_pagamento in ('A VISTA', 'CREDITO')),
     CONSTRAINT embarque_completo_pedido_ck
        CHECK (embarque_completo in ('S', 'N')))
/
INSERT INTO pedido VALUES (
   100, 204, '31-AUG-1992', '10-SEP-1992',
   11, 601100, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   101, 205, '31-AUG-1992', '15-SEP-1992',
   14, 8056.6, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   102, 206, '01-SEP-1992', '08-SEP-1992',
   15, 8335, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   103, 208, '02-SEP-1992', '22-SEP-1992',
   15, 377, 'A VISTA', 'S')
/
INSERT INTO pedido VALUES (
   104, 208, '03-SEP-1992', '23-SEP-1992',
   15, 32430, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   105, 209, '04-SEP-1992', '18-SEP-1992',
   11, 2722.24, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   106, 210, '07-SEP-1992', '15-SEP-1992',
   12, 15634, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   107, 211, '07-SEP-1992', '21-SEP-1992',
   15, 142171, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   108, 212, '07-SEP-1992', '10-SEP-1992',
   13, 149570, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   109, 213, '08-SEP-1992', '28-SEP-1992',
   11, 1020935, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   110, 214, '09-SEP-1992', '21-SEP-1992',
   11, 1539.13, 'A VISTA', 'S')
/
INSERT INTO pedido VALUES (
   111, 204, '09-SEP-1992', '21-SEP-1992',
   11, 2770, 'A VISTA', 'S')
/
INSERT INTO pedido VALUES (
   97, 201, '28-AUG-1992', '17-SEP-1992',
   12, 84000, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   98, 202, '31-AUG-1992', '10-SEP-1992',
   14, 595, 'A VISTA', 'S')
/
INSERT INTO pedido VALUES (
   99, 203, '31-AUG-1992', '18-SEP-1992',
   14, 7707, 'CREDITO', 'S')
/
INSERT INTO pedido VALUES (
   112, 210, '31-AUG-1992', '10-SEP-1992',
   12, 550, 'CREDITO', 'S')
/
COMMIT
/
CREATE TABLE produto 
(cod                         NUMBER(7) 
   CONSTRAINT cod_produto_nn NOT NULL,
 nome                       VARCHAR2(50) 
   CONSTRAINT nome_produto_nn NOT NULL,
 descricao                  VARCHAR2(255),
 cod_textolongo             NUMBER(7),
 cod_imagem                 NUMBER(7),
 preco_sugerido_varejo      NUMBER(11, 2),
 unidades_no_varejo         VARCHAR2(25),
     CONSTRAINT cod_produto_pk PRIMARY KEY (cod),
     CONSTRAINT nome_produto_uk UNIQUE (nome))
/
INSERT INTO produto VALUES (
   10011, 'Bunny Boot',
   'Bota de esqui para iniciantes',
   518, 1001,
   150, NULL)
/
INSERT INTO produto VALUES (
   10012, 'Ace Ski Boot',
   'Bota de esqui para amadores',
   519, 1002,
   200, NULL)
/
INSERT INTO produto VALUES (
   10013, 'Pro Ski Boot',
   'Bota de esqui para profissionais',
   520, 1003,
   410, NULL)
/
INSERT INTO produto VALUES (
   10021, 'Bunny Ski Pole',
   'Vara de esqui para iniciantes',
   528, 1011,
   16.25, NULL)
/
INSERT INTO produto VALUES (
   10022, 'Ace Ski Pole',
   'Vara de esqui para amadores',
   529, 1012,
   21.95, NULL)
/
INSERT INTO produto VALUES (
   10023, 'Pro Ski Pole',
   'Vara de esqui para profissionais',
   530, 1013,
   40.95, NULL)
/
INSERT INTO produto VALUES (
   20106, 'Junior Soccer Ball',
   'Bola de futebol para amadores',
   613, NULL,
   11, NULL)
/
INSERT INTO produto VALUES (
   20108, 'World Cup Soccer Ball',
   'Bola de futebol profissional',
   615, NULL,
   28, NULL)
/
INSERT INTO produto VALUES (
   20201, 'World Cup Net',
   'Rede de futebol profissional',
   708, NULL,
   123, NULL)
/
INSERT INTO produto VALUES (
   20510, 'Black Hawk Knee Pads',
   'Joelheira (par)',
   1017, NULL,
   9, NULL)
/
INSERT INTO produto VALUES (
   20512, 'Black Hawk Elbow Pads',
   'Cotoveleira (par)',
   1019, NULL,
   8, NULL)
/
INSERT INTO produto VALUES (
   30321, 'Grand Prix Bicycle',
   'Bicicleta para corrida',
   828, 1291,
   1669, NULL)
/
INSERT INTO produto VALUES (
   30326, 'Himalaya Bicycle',
   'Bicicleta para trilhas',
   833, 1296,
   582, NULL)
/
INSERT INTO produto VALUES (
   30421, 'Grand Prix Bicycle Tires',
   'Pneus para bicicletas de corrida',
   927, NULL,
   16, NULL)
/
INSERT INTO produto VALUES (
   30426, 'Himalaya Tires',
   'Pneus para bicicletas de trilha',
   933, NULL,
   18.25, NULL)
/
INSERT INTO produto VALUES (
   30433, 'New Air Pump',
   'Bomba de pneu de bicicleta',
   940, NULL,
   20, NULL)
/
INSERT INTO produto VALUES (
   32779, 'Slaker Water Bottle',
   'Garrafa de agua',
   1286, NULL,
   7, NULL)
/
INSERT INTO produto VALUES (
   32861, 'Safe-T Helmet',
   'Capacete para ciclista',
   1368, 1829,
   60, NULL)
/
INSERT INTO produto VALUES (
   40421, 'Alexeyer Pro Lifting Bar',
   'Bara lisa',
   928, 1381,
   65, NULL)
/
INSERT INTO produto VALUES (
   40422, 'Pro Curling Bar',
   'Barra aspera',
   929, 1382,
   50, NULL)
/
INSERT INTO produto VALUES (
   41010, 'Prostar 10 Pound Weight',
   'Peso de dez libras',
   517, NULL,
   8, NULL)
/
INSERT INTO produto VALUES (
   41020, 'Prostar 20 Pound Weight',
   'Peso de vinte libras',
   527, NULL,
   12, NULL)
/
INSERT INTO produto VALUES (
   41050, 'Prostar 50 Pound Weight',
   'Peso de cincoenta libras',
   557, NULL,
   25, NULL)
/
INSERT INTO produto VALUES (
   41080, 'Prostar 80 Pound Weight',
   'Peso de oitenta libras',
   587, NULL,
   35, NULL)
/
INSERT INTO produto VALUES (
   41100, 'Prostar 100 Pound Weight',
   'Peso de cem libras',
   607, NULL,
   45, NULL)
/
INSERT INTO produto VALUES (
   50169, 'Major League Baseball',
   'Baseball',
   676, 1119,
   4.29, NULL)
/
INSERT INTO produto VALUES (
   50273, 'Chapman Helmet',
   'Capacete para navegacao',
   780, 1223,
   22.89, NULL)
/
INSERT INTO produto VALUES (
   50417, 'Griffey Glove',
   'Luva defensor',
   924, 1367,
   80, NULL)
/
INSERT INTO produto VALUES (
   50418, 'Alomar Glove',
   'Luva jogador',
   925, 1368,
   75, NULL)
/
INSERT INTO produto VALUES (
   50419, 'Steinbach Glove',
   'Luva apanhador',
   926, 1369,
   80, NULL)
/
INSERT INTO produto VALUES (
   50530, 'Cabrera Bat',
   'Remo de trinta polegadas',
   1037, 1480,
   45, NULL)
/
INSERT INTO produto VALUES (
   50532, 'Puckett Bat',
   'Remo de trinta e duas polegadas',
   1039, 1482,
   47, NULL)
/
INSERT INTO produto VALUES (
   50536, 'Winfield Bat',
   'Remo de trinta e seis polegadas',
   1043, 1486,
   50, NULL)
/
COMMIT
/
CREATE TABLE regiao 
(cod                         NUMBER(7) 
   CONSTRAINT cod_regiao_nn NOT NULL,
 nome                       VARCHAR2(50) 
   CONSTRAINT nome_regiao_nn NOT NULL,
     CONSTRAINT cod_regiao_pk PRIMARY KEY (cod),
     CONSTRAINT nome_regiao_uk UNIQUE (nome))
/
INSERT INTO regiao VALUES (
   1, 'America do Norte')
/
INSERT INTO regiao VALUES (
   2, 'America do Sul')
/
INSERT INTO regiao VALUES (
   3, 'Africa / Oriente Medio')
/
INSERT INTO regiao VALUES (
   4, 'Asia')
/
INSERT INTO regiao VALUES (
   5, 'Europa')
/
COMMIT
/
CREATE TABLE cargo
(cargo                      VARCHAR2(25), 
   CONSTRAINT cod_cargo_pk PRIMARY KEY (cargo))
/
INSERT INTO cargo VALUES ('Presidente')
/
INSERT INTO cargo VALUES ('Vendedor')
/
INSERT INTO cargo VALUES ('Auxiliar')
/
INSERT INTO cargo VALUES ('VP, Administracao')
/
INSERT INTO cargo VALUES ('VP, Financeiro')
/
INSERT INTO cargo VALUES ('VP, Operacoes')
/
INSERT INTO cargo VALUES ('VP, Vendas')
/
INSERT INTO cargo VALUES ('Gerente de Armazem')
/
COMMIT
/
CREATE TABLE armazem 
(cod                        NUMBER(7) 
   CONSTRAINT cod_armazem_nn NOT NULL,
 cod_regiao                 NUMBER(7) 
   CONSTRAINT cod_regiao_armazem_nn NOT NULL,
 endereo                    LONG,
 cidade                     VARCHAR2(30),
 estado                     VARCHAR2(20),
 pais                       VARCHAR2(30),
 cep                        VARCHAR2(75),
 fone                       VARCHAR2(25),
 cod_gerente                NUMBER(7),
     CONSTRAINT cod_armazem_pk PRIMARY KEY (cod))
/
INSERT INTO armazem VALUES (
   101, 1,
   '283 King Street',
   'Seattle', 'WA', 'USA',
   NULL,
   NULL, 6)
/
INSERT INTO armazem VALUES (
   10501, 5,
   '5 Modrany',
   'Bratislava', NULL, 'Czechozlovakia',
   NULL,
   NULL, 10)
/
INSERT INTO armazem VALUES (
   201, 2,
   '68 Via Centrale',
   'Sao Paulo', NULL, 'Brasil',
   NULL,
   NULL, 7)
/
INSERT INTO armazem VALUES (
   301, 3,
   '6921 King Way',
   'Lagos', NULL, 'Nigeria',
   NULL,
   NULL, 8)
/
INSERT INTO armazem VALUES (
   401, 4,
   '86 Chu Street',
   'Hong Kong', NULL, NULL,
   NULL,
   NULL, 9)
/
COMMIT
/
CREATE TABLE salario (
 faixa               NUMBER,
 minimo               NUMBER,
 maximo               NUMBER)
/
INSERT INTO salario VALUES (1,700,1200)
/
INSERT INTO salario VALUES (2,1201,1400)
/
INSERT INTO salario VALUES (3,1401,2000)
/
INSERT INTO salario VALUES (4,2001,3000)
/
INSERT INTO salario VALUES (5,3001,9999)
/
COMMIT
/
ALTER TABLE depto 
   ADD CONSTRAINT cod_regiao_depto_fk
   FOREIGN KEY (cod_regiao) REFERENCES regiao (cod)
/
ALTER TABLE empregado 
   ADD CONSTRAINT cod_gerente_empregado_fk
   FOREIGN KEY (cod_gerente) REFERENCES empregado (cod)
/
ALTER TABLE empregado 
   ADD CONSTRAINT cod_depto_empregado_fk
   FOREIGN KEY (cod_depto) REFERENCES depto (cod)
/
ALTER TABLE empregado 
   ADD CONSTRAINT cargo_empregado_fk
   FOREIGN KEY (cargo) REFERENCES cargo (cargo)
/
ALTER TABLE cliente 
   ADD CONSTRAINT cod_vendedor_cliente_fk
   FOREIGN KEY (cod_vendedor) REFERENCES empregado (cod)
/
ALTER TABLE cliente 
   ADD CONSTRAINT cod_regiao_cliente_fk
   FOREIGN KEY (cod_regiao) REFERENCES regiao (cod)
/
ALTER TABLE pedido 
   ADD CONSTRAINT cod_cliente_pedido_fk
   FOREIGN KEY (cod_cliente) REFERENCES cliente (cod)
/
ALTER TABLE pedido 
   ADD CONSTRAINT cod_vendedor_pedido_fk
   FOREIGN KEY (cod_vendedor) REFERENCES empregado (cod)
/
ALTER TABLE produto 
   ADD CONSTRAINT cod_imagem_produto_fk
   FOREIGN KEY (cod_imagem) REFERENCES imagem (cod)
/
ALTER TABLE produto 
   ADD CONSTRAINT cod_textolongo_produto_fk
   FOREIGN KEY (cod_textolongo) REFERENCES textolongo (cod)
/
ALTER TABLE item 
   ADD CONSTRAINT cod_pedido_item_fk
   FOREIGN KEY (cod_pedido) REFERENCES pedido (cod)
/
ALTER TABLE item 
   ADD CONSTRAINT cod_produto_item_fk
   FOREIGN KEY (cod_produto) REFERENCES produto (cod)
/
ALTER TABLE armazem 
   ADD CONSTRAINT cod_gerente_armazem_fk
   FOREIGN KEY (cod_gerente) REFERENCES empregado (cod)
/
ALTER TABLE armazem 
   ADD CONSTRAINT cod_regiao_armazem_fk
   FOREIGN KEY (cod_regiao) REFERENCES regiao (cod)
/
ALTER TABLE inventario 
   ADD CONSTRAINT cod_produto_inventario_fk
   FOREIGN KEY (cod_produto) REFERENCES produto (cod)
/
ALTER TABLE inventario 
   ADD CONSTRAINT cod_armazem_inventario_fk
   FOREIGN KEY (cod_armazem) REFERENCES armazem (cod)
/

set feedback on
select tname "Tabelas Criadas" from tab
/
prompt Acima, deve haver 13 tabelas listadas!
prompt Processamento Concluído!
