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


def average
    arr = read_alum('alumnos.csv')
    arr.each do |i|
        name = i.shift 
        sum = 0
        i.each do |ele|
            sum += ele.to_f
        end
        puts '----------------------------------'
        puts "#{name} tiene un promedio de: #{sum /i.length}"
        puts '----------------------------------'
    end
end

def inasist 
    arr = read_alum('alumnos.csv')
    arr.each do |i|
        name = i.shift
        sum = 0
        i.each do |ele|
            if ele.to_i == 0 
                sum += 1
            end
        end
        puts '----------------------------------'
        puts "#{name} tiene #{sum} inasistencia"
        puts '----------------------------------'
    end
end


#TRANSFORMACION DE ARRAY/ARRAY A HASH
arreglo = read_alum('alumnos.csv')
aux_hash = {}
arreglo.each do |array|
    aux_arr = []
    array.each_with_index do |elem, index|
        if index == 0
            aux_hash[elem.to_sym] = ''
        else
            aux_arr.push(elem.to_i)
        end
    end
    aux_hash[array[0].to_sym] = aux_arr
end

def average_hash(arry)
    arry.sum / arry.length
end

def approved_alumns(nota50)
    nota50.each do |key, value|
        if average_hash(value) >= 5.0
            puts '---------------------------------------------'
            puts "#{key} aprobó con nota #{average_hash(value)}"
            puts '---------------------------------------------'
        end
    end
end

num = 0
while num != 4
    menu
    num = gets.chomp.to_i
    case num
    when 1
        average
    when 2
        inasist
    when 3
        approved_alumns(aux_hash)
    when 4
        puts 'Haz abandonado el programa'
    else
        puts 'opción no válida'
    end
end
