-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: xlabeller
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB-1:10.5.10+maria~focal-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `xlabeller`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `xlabeller` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `xlabeller`;

--
-- Table structure for table `ALGORITHM`
--

DROP TABLE IF EXISTS `ALGORITHM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ALGORITHM` (
  `ALGORITHM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(300) DEFAULT NULL,
  `DOCKER_CMD` longtext DEFAULT NULL,
  `TRAIN_PARAM` longtext DEFAULT NULL,
  `INFERENCE_PARAM` longtext DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `IS_ENABLE` int(11) DEFAULT NULL,
  `IS_FIXED` int(11) DEFAULT NULL,
  `BASE_IMAGE` varchar(200) DEFAULT NULL,
  `TRAIN_FUNC_NAME` varchar(200) DEFAULT NULL,
  `LOAD_FUNC_NAME` varchar(200) DEFAULT NULL,
  `INFERENCE_FUNC_NAME` varchar(200) DEFAULT NULL,
  `LABEL_TYPE` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`ALGORITHM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALGORITHM`
--

LOCK TABLES `ALGORITHM` WRITE;
/*!40000 ALTER TABLE `ALGORITHM` DISABLE KEYS */;
INSERT INTO `ALGORITHM` VALUES (2,'YOLO','yolo','[{\"name\":\"apt-get update\",\"type\":\"RUN\"},{\"name\":\"apt-get upgrade -y\",\"type\":\"RUN\"},{\"name\":\"apt-get install -y gcc make build-essential libssl-dev zlib1g-dev libbz2-dev\",\"type\":\"RUN\"},{\"name\":\"apt-get install -y libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev\",\"type\":\"RUN\"},{\"name\":\"pip install --upgrade pip\",\"type\":\"RUN\"},{\"name\":\"pip install terminaltables==3.1.0\",\"type\":\"RUN\"},{\"name\":\"pip install matplotlib==3.1.2\",\"type\":\"RUN\"},{\"name\":\"pip install opencv-python==4.2.0.32\",\"type\":\"RUN\"},{\"name\":\"pip install tqdm==4.42.1\",\"type\":\"RUN\"},{\"name\":\"pip install Pillow==7.0.0\",\"type\":\"RUN\"},{\"name\":\"pip install grpcio_tools==1.26.0\",\"type\":\"RUN\"},{\"name\":\"pip install grpcio==1.26.0\",\"type\":\"RUN\"}]','[{\"param\":\"epochs\",\"type\":\"number\",\"defaultvalue\":300,\"helper\":\"학습을 반복할 횟수\"},{\"param\":\"batch_size\",\"type\":\"number\",\"defaultvalue\":1,\"helper\":\"한번 학습하는데 사용하는 데이터 수\"},{\"param\":\"learning_rate\",\"type\":\"number\",\"defaultvalue\":0.00001,\"helper\":\"학습의 속도\"},{\"param\":\"beta_1\",\"type\":\"number\",\"defaultvalue\":0.9,\"helper\":\"Adam 옵티마이저의 momentum 감소 비율\"},{\"param\":\"beta_2\",\"type\":\"number\",\"defaultvalue\":0.999,\"helper\":\"Adam 옵티마이저의 adaptive term 감소 비율\"},{\"param\":\"weight_decay\",\"type\":\"number\",\"defaultvalue\":0,\"helper\":\"L2정규화의 가중치 비율\"},{\"param\":\"save_point\",\"type\":\"number\",\"defaultvalue\":25,\"helper\":\"checkpoint를 저장할 epoch의 단위\"},{\"param\":\"freeze_backbone\",\"type\":\"boolean\",\"defaultvalue\":true,\"helper\":\"true면 backbone을 학습하지 않고 false면 모형 전체를 학습\"}]','[{\"param\":\"classification_threshold\",\"type\":\"number\",\"defaultvalue\":0.5,\"helper\":\"최저 신뢰점수, 이 점수보다 낮은 상자는 사용하지 않습니다(값이 크면 상자의 개수가 줄어듬)\"},{\"param\":\"nms_threshold\",\"type\":\"number\",\"defaultvalue\":0.4,\"helper\":\"객체들의 동일성 최저점수, 이 점수보다 낮으면 다른 객체를 예측한 것으로 판단(값이 작으면 상자의 개수가 줄어듬)\"}]','2020-04-09 03:07:39',0,1,1,'pytorch/pytorch:1.4-cuda10.1-cudnn7-devel','Training.train','Predict.get_model','Predict.predict','IMAGE_BBOX'),(7,'EFFICIENTDET','EFFICIENTDET','[{\"name\":\"apt-get update\",\"type\":\"RUN\"},{\"name\":\"apt-get install -y vim gcc make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libsm6 libxext6 libxrender1 libfontconfig1\",\"type\":\"RUN\"},{\"name\":\"apt-get install -y gcc make build-essential libssl-dev zlib1g-dev libbz2-dev\",\"type\":\"RUN\"},{\"name\":\"apt-get install -y libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils\",\"type\":\"RUN\"},{\"name\":\"apt-get install -y tk-dev\",\"type\":\"RUN\"},{\"name\":\"apt-get install -y libsm6 libxext6 libxrender1 libfontconfig1\",\"type\":\"RUN\"},{\"name\":\"pip install --upgrade pip\",\"type\":\"RUN\"},{\"name\":\"pip install astroid==2.4.2\",\"type\":\"RUN\"},{\"name\":\"pip install certifi==2020.6.20\",\"type\":\"RUN\"},{\"name\":\"pip install cycler==0.10.0\",\"type\":\"RUN\"},{\"name\":\"pip install isort==5.4.2\",\"type\":\"RUN\"},{\"name\":\"pip install kiwisolver==1.2.0\",\"type\":\"RUN\"},{\"name\":\"pip install lazy-object-proxy==1.4.3\",\"type\":\"RUN\"},{\"name\":\"pip install matplotlib==3.3.1\",\"type\":\"RUN\"},{\"name\":\"pip install mccabe==0.6.1\",\"type\":\"RUN\"},{\"name\":\"pip install pylint==2.6.0\",\"type\":\"RUN\"},{\"name\":\"pip install pyparsing==2.4.7\",\"type\":\"RUN\"},{\"name\":\"pip install python-dateutil==2.8.1\",\"type\":\"RUN\"},{\"name\":\"pip install toml==0.10.1\",\"type\":\"RUN\"},{\"name\":\"pip install typed-ast==1.4.1\",\"type\":\"RUN\"},{\"name\":\"pip install wrapt==1.11.2\",\"type\":\"RUN\"}]','[{\"param\": \"learning_rate\",\"type\": \"number\",\"helper\": \"learning rate\",\"defaultvalue\": 0.01 },{\"param\": \"batch_size\",\"type\": \"number\",\"helper\": \"한번 학습하는데 사용하는 데이터 개수\",\"defaultvalue\": 26},{\"param\": \"epochs\",\"type\": \"number\",\"helper\": \"학습을 반복할 횟수\",\"defaultvalue\": 100},{\"param\": \"model\",\"type\": \"string\",\"helper\": \"model 이름\",\"defaultvalue\": \"tf_efficientdet_d2\"}]','[{\"param\": \"batch_size\",\"type\": \"number\",\"helper\": \"한번 학습하는데 사용하는 데이터 개수\",\"defaultvalue\": 26},{\"param\": \"epochs\",\"type\": \"number\",\"helper\": \"학습을 반복할 횟수\",\"defaultvalue\": 100},{\"param\": \"model\",\"type\": \"string\",\"helper\": \"model 이름\",\"defaultvalue\": \"tf_efficientdet_d2\"}]','2020-10-28 10:20:47',12,1,1,'nvidia/cuda:10.2-devel-ubuntu18.04','Training.train','Inference.create_model','Inference.inference','IMAGE_BBOX');
/*!40000 ALTER TABLE `ALGORITHM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ANNOTATION`
--

DROP TABLE IF EXISTS `ANNOTATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANNOTATION` (
  `ANNOTATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_DATE` datetime DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(200) DEFAULT NULL,
  `DATA` longblob DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `LABEL_TYPE` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`ANNOTATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANNOTATION`
--

LOCK TABLES `ANNOTATION` WRITE;
/*!40000 ALTER TABLE `ANNOTATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ANNOTATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATA`
--

DROP TABLE IF EXISTS `DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATA` (
  `DATA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATASET_ID` int(11) DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `MEDIA_TYPE` varchar(70) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `FPS` double DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CONFIRM_STATUS` int(11) DEFAULT NULL,
  `FILENAME` varchar(150) DEFAULT NULL,
  `FRAME` int(11) DEFAULT NULL,
  `DURATION` double DEFAULT NULL,
  PRIMARY KEY (`DATA_ID`),
  KEY `idx_path` (`PATH`)
) ENGINE=InnoDB AUTO_INCREMENT=7208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATA`
--

LOCK TABLES `DATA` WRITE;
/*!40000 ALTER TABLE `DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATASET`
--

DROP TABLE IF EXISTS `DATASET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATASET` (
  `DATASET_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(200) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `MEDIA_TYPE` varchar(70) DEFAULT NULL,
  `LABEL_TYPE` varchar(70) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `SAVE_DATA_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DATASET_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATASET`
