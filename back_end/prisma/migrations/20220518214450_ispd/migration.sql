-- CreateTable
CREATE TABLE "agencia_bancaria" (
    "id" SERIAL NOT NULL,
    "id_banco" INTEGER NOT NULL,
    "endereco" TEXT,
    "fone" BIGINT,
    "tipo" INTEGER,
    "fone1" BIGINT,
    "tipo1" INTEGER,
    "agencia" TEXT NOT NULL,
    "nome_agencia" TEXT,

    CONSTRAINT "agencia_bancaria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auditlog" (
    "id" SERIAL NOT NULL,
    "model" VARCHAR(255) NOT NULL,
    "action" VARCHAR(255) NOT NULL,
    "old" TEXT,
    "new" TEXT,
    "at" TIMESTAMP(0),
    "by" INTEGER,

    CONSTRAINT "auditlog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "banco" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "ispd" INTEGER,
    "numero" TEXT,

    CONSTRAINT "banco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bandeiras" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "logomarca" TEXT NOT NULL,

    CONSTRAINT "bandeiras_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "boleto" (
    "id" SERIAL NOT NULL,
    "emissao" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "numero" TEXT NOT NULL,
    "valor" DECIMAL(19,4),
    "pagamento_id" INTEGER,
    "pago" BOOLEAN,
    "tipo_pagamento_id" INTEGER,

    CONSTRAINT "boleto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "caixa" (
    "id" SERIAL NOT NULL,
    "nome" TEXT,
    "funcionario_ativo" INTEGER,

    CONSTRAINT "caixa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cartao" (
    "id" SERIAL NOT NULL,
    "id_bandeira" INTEGER NOT NULL,
    "id_operadora" INTEGER NOT NULL,
    "id_contaCorrente" INTEGER NOT NULL,
    "cartao" INTEGER NOT NULL,
    "tipo" INTEGER NOT NULL,
    "dia" INTEGER,
    "titular" TEXT,
    "taxa" DECIMAL(19,4),
    "status" BOOLEAN DEFAULT true,

    CONSTRAINT "cartao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cartao_adicional" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "id_cartao" INTEGER NOT NULL,
    "status" BOOLEAN DEFAULT true,

    CONSTRAINT "cartao_adicional_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cartao_parcelas" (
    "id" SERIAL NOT NULL,
    "n_parcela" INTEGER NOT NULL,
    "taxa" DOUBLE PRECISION NOT NULL,
    "id_cartao" INTEGER NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "dataInicial" DATE NOT NULL DEFAULT '06/04/2022'::date,

    CONSTRAINT "cartao_parcelas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cd_complementares" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,

    CONSTRAINT "cd_complementares_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cheque" (
    "id" SERIAL NOT NULL,
    "tipo_pessoa" INTEGER NOT NULL,
    "cpf_cnpj" BIGINT NOT NULL,
    "titular" TEXT,
    "banco_id" INTEGER,
    "agencia" TEXT,
    "conta_corrente" TEXT,
    "n_cheque" TEXT,
    "tipo_pagamento_id" INTEGER,
    "status" INTEGER,
    "situacao" INTEGER DEFAULT 49,
    "data_deposito" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "data_compensacao" DATE,

    CONSTRAINT "cheque_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "compra" (
    "id" SERIAL NOT NULL,
    "id_fisico" INTEGER,
    "id_juridico" INTEGER,
    "tipo_documento" INTEGER NOT NULL,
    "data" DATE NOT NULL,
    "numero" INTEGER NOT NULL,
    "valorTotalDoc" DECIMAL(19,4) NOT NULL,
    "frete" DECIMAL(19,4),
    "outrasDespesas" DECIMAL(19,4),
    "observacoes" TEXT,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "contas_pagar_id" INTEGER,
    "frete_status" BOOLEAN DEFAULT false,
    "frete_contas_pagar_id" INTEGER,
    "id_juridico_frete" INTEGER,
    "id_fisico_frete" INTEGER,

    CONSTRAINT "compra_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "configuracao_boleto" (
    "id" SERIAL NOT NULL,
    "boleto_cloud_token" TEXT,
    "vencimento" TEXT,
    "especie_doc" TEXT,
    "juros" DOUBLE PRECISION,
    "multa" DOUBLE PRECISION,
    "boleto_instrucao" TEXT,
    "conta_corrente_id" INTEGER,

    CONSTRAINT "configuracao_boleto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "configuracao_empresa" (
    "id" SERIAL NOT NULL,
    "nome_loja" TEXT NOT NULL,
    "cnpj_loja" BIGINT NOT NULL,
    "logo" TEXT,
    "admin_email" TEXT,
    "endereco_cep" TEXT,
    "endereco_logradouro" TEXT,
    "endereco_numero" TEXT,
    "endereco_bairro" TEXT,
    "endereco_cidade" TEXT,
    "endereco_uf" TEXT,
    "endereco_complemento" TEXT,
    "boleto_cloud_token_api" TEXT,

    CONSTRAINT "configuracao_empresa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "conta_corrente" (
    "id" SERIAL NOT NULL,
    "id_agencia_bancaria" INTEGER NOT NULL,
    "tipo" INTEGER NOT NULL,
    "aplicacao" INTEGER NOT NULL,
    "n_conta" TEXT NOT NULL,
    "contabil" INTEGER DEFAULT 1,
    "saldo" DECIMAL(19,4) DEFAULT 0,

    CONSTRAINT "conta_corrente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contas_pagar" (
    "id" SERIAL NOT NULL,
    "id_fisico" INTEGER,
    "id_juridico" INTEGER,
    "tipo_documento" INTEGER NOT NULL,
    "data" DATE NOT NULL,
    "numero" INTEGER NOT NULL,
    "historico" TEXT,
    "valor" DECIMAL(19,4) NOT NULL,
    "n_parcela" INTEGER NOT NULL DEFAULT 0,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "vencimento" DATE DEFAULT '06/04/2022'::date,

    CONSTRAINT "contas_pagar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contas_receber" (
    "id" SERIAL NOT NULL,
    "id_fisico" INTEGER,
    "id_juridico" INTEGER,
    "tipo_documento" INTEGER NOT NULL,
    "data" DATE NOT NULL,
    "numero" INTEGER,
    "historico" INTEGER,
    "valor" DECIMAL(19,4) NOT NULL,
    "n_parcela" INTEGER NOT NULL,
    "status" BOOLEAN DEFAULT false,
    "vencimento" DATE NOT NULL,

    CONSTRAINT "contas_receber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contato_banco" (
    "id" SERIAL NOT NULL,
    "nome" TEXT,
    "funcao" TEXT,
    "fone" BIGINT,
    "tipo" INTEGER,
    "email" TEXT,
    "id_conta_corrente" INTEGER,
    "id_agencia_bancaria" INTEGER,

    CONSTRAINT "contato_banco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "departamento" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "departamento_id" INTEGER,

    CONSTRAINT "departamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deposito" (
    "id" SERIAL NOT NULL,
    "id_contaCorrente" INTEGER NOT NULL,
    "valorDinheiro" DECIMAL(19,4),
    "valorCheque" DECIMAL(19,4),
    "data" DATE DEFAULT '06/04/2022'::date,
    "fechamento_caixa_id" INTEGER,
    "relacao_caixa_id" INTEGER,
    "tesouraria_id" INTEGER,
    "fechamento_tesouraria_id" INTEGER,

    CONSTRAINT "deposito_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deposito_cheque" (
    "id" SERIAL NOT NULL,
    "cheque_id" INTEGER NOT NULL,
    "deposito_id" INTEGER NOT NULL,

    CONSTRAINT "deposito_cheque_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "descricao_evento_bancario" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "tipo_movimentacao" INTEGER NOT NULL,
    "altera_saldo" BOOLEAN NOT NULL,

    CONSTRAINT "descricao_evento_bancario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "entrada_produto" (
    "id" SERIAL NOT NULL,
    "data_entrada" DATE DEFAULT '06/04/2022'::date,
    "qnt" INTEGER NOT NULL,
    "valor_custo" DECIMAL(10,0),
    "ipi" DECIMAL(10,0),
    "valor_total" DECIMAL(10,0) NOT NULL DEFAULT 0,
    "produto_id" INTEGER NOT NULL,

    CONSTRAINT "entrada_produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "evento_bancario" (
    "id" SERIAL NOT NULL,
    "classificao_contabil" TEXT,
    "historico" TEXT NOT NULL,
    "conta_corrente_id" INTEGER NOT NULL,
    "valor" DECIMAL(19,4) NOT NULL,
    "descricao_evento_bancario_id" INTEGER,
    "data" DATE,
    "data_compensacao" DATE,

    CONSTRAINT "evento_bancario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fechamento_caixa" (
    "id" SERIAL NOT NULL,
    "data" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "saldo_inicial" DECIMAL(19,4) NOT NULL DEFAULT 0,
    "saldo_final" DECIMAL(19,4) NOT NULL,
    "funcionario_id" INTEGER,
    "relacao_id" INTEGER,

    CONSTRAINT "fechamento_caixa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fechamento_tesouraria" (
    "id" SERIAL NOT NULL,
    "data" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "saldo_inicial" DECIMAL(19,4) NOT NULL DEFAULT 0,
    "saldo_final" DECIMAL(19,4) NOT NULL,
    "funcionario_id" INTEGER,
    "tesouraria_id" INTEGER,

    CONSTRAINT "fechamento_tesouraria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "financeira" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "sigla" TEXT NOT NULL,
    "id_contaCorrente" INTEGER NOT NULL,
    "dia" INTEGER,
    "parcelas" INTEGER,
    "taxa" DECIMAL(19,4),

    CONSTRAINT "financeira_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "financeira_condicao" (
    "id" SERIAL NOT NULL,
    "parcela" INTEGER,
    "id_financeira" INTEGER,
    "status" BOOLEAN DEFAULT true,
    "dia" INTEGER,
    "taxa" DECIMAL(19,4),

    CONSTRAINT "financeira_condicao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "folha_cheque_pagamento" (
    "id" SERIAL NOT NULL,
    "numero" INTEGER,
    "valor" DECIMAL(19,4) NOT NULL,
    "data_deposito" DATE NOT NULL,
    "cheque_id" INTEGER,

    CONSTRAINT "folha_cheque_pagamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "folhas_cheque" (
    "id" SERIAL NOT NULL,
    "numero" BIGINT,
    "id_contaCorrente" INTEGER,
    "usado" BOOLEAN DEFAULT false,
    "valor" DECIMAL(19,4) DEFAULT 0,
    "tipo_pagamento_id" INTEGER,
    "data_vencimento" DATE,
    "compensado" BOOLEAN DEFAULT false,

    CONSTRAINT "folhas_cheque_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formas_de_pagamento" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "id_classificacao" INTEGER NOT NULL,
    "tipo" INTEGER,

    CONSTRAINT "formas_de_pagamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fornecedor" (
    "id" SERIAL NOT NULL,
    "site" TEXT,
    "observacoes" TEXT,
    "id_pessoa_fisica" INTEGER,
    "id_pessoa_juridica" INTEGER,

    CONSTRAINT "fornecedor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "funcionario" (
    "id" SERIAL NOT NULL,
    "num_ficha" TEXT,
    "funcao" INTEGER,
    "fbanco" INTEGER,
    "fagencia" TEXT,
    "conta_corrente" TEXT,
    "tipo_conta" INTEGER,
    "pessoa_fisica_id" INTEGER,
    "situacao_trabalhista" INTEGER,
    "motivo" INTEGER,
    "departamento_id" INTEGER,

    CONSTRAINT "funcionario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "grade" (
    "id" SERIAL NOT NULL,
    "produto_id" INTEGER NOT NULL,
    "produto_cor_id" INTEGER NOT NULL,
    "produto_tamanho_id" INTEGER NOT NULL,
    "estoque_atual" DECIMAL(19,4),
    "estoque_minimo" DECIMAL(19,4),
    "estoque_de_seguranca" DECIMAL(19,4),

    CONSTRAINT "grade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "item_pedido" (
    "id" SERIAL NOT NULL,
    "valor_item" DECIMAL(19,4) NOT NULL DEFAULT 0,
    "quant_produto" INTEGER NOT NULL DEFAULT 1,
    "venda_id" INTEGER NOT NULL,
    "produto_id" INTEGER NOT NULL,
    "grade_id" INTEGER,
    "gerente_id" INTEGER,

    CONSTRAINT "item_pedido_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "item_pedido_certificado" (
    "id" SERIAL NOT NULL,
    "venda_id" INTEGER NOT NULL,
    "tipo_certificado" INTEGER NOT NULL,
    "filiado" INTEGER NOT NULL,
    "tipo" INTEGER NOT NULL,
    "cnpj" TEXT NOT NULL,
    "valor" DECIMAL(19,4),
    "razao_social_nome" TEXT,
    "fantasia" TEXT,
    "forma_pagamento" INTEGER NOT NULL DEFAULT 1,
    "justificativa" TEXT,

    CONSTRAINT "item_pedido_certificado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "items_compra" (
    "id" SERIAL NOT NULL,
    "id_compra" INTEGER NOT NULL,
    "id_produto" INTEGER NOT NULL,
    "qtde" INTEGER NOT NULL,
    "valorUnitario" DECIMAL(19,4),
    "ipi" DECIMAL(19,4),
    "status" INTEGER,
    "grade_id" INTEGER,

    CONSTRAINT "items_compra_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "migration" (
    "version" VARCHAR(180) NOT NULL,
    "apply_time" INTEGER,

    CONSTRAINT "migration_pkey" PRIMARY KEY ("version")
);

-- CreateTable
CREATE TABLE "movimentacao" (
    "id" SERIAL NOT NULL,
    "valor_movimentacao" DECIMAL(19,4),
    "tipo_movimentacao_id" INTEGER NOT NULL,
    "tipo_pagamento_id" INTEGER,
    "data_movimentacao" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "hr_movimentacao" TIME(0) NOT NULL DEFAULT '08:53:41.195326'::time without time zone,
    "bloqueado" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "movimentacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "movimentacao_caixa" (
    "id" SERIAL NOT NULL,
    "data" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "tipo" INTEGER NOT NULL,
    "operacao" INTEGER,
    "valor" DECIMAL(19,4) NOT NULL,
    "cheque_id" INTEGER,

    CONSTRAINT "movimentacao_caixa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "movimentacao_tesouraria" (
    "id" SERIAL NOT NULL,
    "valor" DECIMAL(19,4) NOT NULL,
    "tipo" INTEGER NOT NULL,
    "data" DATE NOT NULL,
    "fechamento_caixa_id" INTEGER,
    "confirmacao_recebimento" BOOLEAN DEFAULT true,
    "relacao_id" INTEGER,
    "fechamento_tesouraria_id" INTEGER,

    CONSTRAINT "movimentacao_tesouraria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "movimentacao_tesouraria_cheque" (
    "id" SERIAL NOT NULL,
    "movimentacao_tesouraria_id" INTEGER NOT NULL,
    "cheque_id" INTEGER NOT NULL,

    CONSTRAINT "movimentacao_tesouraria_cheque_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "operadora" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "id_banco" INTEGER NOT NULL,

    CONSTRAINT "operadora_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pagamento" (
    "id" SERIAL NOT NULL,
    "valor_pagamento" DECIMAL(19,4),
    "venda_id" INTEGER,
    "pessoa_fisica_id" INTEGER,
    "pessoa_juridica_id" INTEGER,
    "data_pagamento" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "tipo" INTEGER,
    "compra_id" INTEGER,
    "fechamento_caixa_id" INTEGER,
    "em_carteira" BOOLEAN DEFAULT false,
    "gravado" BOOLEAN DEFAULT false,
    "relacao_id" INTEGER,
    "fechamento_tesouraria_id" INTEGER,
    "tesouraria" BOOLEAN DEFAULT false,
    "contas_receber_id" INTEGER,

    CONSTRAINT "pagamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pagamento_cheque_terceiros" (
    "cheque_id" INTEGER NOT NULL,
    "tipo_pagamento_contas_pagar_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "parcelas_contas_pagar" (
    "id" SERIAL NOT NULL,
    "data_vencimento" TIMESTAMP(0),
    "valor" DECIMAL(19,4),
    "contas_pagar_id" INTEGER,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "pagamento_id" INTEGER,

    CONSTRAINT "parcelas_contas_pagar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parcelas_contas_receber" (
    "id" SERIAL NOT NULL,
    "data_vencimento" TIMESTAMP(0),
    "valor" DECIMAL(19,4),
    "contas_receber_id" INTEGER,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "pagamento_id" INTEGER,

    CONSTRAINT "parcelas_contas_receber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parcelas_pagamento" (
    "id" SERIAL NOT NULL,
    "data_vencimento" TIMESTAMP(0),
    "valor" DECIMAL(19,4),
    "tipo_pagamento_id" INTEGER NOT NULL,
    "paga" BOOLEAN DEFAULT false,
    "conta_corrente_id" INTEGER,
    "data_credito" DATE,
    "valor_creditado" DECIMAL(19,4),

    CONSTRAINT "parcelas_pagamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa_fisica" (
    "id" SERIAL NOT NULL,
    "cpf" BIGINT NOT NULL,
    "nome" TEXT NOT NULL,
    "nascimento" DATE,
    "sexo" INTEGER,
    "escolaridade" INTEGER,
    "estado_civil" INTEGER,
    "conjuge" TEXT,
    "mae" TEXT,
    "pai" TEXT,
    "n_identidade" TEXT,
    "orgao_expeditor" TEXT,
    "ctps" TEXT,
    "data_expedicao" DATE,
    "pis_pasep" TEXT,
    "nis" TEXT,
    "titulo_eleitor" TEXT,
    "zona" TEXT,
    "secao" TEXT,
    "habilitacao" TEXT,
    "categoria" INTEGER,
    "cep" TEXT,
    "uf" TEXT,
    "cidade" TEXT,
    "bairro" TEXT,
    "rua" TEXT,
    "numero" INTEGER,
    "quadra" TEXT,
    "lote" TEXT,
    "complemento" TEXT,
    "fone" BIGINT,
    "tipo" INTEGER,
    "fone2" BIGINT,
    "tipo2" INTEGER,
    "fone3" BIGINT,
    "tipo3" INTEGER,
    "email" TEXT,
    "situacao" INTEGER,
    "reside" DATE,
    "cnpj" BIGINT,
    "razao_social" TEXT,
    "fantasia" TEXT,
    "df_cep" TEXT,
    "df_uf" TEXT,
    "df_cidade" TEXT,
    "df_bairro" TEXT,
    "df_rua" TEXT,
    "df_numero" TEXT,
    "df_quadra" TEXT,
    "df_lote" TEXT,
    "df_complemento" TEXT,
    "df_fone" BIGINT,
    "df_tipo" INTEGER,
    "df_fone2" BIGINT,
    "df_tipo2" INTEGER,
    "cargo_funcao" TEXT,
    "salario" DECIMAL(19,4),
    "admissao" DATE,
    "ref_empresa" TEXT,
    "ref_foneEmpresa" BIGINT,
    "ref_empresa2" TEXT,
    "ref_foneEmpresa2" BIGINT,
    "ref_empresa3" TEXT,
    "ref_foneEmpresa3" BIGINT,
    "ref_pessoa" TEXT,
    "ref_fonePessoa" BIGINT,
    "ref_pessoa2" TEXT,
    "ref_fonePessoa2" BIGINT,
    "ref_pessoa3" TEXT,
    "ref_fonePessoa3" BIGINT,
    "banco" INTEGER,
    "agencia" TEXT,
    "banco1" INTEGER,
    "agencia1" TEXT,
    "banco2" INTEGER,
    "agencia2" TEXT,
    "bandeira" INTEGER,
    "vencimento" DATE,
    "bandeira1" INTEGER,
    "vencimento1" DATE,
    "bandeira2" INTEGER,
    "vencimento2" DATE,
    "limite_de_credito" DECIMAL(19,4),
    "n_max_parcelas" INTEGER,
    "reservista" TEXT,
    "categoria_reservista" INTEGER,
    "serie" TEXT,
    "emissao" DATE,
    "limite_credito_atual" DECIMAL(19,4) DEFAULT 0,
    "cliente" BOOLEAN,

    CONSTRAINT "pessoa_fisica_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa_fisica_dependentes" (
    "id" SERIAL NOT NULL,
    "nome" TEXT,
    "nascimento" DATE,
    "parentesco" INTEGER,
    "id_pessoa_fisica" INTEGER,
    "cpf" BIGINT,
    "sexo" INTEGER,

    CONSTRAINT "pessoa_fisica_dependentes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa_fisica_documento" (
    "id" SERIAL NOT NULL,
    "arquivo" TEXT NOT NULL,
    "id_pessoa_fisica" INTEGER NOT NULL,
    "identificacao" TEXT NOT NULL,

    CONSTRAINT "pessoa_fisica_documento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa_juridica" (
    "id" SERIAL NOT NULL,
    "cnpj" BIGINT NOT NULL,
    "fantasia" TEXT NOT NULL,
    "razao_social" TEXT,
    "cep" TEXT,
    "uf" TEXT,
    "cidade" TEXT,
    "bairro" TEXT,
    "rua" TEXT,
    "numero" TEXT,
    "quadra" TEXT,
    "lote" TEXT,
    "complemento" TEXT,
    "fone" BIGINT,
    "tipo" INTEGER,
    "fone1" BIGINT,
    "tipo1" INTEGER,
    "email" TEXT,
    "site" TEXT,
    "cliente" BOOLEAN,

    CONSTRAINT "pessoa_juridica_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa_juridica_contato" (
    "id" SERIAL NOT NULL,
    "fone" BIGINT,
    "tipo" INTEGER,
    "fone1" BIGINT,
    "tipo1" INTEGER,
    "email" TEXT,
    "observacoes" TEXT,
    "id_pessoajuridica" INTEGER,
    "nome" TEXT NOT NULL,

    CONSTRAINT "pessoa_juridica_contato_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "plano_de_contas" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "classificacaoContabil" INTEGER NOT NULL,

    CONSTRAINT "plano_de_contas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "preco_produto" (
    "id" SERIAL NOT NULL,
    "id_produto" INTEGER NOT NULL,
    "dataInicial" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "dataFinal" DATE,
    "preco_custo" DECIMAL(19,4) NOT NULL,
    "preco_venda" DECIMAL(19,4) NOT NULL,
    "ipi" DECIMAL(19,4),
    "qtde" DECIMAL(19,4),
    "documento" TEXT,
    "historico" TEXT,
    "tipo" INTEGER,
    "grade_id" INTEGER,

    CONSTRAINT "preco_produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "preco_venda" (
    "id" SERIAL NOT NULL,
    "status" BOOLEAN DEFAULT true,
    "margem_lucro" DOUBLE PRECISION DEFAULT 0,
    "acrescimo_venda_cartao_debito" DOUBLE PRECISION DEFAULT 0,
    "acrescimo_venda_cartao_credito" DOUBLE PRECISION DEFAULT 0,
    "acrescimo_venda_crediario" DOUBLE PRECISION DEFAULT 0,
    "comissao_vendedor" DOUBLE PRECISION DEFAULT 0,
    "comissao_gerente" DOUBLE PRECISION DEFAULT 0,

    CONSTRAINT "preco_venda_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto" (
    "id" SERIAL NOT NULL,
    "ref_loja" TEXT NOT NULL,
    "ref_fabrica" TEXT NOT NULL,
    "cod_barras" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "usa_fraciona" BOOLEAN NOT NULL,
    "usa_grade" BOOLEAN NOT NULL,
    "cor" TEXT,
    "caracteristicas" TEXT,
    "estoque_atual" DECIMAL(19,4),
    "estoque_minimo" DECIMAL(19,4),
    "estoque_de_seguranca" DECIMAL(19,4),
    "preco_custo" DECIMAL(19,4),
    "margem_lucro" DECIMAL(19,4),
    "comissao_venda" DECIMAL(19,4),
    "preco_venda" DECIMAL(19,4),
    "marca_id" INTEGER,
    "unidade_id" INTEGER NOT NULL,
    "grupo_id" INTEGER,
    "classe_id" INTEGER,
    "subgrupo_id" INTEGER,
    "subclasse_id" INTEGER,

    CONSTRAINT "produto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto_classe" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "produto_classe_id" INTEGER,

    CONSTRAINT "produto_classe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto_cor" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,

    CONSTRAINT "produto_cor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto_grupo" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "grupo_id_pai" INTEGER,

    CONSTRAINT "produto_grupo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto_imagens" (
    "id" SERIAL NOT NULL,
    "tipo" INTEGER NOT NULL,
    "arquivo" TEXT NOT NULL,
    "produto_id" INTEGER NOT NULL,

    CONSTRAINT "produto_imagens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto_marca" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,

    CONSTRAINT "produto_marca_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto_tamanho" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "tipo" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "produto_tamanho_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produto_unidade" (
    "id" SERIAL NOT NULL,
    "abreviacao" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,

    CONSTRAINT "produto_unidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "programar_pagamento" (
    "id" SERIAL NOT NULL,
    "id_compra" INTEGER NOT NULL,
    "tipo" INTEGER NOT NULL,
    "n_parcelas" INTEGER NOT NULL,
    "vencimento" DATE NOT NULL,
    "valor" DECIMAL(19,4),

    CONSTRAINT "programar_pagamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "relacao_caixa" (
    "id" SERIAL NOT NULL,
    "funcionario_id" INTEGER NOT NULL,
    "caixa_id" INTEGER NOT NULL,

    CONSTRAINT "relacao_caixa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "remessas" (
    "id" SERIAL NOT NULL,
    "emissao" TIMESTAMP(0),
    "arquivo" TEXT,
    "conta_corrente_id" INTEGER,

    CONSTRAINT "remessas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "retorno" (
    "id" SERIAL NOT NULL,
    "envio" TIMESTAMP(0),
    "arquivo" TEXT,

    CONSTRAINT "retorno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "senha_gerente" (
    "id" SERIAL NOT NULL,
    "funcionario_id" INTEGER,
    "senha" TEXT,

    CONSTRAINT "senha_gerente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "servico" (
    "id" SERIAL NOT NULL,
    "tipo_fornecedor" INTEGER NOT NULL,
    "codigo_tabela" INTEGER,
    "codigo_spc_brasil" INTEGER,
    "servico" TEXT NOT NULL,
    "plano_de_contas_id" INTEGER NOT NULL,
    "setor" INTEGER NOT NULL,
    "preco_custo" DECIMAL(19,4) NOT NULL,
    "preco_venda" DECIMAL(19,4) NOT NULL,
    "pacote" BOOLEAN,
    "cnpj" BIGINT,
    "fantasia" TEXT,
    "preco_venda_associado" DECIMAL(19,4) NOT NULL,
    "preco_venda_associado_parcelado" DECIMAL(19,4) NOT NULL,
    "preco_venda_associado_prazo" DECIMAL(19,4) NOT NULL,
    "preco_venda_parcelado" DECIMAL(19,4) NOT NULL,
    "preco_venda_prazo" DECIMAL(19,4) NOT NULL,

    CONSTRAINT "servico_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tesouraria" (
    "id" SERIAL NOT NULL,
    "saldo" DECIMAL(19,4) NOT NULL,
    "nome" TEXT,

    CONSTRAINT "tesouraria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipo_pagamento" (
    "id" SERIAL NOT NULL,
    "pagamento_id" INTEGER,
    "forma_pagamento_id" INTEGER,
    "bandeira_id" INTEGER,
    "n_parcelas" INTEGER NOT NULL DEFAULT 1,
    "financeira_id" INTEGER,
    "operadora_id" INTEGER,
    "conta_corrente_id" INTEGER,
    "data_deposito_cheque" DATE,
    "qnt_cheques" INTEGER DEFAULT 1,
    "valor" DECIMAL(19,4),

    CONSTRAINT "tipo_pagamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transferencia" (
    "id" SERIAL NOT NULL,
    "contaOrigem" INTEGER NOT NULL,
    "contaDestino" INTEGER NOT NULL,
    "valorOrigem" DECIMAL(19,4) NOT NULL DEFAULT 0,
    "data" DATE DEFAULT '06/04/2022'::date,

    CONSTRAINT "transferencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "venda" (
    "id" SERIAL NOT NULL,
    "data" DATE NOT NULL DEFAULT '06/04/2022'::date,
    "valor_total" DECIMAL(19,4),
    "pessoa_fisica_id" INTEGER,
    "pessoa_juridica_id" INTEGER,
    "paga" BOOLEAN DEFAULT false,
    "pagamento_id" INTEGER,
    "funcionario_id" INTEGER,
    "contas_pagar_id" INTEGER,
    "nome" TEXT,
    "numero" INTEGER,
    "fechada" BOOLEAN DEFAULT false,
    "user_id" INTEGER,
    "orcamento" BOOLEAN DEFAULT false,
    "confirmacao_desconto" BOOLEAN DEFAULT true,
    "tipo_venda" INTEGER,

    CONSTRAINT "venda_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "index_cd_complementares_tipo" ON "cd_complementares"("tipo");

-- CreateIndex
CREATE UNIQUE INDEX "configuracao_boleto_conta_corrente_id_key" ON "configuracao_boleto"("conta_corrente_id");

-- CreateIndex
CREATE UNIQUE INDEX "pessoa_fisica_cpf_key" ON "pessoa_fisica"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "pessoa_juridica_cnpj_key" ON "pessoa_juridica"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "produto_unidade_abreviacao_key" ON "produto_unidade"("abreviacao");

-- CreateIndex
CREATE INDEX "index_tipo_pagamento_pagamento_id" ON "tipo_pagamento"("pagamento_id");

-- AddForeignKey
ALTER TABLE "agencia_bancaria" ADD CONSTRAINT "fk_banco" FOREIGN KEY ("id_banco") REFERENCES "banco"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "agencia_bancaria" ADD CONSTRAINT "fk_tipo" FOREIGN KEY ("tipo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "agencia_bancaria" ADD CONSTRAINT "fk_tipo1" FOREIGN KEY ("tipo1") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "boleto" ADD CONSTRAINT "fk_pagamento" FOREIGN KEY ("pagamento_id") REFERENCES "pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "boleto" ADD CONSTRAINT "boleto_tipo_pagamento_fk" FOREIGN KEY ("tipo_pagamento_id") REFERENCES "tipo_pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cartao" ADD CONSTRAINT "fk_bandeira" FOREIGN KEY ("id_bandeira") REFERENCES "bandeiras"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cartao" ADD CONSTRAINT "fk_contaCorrente" FOREIGN KEY ("id_contaCorrente") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cartao" ADD CONSTRAINT "fk_operadora" FOREIGN KEY ("id_operadora") REFERENCES "operadora"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cartao_adicional" ADD CONSTRAINT "fk_cartaoCredito" FOREIGN KEY ("id_cartao") REFERENCES "cartao"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cartao_parcelas" ADD CONSTRAINT "fk_cartao" FOREIGN KEY ("id_cartao") REFERENCES "cartao"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cheque" ADD CONSTRAINT "cheque_banco_id_fk" FOREIGN KEY ("banco_id") REFERENCES "banco"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cheque" ADD CONSTRAINT "situacao_dados_cd_cheque_fk" FOREIGN KEY ("situacao") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cheque" ADD CONSTRAINT "status_dados_cd_cheque_fk" FOREIGN KEY ("status") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "cheque" ADD CONSTRAINT "cheque_pagamento_id_fk" FOREIGN KEY ("tipo_pagamento_id") REFERENCES "tipo_pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "compra_complementar_fk" FOREIGN KEY ("tipo_documento") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "compra_contas_pagar_fk" FOREIGN KEY ("contas_pagar_id") REFERENCES "contas_pagar"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "compra_frete_contas_pagar_fk" FOREIGN KEY ("frete_contas_pagar_id") REFERENCES "contas_pagar"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "compra_pessoa_fisica_fk" FOREIGN KEY ("id_fisico") REFERENCES "fornecedor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "fk_compra_fornecedor_fisico_frete" FOREIGN KEY ("id_fisico_frete") REFERENCES "fornecedor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "compra_pessoa_juridica_fk" FOREIGN KEY ("id_juridico") REFERENCES "fornecedor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "fk_compra_fornecedor_juridico_frete" FOREIGN KEY ("id_juridico_frete") REFERENCES "fornecedor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "configuracao_boleto" ADD CONSTRAINT "configuracao_boleto_conta_corrente_fk" FOREIGN KEY ("conta_corrente_id") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "conta_corrente" ADD CONSTRAINT "fk_agenciaBancaria" FOREIGN KEY ("id_agencia_bancaria") REFERENCES "agencia_bancaria"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "conta_corrente" ADD CONSTRAINT "fk_aplicacao" FOREIGN KEY ("aplicacao") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "conta_corrente" ADD CONSTRAINT "fk_tipo" FOREIGN KEY ("tipo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "conta_corrente" ADD CONSTRAINT "fk_contabil" FOREIGN KEY ("contabil") REFERENCES "plano_de_contas"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contas_pagar" ADD CONSTRAINT "contas_pagar_complementar_fk" FOREIGN KEY ("tipo_documento") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contas_pagar" ADD CONSTRAINT "contas_pagar_pessoa_fisica_fk" FOREIGN KEY ("id_fisico") REFERENCES "fornecedor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contas_pagar" ADD CONSTRAINT "contas_pagar_pessoa_juridica_fk" FOREIGN KEY ("id_juridico") REFERENCES "fornecedor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contas_receber" ADD CONSTRAINT "fk_venda_pessoa_juridica_id" FOREIGN KEY ("tipo_documento") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contas_receber" ADD CONSTRAINT "fk_contas_receber_cliente_fisico" FOREIGN KEY ("id_fisico") REFERENCES "pessoa_fisica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contas_receber" ADD CONSTRAINT "fk_contas_receber_cliente_juridico" FOREIGN KEY ("id_juridico") REFERENCES "pessoa_juridica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contato_banco" ADD CONSTRAINT "fk_agenciaBancaria" FOREIGN KEY ("id_agencia_bancaria") REFERENCES "agencia_bancaria"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contato_banco" ADD CONSTRAINT "fk_contaCorrente" FOREIGN KEY ("id_conta_corrente") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "departamento" ADD CONSTRAINT "fk_departamento" FOREIGN KEY ("departamento_id") REFERENCES "departamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deposito" ADD CONSTRAINT "fk_contaCorrente" FOREIGN KEY ("id_contaCorrente") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deposito" ADD CONSTRAINT "deposito_fechamento_caixa_fk" FOREIGN KEY ("fechamento_caixa_id") REFERENCES "fechamento_caixa"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deposito" ADD CONSTRAINT "deposito_fechamento_tesouraria_fk" FOREIGN KEY ("fechamento_tesouraria_id") REFERENCES "fechamento_tesouraria"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deposito" ADD CONSTRAINT "fk_relacao_caixa" FOREIGN KEY ("relacao_caixa_id") REFERENCES "relacao_caixa"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deposito" ADD CONSTRAINT "fk_tesouraria" FOREIGN KEY ("tesouraria_id") REFERENCES "tesouraria"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deposito_cheque" ADD CONSTRAINT "deposito_cheque_cheque_id_fk" FOREIGN KEY ("cheque_id") REFERENCES "cheque"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deposito_cheque" ADD CONSTRAINT "deposito_cheque_deposito_id_fk" FOREIGN KEY ("deposito_id") REFERENCES "deposito"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "descricao_evento_bancario" ADD CONSTRAINT "fk_descricao_evento_bancario_cd_complementares" FOREIGN KEY ("tipo_movimentacao") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "entrada_produto" ADD CONSTRAINT "entrada_produto_id_produto_fk" FOREIGN KEY ("produto_id") REFERENCES "produto"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "evento_bancario" ADD CONSTRAINT "fk_evento_bancario_conta_corrente" FOREIGN KEY ("conta_corrente_id") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "evento_bancario" ADD CONSTRAINT "descricao_evento_bancario_fk" FOREIGN KEY ("descricao_evento_bancario_id") REFERENCES "descricao_evento_bancario"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "fechamento_caixa" ADD CONSTRAINT "fk_funcionario" FOREIGN KEY ("funcionario_id") REFERENCES "funcionario"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "fechamento_tesouraria" ADD CONSTRAINT "fk_funcionario_id" FOREIGN KEY ("funcionario_id") REFERENCES "funcionario"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "fechamento_tesouraria" ADD CONSTRAINT "fk_tesouraria_id" FOREIGN KEY ("tesouraria_id") REFERENCES "tesouraria"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "financeira" ADD CONSTRAINT "fk_contaCorrente" FOREIGN KEY ("id_contaCorrente") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "financeira_condicao" ADD CONSTRAINT "fk_financeira" FOREIGN KEY ("id_financeira") REFERENCES "financeira"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "folha_cheque_pagamento" ADD CONSTRAINT "fk_folha_cheque_pagamento_cheque" FOREIGN KEY ("cheque_id") REFERENCES "cheque"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "folhas_cheque" ADD CONSTRAINT "fk_folhasCheque" FOREIGN KEY ("id_contaCorrente") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "folhas_cheque" ADD CONSTRAINT "folhas_cheque_tipo_pagamento_fk" FOREIGN KEY ("tipo_pagamento_id") REFERENCES "tipo_pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "formas_de_pagamento" ADD CONSTRAINT "fk_planoDeContas" FOREIGN KEY ("id_classificacao") REFERENCES "plano_de_contas"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "fornecedor" ADD CONSTRAINT "fk_pessoaFisica" FOREIGN KEY ("id_pessoa_fisica") REFERENCES "pessoa_fisica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "fornecedor" ADD CONSTRAINT "fk_pessoaJuridica" FOREIGN KEY ("id_pessoa_juridica") REFERENCES "pessoa_juridica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "fk_funcionario_Banco" FOREIGN KEY ("fbanco") REFERENCES "banco"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "fk_funcionario_funcao_cd_complementares" FOREIGN KEY ("funcao") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "fk_funcionario_motivo_cd_complementares" FOREIGN KEY ("motivo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "fk_funcionario_situacao_trabalhista_cd_complementares" FOREIGN KEY ("situacao_trabalhista") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "fk_funcionario_tipo_conta_cd_complementares" FOREIGN KEY ("tipo_conta") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "fk_departamento" FOREIGN KEY ("departamento_id") REFERENCES "departamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "funcionario" ADD CONSTRAINT "fk_funcionario_pessoaFisica" FOREIGN KEY ("pessoa_fisica_id") REFERENCES "pessoa_fisica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grade" ADD CONSTRAINT "fk_grade_produto_id" FOREIGN KEY ("produto_id") REFERENCES "produto"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grade" ADD CONSTRAINT "fk_grade_cor_id" FOREIGN KEY ("produto_cor_id") REFERENCES "produto_cor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "grade" ADD CONSTRAINT "fk_grade_tamanho_id" FOREIGN KEY ("produto_tamanho_id") REFERENCES "produto_tamanho"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item_pedido" ADD CONSTRAINT "fk_item_pedido_grade" FOREIGN KEY ("grade_id") REFERENCES "grade"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item_pedido" ADD CONSTRAINT "fk_item_pedido_produto" FOREIGN KEY ("produto_id") REFERENCES "produto"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item_pedido" ADD CONSTRAINT "gerente_id_item_pedido_fk" FOREIGN KEY ("gerente_id") REFERENCES "senha_gerente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item_pedido" ADD CONSTRAINT "fk_item_pedido_venda" FOREIGN KEY ("venda_id") REFERENCES "venda"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item_pedido_certificado" ADD CONSTRAINT "fk_item_pedido_certificado_venda" FOREIGN KEY ("venda_id") REFERENCES "venda"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "items_compra" ADD CONSTRAINT "items_compra_fk" FOREIGN KEY ("id_compra") REFERENCES "compra"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "items_compra" ADD CONSTRAINT "fk_items_compra_grade" FOREIGN KEY ("grade_id") REFERENCES "grade"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "items_compra" ADD CONSTRAINT "itemsCompras_produto_fk" FOREIGN KEY ("id_produto") REFERENCES "produto"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao" ADD CONSTRAINT "movimentacao_tipo_movimentacao_fk" FOREIGN KEY ("tipo_movimentacao_id") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao" ADD CONSTRAINT "movimentacao_tipo_pagamento_fk" FOREIGN KEY ("tipo_pagamento_id") REFERENCES "tipo_pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_caixa" ADD CONSTRAINT "fk_movimentacao_caixa" FOREIGN KEY ("operacao") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_caixa" ADD CONSTRAINT "fk_movimentacao_caixa_cheque" FOREIGN KEY ("cheque_id") REFERENCES "cheque"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_tesouraria" ADD CONSTRAINT "tesouraria_fechamento_caixa_fk" FOREIGN KEY ("fechamento_caixa_id") REFERENCES "fechamento_caixa"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_tesouraria" ADD CONSTRAINT "movimentacao_tesouraria_fechamento_tesouraria_fk" FOREIGN KEY ("fechamento_tesouraria_id") REFERENCES "fechamento_tesouraria"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_tesouraria_cheque" ADD CONSTRAINT "fk_movimentacao_tesouraria_cheque_cheque" FOREIGN KEY ("cheque_id") REFERENCES "cheque"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "movimentacao_tesouraria_cheque" ADD CONSTRAINT "fk_movimentacao_tesouraria_cheque_movimentacao_tesouraria" FOREIGN KEY ("movimentacao_tesouraria_id") REFERENCES "movimentacao_tesouraria"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "operadora" ADD CONSTRAINT "fk_banco" FOREIGN KEY ("id_banco") REFERENCES "banco"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pagamento" ADD CONSTRAINT "pagamento_compra_id_fk" FOREIGN KEY ("compra_id") REFERENCES "compra"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pagamento" ADD CONSTRAINT "pagamento_fechamento_caixa_fk" FOREIGN KEY ("fechamento_caixa_id") REFERENCES "fechamento_caixa"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pagamento" ADD CONSTRAINT "fk_fechamento_tesouraria_id" FOREIGN KEY ("fechamento_tesouraria_id") REFERENCES "fechamento_tesouraria"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pagamento" ADD CONSTRAINT "pagamento_pessoa_fisica_id_fk" FOREIGN KEY ("pessoa_fisica_id") REFERENCES "pessoa_fisica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pagamento" ADD CONSTRAINT "pagamento_pessoa_juridica_id_fk" FOREIGN KEY ("pessoa_juridica_id") REFERENCES "pessoa_juridica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pagamento" ADD CONSTRAINT "pagamento_venda_id_fk" FOREIGN KEY ("venda_id") REFERENCES "venda"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pagamento_cheque_terceiros" ADD CONSTRAINT "pagamento_cheque_terceiros_cheque_fk" FOREIGN KEY ("cheque_id") REFERENCES "cheque"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pagamento_cheque_terceiros" ADD CONSTRAINT "pagamento_cheque_terceiros_tipo_pagamento_contas_pagar_fk" FOREIGN KEY ("tipo_pagamento_contas_pagar_id") REFERENCES "tipo_pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parcelas_contas_pagar" ADD CONSTRAINT "parcelas_contas_pagar_contas_pagar_id_fk" FOREIGN KEY ("contas_pagar_id") REFERENCES "contas_pagar"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parcelas_contas_receber" ADD CONSTRAINT "parcelas_contas_receber_contas_receber_id_fk" FOREIGN KEY ("contas_receber_id") REFERENCES "contas_receber"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parcelas_pagamento" ADD CONSTRAINT "fk_parcelas_pagamento_conta_corrente" FOREIGN KEY ("conta_corrente_id") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parcelas_pagamento" ADD CONSTRAINT "parcelas_pagamento_tipo_pagamento_id_fk" FOREIGN KEY ("tipo_pagamento_id") REFERENCES "tipo_pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_banco" FOREIGN KEY ("banco") REFERENCES "banco"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_banco1" FOREIGN KEY ("banco1") REFERENCES "banco"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_banco2" FOREIGN KEY ("banco2") REFERENCES "banco"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_categoria" FOREIGN KEY ("categoria") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_pessoaFisica_categoria_reservista_cd_complementares" FOREIGN KEY ("categoria_reservista") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_dfTipo" FOREIGN KEY ("df_tipo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_dfTipo2" FOREIGN KEY ("df_tipo2") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_escolaridade" FOREIGN KEY ("escolaridade") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_estadoCivil" FOREIGN KEY ("estado_civil") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_sexo" FOREIGN KEY ("sexo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_tipo" FOREIGN KEY ("tipo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_tipo2" FOREIGN KEY ("tipo2") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica" ADD CONSTRAINT "fk_tipo3" FOREIGN KEY ("tipo3") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica_dependentes" ADD CONSTRAINT "fk_pessoa_fisica_dependentes_sexo_cd_complementares" FOREIGN KEY ("sexo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica_dependentes" ADD CONSTRAINT "pessoaFisicaDependentes_pessoaFisica_fk" FOREIGN KEY ("id_pessoa_fisica") REFERENCES "pessoa_fisica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_fisica_documento" ADD CONSTRAINT "pessoaFisicaDocumento_pessoaFisica_fk" FOREIGN KEY ("id_pessoa_fisica") REFERENCES "pessoa_fisica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_juridica" ADD CONSTRAINT "fk_tipo" FOREIGN KEY ("tipo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_juridica" ADD CONSTRAINT "fk_tipo1" FOREIGN KEY ("tipo1") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_juridica_contato" ADD CONSTRAINT "fk_tipo" FOREIGN KEY ("tipo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_juridica_contato" ADD CONSTRAINT "fk_tipo1" FOREIGN KEY ("tipo1") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pessoa_juridica_contato" ADD CONSTRAINT "fk_pessoaJuridica" FOREIGN KEY ("id_pessoajuridica") REFERENCES "pessoa_juridica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "preco_produto" ADD CONSTRAINT "fk_preco_produto_cd_complementares" FOREIGN KEY ("tipo") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "preco_produto" ADD CONSTRAINT "preco_produto_grade_fk" FOREIGN KEY ("grade_id") REFERENCES "grade"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "preco_produto" ADD CONSTRAINT "preco_produto_fk" FOREIGN KEY ("id_produto") REFERENCES "produto"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "fk_produto_classe" FOREIGN KEY ("classe_id") REFERENCES "produto_classe"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "fk_produto_subclasse" FOREIGN KEY ("subclasse_id") REFERENCES "produto_classe"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "fk_produto_grupo" FOREIGN KEY ("grupo_id") REFERENCES "produto_grupo"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "fk_produto_subgrupo" FOREIGN KEY ("subgrupo_id") REFERENCES "produto_grupo"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "fk_produto_marca" FOREIGN KEY ("marca_id") REFERENCES "produto_marca"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto" ADD CONSTRAINT "fk_produto_unidade" FOREIGN KEY ("unidade_id") REFERENCES "produto_unidade"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto_classe" ADD CONSTRAINT "fk_classe_pai" FOREIGN KEY ("produto_classe_id") REFERENCES "produto_classe"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto_grupo" ADD CONSTRAINT "fk_grupo_pai" FOREIGN KEY ("grupo_id_pai") REFERENCES "produto_grupo"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "produto_imagens" ADD CONSTRAINT "fk_produto_imagens_produto_id" FOREIGN KEY ("produto_id") REFERENCES "produto"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "programar_pagamento" ADD CONSTRAINT "pPgamento_compra_fk" FOREIGN KEY ("id_compra") REFERENCES "compra"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "relacao_caixa" ADD CONSTRAINT "fk_caixa" FOREIGN KEY ("caixa_id") REFERENCES "caixa"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "relacao_caixa" ADD CONSTRAINT "fk_funcionario" FOREIGN KEY ("funcionario_id") REFERENCES "funcionario"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "remessas" ADD CONSTRAINT "remessas_conta_corrente_fk" FOREIGN KEY ("conta_corrente_id") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "senha_gerente" ADD CONSTRAINT "senha_gerente_funcionario_fk" FOREIGN KEY ("funcionario_id") REFERENCES "funcionario"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "servico" ADD CONSTRAINT "fk_servico_cd_complementares_setor" FOREIGN KEY ("setor") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "servico" ADD CONSTRAINT "fk_servico_cd_complementares_tipo_fornecedor" FOREIGN KEY ("tipo_fornecedor") REFERENCES "cd_complementares"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "servico" ADD CONSTRAINT "fk_servico_plano_de_contas" FOREIGN KEY ("plano_de_contas_id") REFERENCES "plano_de_contas"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tipo_pagamento" ADD CONSTRAINT "pagamento_bandeiras_id_fk" FOREIGN KEY ("bandeira_id") REFERENCES "bandeiras"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tipo_pagamento" ADD CONSTRAINT "pagamento_conta_corrente_id_fk" FOREIGN KEY ("conta_corrente_id") REFERENCES "conta_corrente"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tipo_pagamento" ADD CONSTRAINT "pagamento_financeira_id_fk" FOREIGN KEY ("financeira_id") REFERENCES "financeira"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tipo_pagamento" ADD CONSTRAINT "pagamento_formas_de_pagamento_id_fk" FOREIGN KEY ("forma_pagamento_id") REFERENCES "formas_de_pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tipo_pagamento" ADD CONSTRAINT "pagamento_operadora_id_fk" FOREIGN KEY ("operadora_id") REFERENCES "operadora"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tipo_pagamento" ADD CONSTRAINT "pagamento_pagamento_id_fk" FOREIGN KEY ("pagamento_id") REFERENCES "pagamento"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "fk_contas_pagar_comissao_funcionario" FOREIGN KEY ("contas_pagar_id") REFERENCES "contas_pagar"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "fk_venda_funcionario" FOREIGN KEY ("funcionario_id") REFERENCES "funcionario"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "fk_venda_pessoa_fisica_id" FOREIGN KEY ("pessoa_fisica_id") REFERENCES "pessoa_fisica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "fk_venda_pessoa_juridica_id" FOREIGN KEY ("pessoa_juridica_id") REFERENCES "pessoa_juridica"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
