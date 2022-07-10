CREATE TABLE `categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `produtos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `lote` varchar(255) DEFAULT NULL,
  `unidade` varchar(255) DEFAULT NULL,
  `categorium_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_produtos_on_categorium_id` (`categorium_id`),
  CONSTRAINT `fk_rails_76714fd8d7` FOREIGN KEY (`categorium_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=720 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estoques` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `posicao` varchar(255) DEFAULT NULL,
  `maximo` int DEFAULT NULL,
  `produto_id` bigint NOT NULL,
  `quantidade` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estoques_on_produto_id` (`produto_id`),
  CONSTRAINT `fk_rails_4226040c9f` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `enderecos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `estabelecimentos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  `endereco_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estabelecimentos_on_endereco_id` (`endereco_id`),
  CONSTRAINT `fk_rails_8ea67b9f18` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `clientes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `endereco_id` bigint NOT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_clientes_on_endereco_id` (`endereco_id`),
  CONSTRAINT `fk_rails_dd8c0b6cbd` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `pagamentos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `aprovado_em` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `boletos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `pagamento_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_boletos_on_pagamento_id` (`pagamento_id`),
  CONSTRAINT `fk_rails_7349239547` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `pixes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chave` varchar(255) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `pagamento_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pixes_on_pagamento_id` (`pagamento_id`),
  CONSTRAINT `fk_rails_25ba455102` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `cartao_creditos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `pagamento_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cartao_creditos_on_pagamento_id` (`pagamento_id`),
  CONSTRAINT `fk_rails_50f0f60957` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `cartao_debitos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `pagamento_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cartao_debitos_on_pagamento_id` (`pagamento_id`),
  CONSTRAINT `fk_rails_e27c7c0890` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `estoquista` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estoquista_on_usuario_id` (`usuario_id`),
  CONSTRAINT `fk_rails_719e5244d9` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `entregadors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cnh` varchar(255) DEFAULT NULL,
  `veiculo` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `farmaceuticos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `crf` varchar(255) DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_farmaceuticos_on_usuario_id` (`usuario_id`),
  CONSTRAINT `fk_rails_8ab0d0a5e4` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `prescricaos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medico` varchar(255) DEFAULT NULL,
  `paciente` varchar(255) DEFAULT NULL,
  `aprovada` tinyint(1) DEFAULT NULL,
  `farmaceutico_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_prescricaos_on_farmaceutico_id` (`farmaceutico_id`),
  CONSTRAINT `fk_rails_487ce32f45` FOREIGN KEY (`farmaceutico_id`) REFERENCES `farmaceuticos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `pedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `endereco_id` bigint NOT NULL,
  `motivo_cancelamento` varchar(255) DEFAULT NULL,
  `codigo_rastreio` varchar(255) DEFAULT NULL,
  `cliente_id` bigint NOT NULL,
  `entregador_id` bigint NOT NULL,
  `prescricao_id` bigint NOT NULL,
  `estabelecimento_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pedidos_on_endereco_id` (`endereco_id`),
  KEY `index_pedidos_on_cliente_id` (`cliente_id`),
  KEY `index_pedidos_on_entregador_id` (`entregador_id`),
  KEY `index_pedidos_on_prescricao_id` (`prescricao_id`),
  KEY `index_pedidos_on_estabelecimento_id` (`estabelecimento_id`),
  CONSTRAINT `fk_rails_7beecbb574` FOREIGN KEY (`prescricao_id`) REFERENCES `prescricaos` (`id`),
  CONSTRAINT `fk_rails_8781d0f1b6` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_rails_8f81e8c5c1` FOREIGN KEY (`entregador_id`) REFERENCES `entregadors` (`id`),
  CONSTRAINT `fk_rails_9c57b5070f` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`),
  CONSTRAINT `fk_rails_b67671eaa0` FOREIGN KEY (`estabelecimento_id`) REFERENCES `estabelecimentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `produto_prescricaos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produto_id` bigint NOT NULL,
  `prescricao_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_produto_prescricaos_on_produto_id` (`produto_id`),
  KEY `index_produto_prescricaos_on_prescricao_id` (`prescricao_id`),
  CONSTRAINT `fk_rails_0eb5ee1710` FOREIGN KEY (`prescricao_id`) REFERENCES `prescricaos` (`id`),
  CONSTRAINT `fk_rails_c3d8ab616e` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `ordem_separacaos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint NOT NULL,
  `estoque_id` bigint NOT NULL,
  `estoquista_id` bigint NOT NULL,
  `quantidade` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ordem_separacaos_on_pedido_id` (`pedido_id`),
  KEY `index_ordem_separacaos_on_estoque_id` (`estoque_id`),
  KEY `index_ordem_separacaos_on_estoquista_id` (`estoquista_id`),
  CONSTRAINT `fk_rails_24eb64a50b` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`),
  CONSTRAINT `fk_rails_966ebab9b9` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `fk_rails_e3feb1b8d3` FOREIGN KEY (`estoquista_id`) REFERENCES `estoquista` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `produto_pedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produto_id` bigint NOT NULL,
  `pedido_id` bigint NOT NULL,
  `quantidade` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_produto_pedidos_on_produto_id` (`produto_id`),
  KEY `index_produto_pedidos_on_pedido_id` (`pedido_id`),
  CONSTRAINT `fk_rails_90d1c333ff` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `fk_rails_ac2d2cc452` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

