public interface BombaCombustivel {
    void abastecer(Automovel automovel, double quantidadeLitros) throws CombustivelNaoCompativel, CombustivelOverflow;
    void calcularCusto(double quantidadeLitros);
    void ajustarPreco(double novoPreco);
}
