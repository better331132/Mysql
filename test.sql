insert into Test(students, subjects) select s.id, j.id from Students s, Subjects j;

select * from Test;

CREATE TABLE `Test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subjects` int(10) unsigned DEFAULT NULL,
  `students` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Test_students_idx` (`students`),
  KEY `fk_Test_subjects_idx` (`subjects`),
  CONSTRAINT `fk_Test_students` FOREIGN KEY (`students`) REFERENCES `Students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Test_subjects` FOREIGN KEY (`subjects`) REFERENCES `Subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8;
