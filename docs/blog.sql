# Host: localhost  (Version: 5.5.53)
# Date: 2018-12-19 09:51:20
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Database "blog"
#

CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `blog`;

#
# Structure for table "articles"
#

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ctime` varchar(255) NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "articles"
#

/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'谢俊向坐我旁边?','# 呵呵!\r\n','2018-12-17 10:49:22',1),(2,'谢俊真牛逼!','吴聪也牛逼!','2018-12-17 10:57:42',1),(3,'谢俊儿真牛逼!!!','吴聪儿真牛!!','2018-12-17 10:59:21',1),(4,'哈哈哈','啊啊啊','2018-12-17 11:13:58',1),(5,'谢俊废了吴聪牛了邰姐妈咪了!','        ## node day01 ##\r\n\r\n### node的简介 ###\r\n\r\n- 前后端分离:\r\n\r\n\t前端负责写页面, 和发送ajax请求获取数据, 通过模板引擎进行渲染\r\n\t\r\n\t后端负责写接口, 提供数据\r\n\r\n- node环境的JavaScript\r\n\r\n\t不同于浏览器中js, 不存在DOM和BOM的概念\r\n\r\n\t以前所说的js的组成: ECMAScript + BOM + DOM, 其实是指在浏览器中JS的组成\r\n\r\n\t\tdocument.getElementById() // DOM中的方法\r\n\t\tvar arr = []\r\n\t\tarr.sort() // ECMAScript中规范的方法\r\n\r\n\t共同点: 只要是js, 都会遵循ECMAScrit规范\r\n\r\n\tnode环境的js组成: ECMAScript + 全局成员 + 内置模块 + 第三方模块\r\n\r\n\tnpm: node package manager (node包管理器)\r\n\r\n- 使用node运行js\r\n\r\n\t打开终端(Windows控制台) , cmd\r\n\r\n### ES6新语法 ###\r\n\r\n1. let关键字\r\n\r\n\t由于JS历史遗留问题, 声明变量一直使用var关键字, 特点就是有变量声明提升, 没有块级作用域\r\n\r\n\tlet关键字的出现就是为了解决上述两个问题, 特点如下:\r\n\r\n\ta. let声明变量必须声明后才可以使用, 如果在声明之前使用变量会直接报错: xxx is not defined\r\n\r\n\tb. let声明变量不赋值, 默认值也是undefined\r\n\r\n\tc. let声明的变量有块级作用域, 如果在if/while/for等有大括号的代码中声明变量, 出了这个大括号就无法访问了\r\n\r\n\td. let和const都无法重复声明变量, 一旦变量被声明就不可再次声明\r\n\r\n2. const关键字\r\n\r\n\t不同于let的是, const用于声明常量, 一旦被声明必须立即赋值, 并且永远不可修改\r\n\r\n\ta. const声明的常量必须立即赋值\r\n\r\n\tb. 不可被再次修改\r\n\r\n\tc. 其他地方同let\r\n\r\n3. 解构赋值\r\n\r\n\t作用: 将对象的属性提取出来存在变量中, 例如, 将userInfo对象的name和age属性提取出来放到name和age变量中存储:\r\n\r\n\t\tlet userInfo = {\r\n\t\t\tname: \'谢俊\',\r\n\t\t\tage: 30,\r\n\t\t\tgender: \'男\',\r\n\t\t\tsayHi: function() {\r\n\t\t\t\tconsole.log(\'大家好我是\' + this.name)\r\n\t\t\t}\r\n\t\t}\r\n\t\t// 以前的做法:\r\n\t\t// let name = userInfo.name\r\n\t\t// let userAge = userInfo.age\r\n\t\t// let sayHi = userInfo.sayHi\r\n\t\t// sayHi()\r\n\t\t// ES6解构赋值的做法:\r\n\t\tlet { name, age: userAge, sayHi } = userInfo\r\n\t\t// 以上代码只是将用户信息的属性值提取出来存到变量中了, 如果修改变量name或userAge, 不会影响userInfo中的数据, 因为这是基本数据类型, 传递数据都是值传递\r\n\r\n4. 箭头函数\r\n\r\n\t作用: 为了解决函数内部this指向的问题, 箭头函数的特点就是, 函数内部的this永远指向函数外部的this\r\n\r\n\t语法:\r\n\r\n\t\t// 小括号里面写形参列表\r\n\t\t// 大括号里面写函数体\r\n\t\t() => {}\r\n\r\n\t简便写法:\r\n\r\n\ta. 如果形参列表只有一个参数, 可以省略小括号, 注意: 如果一个参数都没有或者两个以上的参数必须加上小括号`()`\r\n\r\n\tb. 如果函数体中只有一行代码, 那么右侧的大括号`{}`可以省略, 并且还需要去掉return关键字, 默认会把这一行代码执行的结果返回出去\r\n\r\n5. 添加对象属性或方法的简便写法\r\n\r\n\t作用: 把和对象属性同名的变量快速的添加到对象中\r\n\r\n\t以前的写法\r\n\r\n\t\tlet name = \'谢俊\'\r\n\t\tlet age = 30\r\n\t\t\r\n\t\tlet obj = {\r\n\t\t  name: name,\r\n\t\t  age: age\r\n\t\t}\r\n\r\n\tES6的写法:\r\n\r\n\t\tlet name = \'谢俊\'\r\n\t\tlet age = 30\r\n\t\tlet fn = function () {\r\n\t\t  console.log(\'我是fn\')\r\n\t\t}\r\n\t\t\r\n\t\tlet obj = {\r\n\t\t  name,\r\n\t\t  age,\r\n\t\t  fn,\r\n\t\t  sayHi() {\r\n\t\t    \r\n\t\t  }\r\n\t\t}\r\n\r\n\r\n### fs模块 ###\r\n\r\nfs模块属于核心模块, 只要安装了node环境就会携带, 使用方法先导入该模块:\r\n\r\n\tconst fs = require(\'fs\')\r\n\r\n1. 读取文件\r\n\r\n\t\tfs.readFile()\r\n\r\n\t参数1: 路径 path, 可以是相对路径\r\n\r\n\t参数2: 可选值 编码\r\n\r\n\t参数3: 读取完成的回调函数, 该回调函数中有两个参数, 第一个是错误信息err, 第二个是读取的数据data, 如果没有指定编码, data是Buffer类型的数据, 可以通过toString转为字符串\r\n\r\n2. 写入文件\r\n\r\n\t\tfs.writeFile()\r\n\r\n\t参数1: 路径\r\n\r\n\t参数2: 要写入的数据, 类型可以是string或buffer\r\n\r\n\t参数3: 可选值 编码 默认utf-8\r\n\r\n\t参数4: 回调函数, 该回调函数只有一个参数错误信息err\r\n\r\n\t**注意: 如果要写入的文件不存在, 会创建文件后写入**\r\n\r\n3. 追加文件\r\n\r\n\t\tfs.appendFile()\r\n\r\n\t参数1: 路径\r\n\r\n\t参数2: 要追加的数据, 类型可以是string或buffer\r\n\r\n\t参数3: 可选值 编码 默认utf-8\r\n\r\n\t参数4: 回调函数, 该回调函数只有一个参数错误信息err\r\n\r\n\t**注意: 如果要追加的文件不存在, 会创建文件后追加**\r\n\r\n\r\n4. 复制文件\r\n\r\n\t\tfs.copyFile()\r\n\r\n\t参数1: 源路径\r\n\r\n\t参数2: 目标路径\r\n\r\n\t参数3: 可选值 flags 无视掉\r\n\r\n\t参数4: 回调函数, 该回调函数只有一个参数错误信息err\r\n      \r\n      \r\n      \r\n      \r\n      ','2018-12-17 15:42:14',1),(6,'这是谢俊废了毕生精力写出来的文章','## node day01 ##\r\n\r\n### node的简介 ###\r\n\r\n- 前后端分离:\r\n\r\n\t前端负责写页面, 和发送ajax请求获取数据, 通过模板引擎进行渲染\r\n\t\r\n\t后端负责写接口, 提供数据\r\n\r\n- node环境的JavaScript\r\n\r\n\t不同于浏览器中js, 不存在DOM和BOM的概念\r\n\r\n\t以前所说的js的组成: ECMAScript + BOM + DOM, 其实是指在浏览器中JS的组成\r\n\r\n\t\tdocument.getElementById() // DOM中的方法\r\n\t\tvar arr = []\r\n\t\tarr.sort() // ECMAScript中规范的方法\r\n\r\n\t共同点: 只要是js, 都会遵循ECMAScrit规范\r\n\r\n\tnode环境的js组成: ECMAScript + 全局成员 + 内置模块 + 第三方模块\r\n\r\n\tnpm: node package manager (node包管理器)\r\n\r\n- 使用node运行js\r\n\r\n\t打开终端(Windows控制台) , cmd\r\n\r\n### ES6新语法 ###\r\n\r\n1. let关键字\r\n\r\n\t由于JS历史遗留问题, 声明变量一直使用var关键字, 特点就是有变量声明提升, 没有块级作用域\r\n\r\n\tlet关键字的出现就是为了解决上述两个问题, 特点如下:\r\n\r\n\ta. let声明变量必须声明后才可以使用, 如果在声明之前使用变量会直接报错: xxx is not defined\r\n\r\n\tb. let声明变量不赋值, 默认值也是undefined\r\n\r\n\tc. let声明的变量有块级作用域, 如果在if/while/for等有大括号的代码中声明变量, 出了这个大括号就无法访问了\r\n\r\n\td. let和const都无法重复声明变量, 一旦变量被声明就不可再次声明\r\n\r\n2. const关键字\r\n\r\n\t不同于let的是, const用于声明常量, 一旦被声明必须立即赋值, 并且永远不可修改\r\n\r\n\ta. const声明的常量必须立即赋值\r\n\r\n\tb. 不可被再次修改\r\n\r\n\tc. 其他地方同let\r\n\r\n3. 解构赋值\r\n\r\n\t作用: 将对象的属性提取出来存在变量中, 例如, 将userInfo对象的name和age属性提取出来放到name和age变量中存储:\r\n\r\n\t\tlet userInfo = {\r\n\t\t\tname: \'谢俊\',\r\n\t\t\tage: 30,\r\n\t\t\tgender: \'男\',\r\n\t\t\tsayHi: function() {\r\n\t\t\t\tconsole.log(\'大家好我是\' + this.name)\r\n\t\t\t}\r\n\t\t}\r\n\t\t// 以前的做法:\r\n\t\t// let name = userInfo.name\r\n\t\t// let userAge = userInfo.age\r\n\t\t// let sayHi = userInfo.sayHi\r\n\t\t// sayHi()\r\n\t\t// ES6解构赋值的做法:\r\n\t\tlet { name, age: userAge, sayHi } = userInfo\r\n\t\t// 以上代码只是将用户信息的属性值提取出来存到变量中了, 如果修改变量name或userAge, 不会影响userInfo中的数据, 因为这是基本数据类型, 传递数据都是值传递\r\n\r\n4. 箭头函数\r\n\r\n\t作用: 为了解决函数内部this指向的问题, 箭头函数的特点就是, 函数内部的this永远指向函数外部的this\r\n\r\n\t语法:\r\n\r\n\t\t// 小括号里面写形参列表\r\n\t\t// 大括号里面写函数体\r\n\t\t() => {}\r\n\r\n\t简便写法:\r\n\r\n\ta. 如果形参列表只有一个参数, 可以省略小括号, 注意: 如果一个参数都没有或者两个以上的参数必须加上小括号`()`\r\n\r\n\tb. 如果函数体中只有一行代码, 那么右侧的大括号`{}`可以省略, 并且还需要去掉return关键字, 默认会把这一行代码执行的结果返回出去\r\n\r\n5. 添加对象属性或方法的简便写法\r\n\r\n\t作用: 把和对象属性同名的变量快速的添加到对象中\r\n\r\n\t以前的写法\r\n\r\n\t\tlet name = \'谢俊\'\r\n\t\tlet age = 30\r\n\t\t\r\n\t\tlet obj = {\r\n\t\t  name: name,\r\n\t\t  age: age\r\n\t\t}\r\n\r\n\tES6的写法:\r\n\r\n\t\tlet name = \'谢俊\'\r\n\t\tlet age = 30\r\n\t\tlet fn = function () {\r\n\t\t  console.log(\'我是fn\')\r\n\t\t}\r\n\t\t\r\n\t\tlet obj = {\r\n\t\t  name,\r\n\t\t  age,\r\n\t\t  fn,\r\n\t\t  sayHi() {\r\n\t\t    \r\n\t\t  }\r\n\t\t}\r\n\r\n\r\n### fs模块 ###\r\n\r\nfs模块属于核心模块, 只要安装了node环境就会携带, 使用方法先导入该模块:\r\n\r\n\tconst fs = require(\'fs\')\r\n\r\n1. 读取文件\r\n\r\n\t\tfs.readFile()\r\n\r\n\t参数1: 路径 path, 可以是相对路径\r\n\r\n\t参数2: 可选值 编码\r\n\r\n\t参数3: 读取完成的回调函数, 该回调函数中有两个参数, 第一个是错误信息err, 第二个是读取的数据data, 如果没有指定编码, data是Buffer类型的数据, 可以通过toString转为字符串\r\n\r\n2. 写入文件\r\n\r\n\t\tfs.writeFile()\r\n\r\n\t参数1: 路径\r\n\r\n\t参数2: 要写入的数据, 类型可以是string或buffer\r\n\r\n\t参数3: 可选值 编码 默认utf-8\r\n\r\n\t参数4: 回调函数, 该回调函数只有一个参数错误信息err\r\n\r\n\t**注意: 如果要写入的文件不存在, 会创建文件后写入**\r\n\r\n3. 追加文件\r\n\r\n\t\tfs.appendFile()\r\n\r\n\t参数1: 路径\r\n\r\n\t参数2: 要追加的数据, 类型可以是string或buffer\r\n\r\n\t参数3: 可选值 编码 默认utf-8\r\n\r\n\t参数4: 回调函数, 该回调函数只有一个参数错误信息err\r\n\r\n\t**注意: 如果要追加的文件不存在, 会创建文件后追加**\r\n\r\n\r\n4. 复制文件\r\n\r\n\t\tfs.copyFile()\r\n\r\n\t参数1: 源路径\r\n\r\n\t参数2: 目标路径\r\n\r\n\t参数3: 可选值 flags 无视掉\r\n\r\n\t参数4: 回调函数, 该回调函数只有一个参数错误信息err\r\n      ','2018-12-17 14:53:40',1),(7,'邰姐说','喜欢妈咪海松','2018-12-17 16:36:27',3);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `ctime` varchar(255) NOT NULL DEFAULT '',
  `isdel` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'xiejun','123','渣渣俊','2018-12-14 16:12:06',0),(2,'xiejun2','123','渣渣俊2','2018-12-14 16:13:49',0),(3,'taijie','123','妈咪','2018-12-14 16:14:43',0),(4,'huabanxie','123','滑板鞋','2018-12-14 16:15:14',0),(5,'xiejun222','123','俊222','2018-12-14 16:43:07',0),(6,'xxx','xxx','xxx','2018-12-16 09:52:28',0),(7,'taijie2','123','邰姐海松妈咪','2018-12-17 16:53:51',0),(8,'taijie3','123','邰姐海松妈咪','2018-12-17 16:54:04',0),(9,'taijie4','$2a$10$aYlYmZlVW0dbdPcV3oc6Uebjsknk/puNOValz58RuAwSUGyA8nZ7G','邰姐海松妈咪','2018-12-17 16:55:06',0),(10,'taijie5','$2a$10$zDnuCkJ3xWHGMdow66mZYe6TabCygq9HbR85TSfpn7n1k8OSIQWrG','邰姐5','2018-12-17 16:59:02',0),(11,'taijie6','$2a$10$zDnuCkJ3xWHGMdow66mZYe6TabCygq9HbR85TSfpn7n1k8OSIQWrG','邰姐6','2018-12-17 16:59:47',0),(12,'taijie7','$2a$10$nZHvfrlBj8OsMs7.8jocxuYR3x1hJUZHEsHR17A7SzrzLbrKlE0Nm','邰姐6','2018-12-17 17:00:45',0),(13,'taijie8','$2a$10$Q97MVBEaVzXxGY5cfs9ubem3Myc9NwFD5RM6MfF.qklDHDicxlrYm','邰姐6','2018-12-17 17:00:55',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
