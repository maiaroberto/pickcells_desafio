-- Teste Pickcells
-- SQL script select disciplinas com maior credito
-- Author : Roberto Maia Filho
SELECT id_disciplina, 
       disciplina.disciplina, 
       creditos 
       FROM creditos 
       INNER JOIN tipo_curso ON id_tipo = tipo_curso.id 
       INNER JOIN curso ON id_curso = curso.id 
       INNER JOIN disciplina ON id_disciplina = disciplina.id 
       WHERE obrigatorio AND id_tipo = '{tipoCurso}' and id_curso = '{curso}'
       ORDER BY id_disciplina