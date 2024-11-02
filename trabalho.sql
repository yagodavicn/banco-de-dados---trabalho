CREATE DATABASE  IF NOT EXISTS `instagram` 

CREATE TABLE `comentarios` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `id_postagem` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `conteudo` text NOT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `id_postagem` (`id_postagem`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_postagem`) REFERENCES `postagens` (`id_postagem`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `curtidas` (
  `id_curtida` int NOT NULL AUTO_INCREMENT,
  `id_postagem` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `conteudo` text,
  PRIMARY KEY (`id_curtida`),
  KEY `id_postagem` (`id_postagem`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `curtidas_ibfk_1` FOREIGN KEY (`id_postagem`) REFERENCES `postagens` (`id_postagem`) ON DELETE CASCADE,
  CONSTRAINT `curtidas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `postagens` (
  `id_postagem` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `conteudo` text NOT NULL,
  `data_postagem` date DEFAULT NULL,
  PRIMARY KEY (`id_postagem`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `postagens_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `relacionamentos` (
  `id_relacionamento` int NOT NULL AUTO_INCREMENT,
  `id_usuario1` int DEFAULT NULL,
  `id_usuario2` int DEFAULT NULL,
  `conteudo` text NOT NULL,
  `data_relacionamento` date DEFAULT NULL,
  PRIMARY KEY (`id_relacionamento`),
  KEY `id_usuario1` (`id_usuario1`),
  KEY `id_usuario2` (`id_usuario2`),
  CONSTRAINT `relacionamentos_ibfk_1` FOREIGN KEY (`id_usuario1`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `relacionamentos_ibfk_2` FOREIGN KEY (`id_usuario2`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `email` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `bio` text,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;