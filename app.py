
from Service.dbConnection import create_connection

con = create_connection()

if con.is_connected():

    cur = con.cursor()

    sql_texto = "SELECT SUM(creditos), id_tipo, id_curso, tipo_curso.tipo, curso.curso FROM creditos INNER JOIN tipo_curso ON id_tipo = tipo_curso.id INNER JOIN curso ON id_curso = curso.id WHERE obrigatorio GROUP BY id_tipo, id_curso order by SUM(creditos) desc, id_tipo desc"

    cur.execute(sql_texto)

    returned_data = cur.fetchone()
    totalCreditos = returned_data[0]
    tipoCurso = returned_data[1]
    curso = returned_data[2]
    tipoDesc = returned_data[3]
    cursoDesc = returned_data[4]

    print(f"Curso: '{tipoDesc}' - '{cursoDesc}'")
    print("Disciplinas: [")

    cur.fetchall()

    sql_texto = f"SELECT id_disciplina, disciplina.disciplina, creditos FROM creditos INNER JOIN tipo_curso ON id_tipo = tipo_curso.id INNER JOIN curso ON id_curso = curso.id INNER JOIN disciplina ON id_disciplina = disciplina.id WHERE obrigatorio AND id_tipo = '{tipoCurso}' and id_curso = '{curso}' ORDER BY id_disciplina"
    
    cur = con.cursor(buffered=True)

    cur.execute(sql_texto)

    returned_data = cur.fetchall()

    for row in returned_data:
        print("    {")
        print(f"         descrição: {row[1]},")
        print(f"         créditos: {row[2]}")
        print("    },")

    print("]")
    print("")
    print(f"créditos obrigatórios: {totalCreditos}")
    