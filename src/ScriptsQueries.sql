use oficina;

select * from Cliente;

select * from Cliente where Nome like 'L%';

-- Crie expressões para gerar atributos derivados
select (sum(ValorPecas)+sum(ValorMaoDeObra)) as ValorTotal from Servico;

-- Defina ordenações dos dados com ORDER BY
select Descricao, (ValorPecas + ValorMaoDeObra) as Total from Servico order by Total desc;

-- Condições de filtros aos grupos – HAVING Statement
select idPeca from ServicoPeca group by idPeca having count(idPeca)>1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select c.Nome
    from Cliente c
    inner join OrdemServico o on c.id = o.idCliente
    inner join StatusOrdemServico so on so.id = o.idStatusOrdemServico
    WHERE
    so.Identificacao = 'ABERTO';
