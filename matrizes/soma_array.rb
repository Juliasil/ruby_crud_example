## Exercício 1: Soma de Array
#- **Descrição**: Escreva uma função que recebe um array de números e retorna a soma de todos os elementos.

#- **Regra**: Não utilize funções de bibliotecas que façam a soma diretamente

#- **Input**: [1, 2, 3, 4, 5]
#- **Output**: 15
#- **Input**: [-1, 1, 0, 5, -5]
#- **Output**: 0


list_array1 = [1, 2, 3, 4, 5]
list_array2 = [-1, 1, 0, 5, -5]
number = 0

list_array1.each do |element|
  number += element
end

puts number

number = 0

list_array2.each do |element|
  number += element
end

puts number



