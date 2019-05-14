def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end


def menu
    puts 'Escoja una entre las siguientes 4 opciones de 1 a 3. Pulse 4 para salir: '
    puts '1)Alumno y su promedio de notas'
    puts '2)Asistencias e Inasistencias'
    puts '3)Alumnos Aprobados'
    puts '4)Abandonar'
end




num = 0
while num != 4
    menu
    num = gets.chomp.to_i
    case num
    when 1
    
    when 2
     
    when 3
        
    when 4
        puts 'Haz abandonado el programa'
        
    else
        puts 'opción no válida'
    end
end
