puts 'cargando algunos departamentos...'
['La Paz', 'Chuquisaca', 'Oruro', 'Tarija'].each do |dep|
	Department.create(name: dep) 
end

puts 'cargando algunas provincias para la Paz...'
department = Department.find_by_name('La Paz')
if department
	id_la_paz =  department.id
	['Aroma', 'Caranavi', 'Inquisivi', 'Murillo'].each do |prov|
		Province.create(name: prov, department_id: id_la_paz)
	end
end

puts 'cargando municipios para murillo...'
province = Province.find_by_name('Murillo')
if province
	id_murillo =  province.id
	['La Paz', 'El Alto', 'Mecapaca', 'Achocalla', 'Palca'].each do |mun|
		Municipality.create(name: mun, province_id: id_murillo)
	end
end