--

LOCK TABLES `DATASET` WRITE;
/*!40000 ALTER TABLE `DATASET` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATASET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATASET_LOG`
--

DROP TABLE IF EXISTS `DATASET_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATASET_LOG` (
  `DATASET_LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DATASET_ID` int(11) DEFAULT NULL,
  `LOG_INFO` tinytext DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`DATASET_LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATASET_LOG`
--

LOCK TABLES `DATASET_LOG` WRITE;
/*!40000 ALTER TABLE `DATASET_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATASET_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GPU_NODE`
--

DROP TABLE IF EXISTS `GPU_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GPU_NODE` (
  `GPU_NODE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(45) DEFAULT NULL,
  `ACCOUNT` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(45) DEFAULT NULL,
  `PORT` int(11) DEFAULT 0,
  PRIMARY KEY (`GPU_NODE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GPU_NODE`
--

LOCK TABLES `GPU_NODE` WRITE;
/*!40000 ALTER TABLE `GPU_NODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GPU_NODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `META`
--

DROP TABLE IF EXISTS `META`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `META` (
  `META_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATA_ID` int(11) DEFAULT NULL,
  `LABEL` varchar(250) DEFAULT NULL,
  `INFO` longtext DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `LABEL_TYPE` varchar(70) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`META_ID`),
  KEY `label_idx` (`LABEL`),
  FULLTEXT KEY `info_idx` (`INFO`)
) ENGINE=InnoDB AUTO_INCREMENT=3292 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `META`
--

LOCK TABLES `META` WRITE;
/*!40000 ALTER TABLE `META` DISABLE KEYS */;
/*!40000 ALTER TABLE `META` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJECT` (
  `PROJECT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(200) DEFAULT NULL,
  `SOLUTION_TYPE` varchar(45) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `IS_FIXED` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES (2,'AUTO_LABEL_YOLO','YOLO','1','2021-11-24 09:55:50',0,1),(5,'AUTO_LABEL_EFFICIENTDET','EFFICIENTDET','1','2021-11-30 18:18:18',0,1);
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK`
--

DROP TABLE IF EXISTS `TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK` (
  `TASK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(200) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ALGORITHM` varchar(45) DEFAULT NULL,
  `CONFIG` varchar(500) DEFAULT NULL,
  `IS_ENABLE` int(11) DEFAULT NULL,
  `IS_FIXED` int(11) DEFAULT NULL,
  `ALGORITHM_ID` int(11) DEFAULT NULL,
  `BASE_TASK_ID` int(11) DEFAULT NULL,
  `LABEL_TYPE` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK`
--

LOCK TABLES `TASK` WRITE;
/*!40000 ALTER TABLE `TASK` DISABLE KEYS */;
INSERT INTO `TASK` VALUES (2,2,'yolo_coco','yolo coco','2020-04-16 05:43:42',0,NULL,'{\"epochs\":300,\"batch_size\":1,\"learning_rate\":0.00001,\"beta_1\":0.9,\"beta_2\":0.999,\"weight_decay\":0,\"save_point\":25,\"freeze_backbone\":true,\"pretrained_model\":null}',1,1,2,NULL,'IMAGE_BBOX'),(3,5,'efficientdet_coco','efficientdet coco','2021-11-30 05:43:42',0,NULL,'{\"batch_size\":26,\"pretrained_model\":null,\"model\":\"tf_efficientdet_d2\",\"epochs\":200}',1,1,7,NULL,'IMAGE_BBOX');
/*!40000 ALTER TABLE `TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(45) NOT NULL,
  `PASSWORD` varchar(500) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `LEVEL_CD` int(11) DEFAULT NULL,
  `X_KEY` varchar(150) NOT NULL,
  `LOGIN_COUNT` int(11) DEFAULT NULL,
  `ROOT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (11,'work1','1851a14b0d92c34bb6ee1c2d8ceebe5dd82c24ddb5926656c7df5bd33aec281f96c1e31ed48ceb3f5bee13e33cc88656105cba1717764f488cb89d4f9e6652be','2021-11-19 11:01:48',0,'BlB2jNI/0Dr658Gic3ZIzpeDX1eKtCXx6MxOjwxx210=',0,NULL);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-08 17:03:30
