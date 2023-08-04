menu_produtos = [
{cod: 1, produto: 'salada', preco: 14.99}, 
{cod: 2, produto: 'fritas', preco: 24.99},
{cod: 3, produto: 'hamburguer', preco: 29.99}
]
pedido = []

puts <<EOS
===================================
ACESSE NOSSO MENU E FAÇA SEU PEDIDO
===================================
EOS

indices_menu = ["[1] MENU"]
puts indices_menu
puts "Digite 1 para acessar nosso menu: "
opcao = gets.chomp.to_i
i = 1
total_pedido = 0
system("clear")
menu_produtos.each do |lista|
    puts "[#{i}]#{lista[:produto].upcase} --- R$#{lista[:preco]}"
    i += 1
end  

resp = "S"

while resp == "S"  
    puts "Digite o código do produto: "
    cod_produto = gets.chomp.to_i 
    menu_produtos.each do |item|
        if cod_produto == item[:cod]
            pedido << item[:produto]
            total_pedido = total_pedido + item[:preco]
        end
    end  
    novo_pedido = false    
    while novo_pedido == false do
        puts "Deseja inserir mais algum produto: [S]Sim / [C] Cancelar Item / [F]Finalizar"
        resp = gets.chomp.to_s.upcase
        if resp == "S"
            novo_pedido = true
        #elsif resp == "C"
        #    pedido.each.with_index{|item_cancela, index| puts "#{index + 1} --- #{item_cancela}"}
        #    puts "Digite o número do item que deseja cancelar: "
        #    index_delete = gets.chomp.to_i
        #    pedido.delete_at(index_delete - 1)
        #    total pedido = total pedido - menu_produtos[:preco[index_delete - 1]]
        elsif resp == "F"
            break
        else
            puts "Opção inválida."
            novo_pedido = false            
        end
    end
end
puts "Resumo do pedido:\n\n#{pedido.join("\n").upcase}"
puts "=" * 35
puts "O total do seu pedido foi R$ #{'%.2f' %total_pedido}."
