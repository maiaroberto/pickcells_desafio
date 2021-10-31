SELECT SUM(creditos), id_tipo, id_curso, tipo_curso.tipo, curso.curso
FROM creditos
INNER JOIN tipo_curso ON id_tipo = tipo_curso.id
INNER JOIN curso      ON id_curso = curso.id
WHERE obrigatorio
GROUP BY id_tipo, id_curso
order by SUM(creditos) desc, id_tipo desc


