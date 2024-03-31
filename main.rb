def extrair_enderecos(texto)
		enderecos = []

		# Expressão regular para identificar endereços
		regex_endereco = /(?<tipo>Av\.|Rua|Travessa|Alameda|Praça|Avenida)\s(?<nome>.+?)\s*,\s?(?<numero>\d+)\s?(?:-\s?(?<complemento>.+?)\s*)?,\s?(?<bairro>.+),\s?(?<cidade>.+),\s?(?<estado>[A-Z]{2}),\s?(?<cep>\d{5}-\d{3})/

		# Extrai endereços usando regex
		texto.scan(regex_endereco) do |tipo, nome, numero, complemento, bairro, cidade, estado, cep|
				endereco = {
						tipo: tipo || 'Não especificado',
						nome: nome.strip || 'Não especificado',
						numero: numero || 'Não especificado',
						complemento: complemento || 'Não especificado',
						bairro: bairro || 'Não especificado',
						cidade: cidade || 'Não especificado',
						estado: estado || 'Não especificado',
						cep: cep || 'Não especificado'
				}
				enderecos << endereco
		end

		enderecos
end

# Teste com um exemplo de texto
texto = """
resido em Av. Eng. Eusébio Stevaux, 823 - Santo Amaro, São Paulo - SP, 04696-000 agora
aaaaaaaaaaaaaaa
Rua José Antonio Coelho, 95, Vila Mariana, São Paulo, SP, 04011-000
aasa121
Travessa do Arouche, 312, Centro, São Paulo, SP, 01048-000122121
"""

# Exibe os endereços extraídos
enderecos = extrair_enderecos(texto)

if enderecos.empty?
		puts "Nenhum endereço encontrado."
else
		enderecos.each_with_index do |endereco, i|
				puts "Endereço #{i + 1}:"
				endereco.each do |key, value|
						puts "#{key}: #{value}"
				end
				puts "\n"
		end
end
