-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Anuncio [ent1]
create table `anuncio` (
   `idanuncio`  integer  not null,
   `nome`  varchar(255),
   `descricao`  varchar(255),
   `preco`  varchar(255),
   `datasubmissao`  date,
   `activo`  integer,
   `tipo`  varchar(255),
   `destaque`  bit,
  primary key (`idanuncio`)
);


-- Imagem [ent2]
create table `imagem` (
   `idimagem`  integer  not null,
   `source`  varchar(255),
  primary key (`idimagem`)
);


-- Categoria [ent3]
create table `categoria` (
   `idcategoria`  integer  not null,
   `descricao`  varchar(255),
   `pai`  integer,
  primary key (`idcategoria`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Anuncio_User [rel1]
alter table `anuncio`  add column  `user_oid`  integer;
alter table `anuncio`   add index fk_anuncio_user (`user_oid`), add constraint fk_anuncio_user foreign key (`user_oid`) references `user` (`oid`);


-- Anuncio_Categoria [rel2]
alter table `anuncio`  add column  `categoria_idcategoria`  integer;
alter table `anuncio`   add index fk_anuncio_categoria (`categoria_idcategoria`), add constraint fk_anuncio_categoria foreign key (`categoria_idcategoria`) references `categoria` (`idcategoria`);


-- Anuncio_Imagem [rel3]
alter table `imagem`  add column  `anuncio_idanuncio`  integer;
alter table `imagem`   add index fk_imagem_anuncio (`anuncio_idanuncio`), add constraint fk_imagem_anuncio foreign key (`anuncio_idanuncio`) references `anuncio` (`idanuncio`);


-- Anuncio_Group [rel4]
alter table `group`  add column  `anuncio_idanuncio`  integer;
alter table `group`   add index fk_group_anuncio (`anuncio_idanuncio`), add constraint fk_group_anuncio foreign key (`anuncio_idanuncio`) references `anuncio` (`idanuncio`);


-- Categoria_Categoria [rel7]
alter table `categoria`  add column  `categoria_idcategoria`  integer;
alter table `categoria`   add index fk_categoria_categoria (`categoria_idcategoria`), add constraint fk_categoria_categoria foreign key (`categoria_idcategoria`) references `categoria` (`idcategoria`);


