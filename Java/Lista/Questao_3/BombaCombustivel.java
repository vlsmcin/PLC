public interface BombaCombustivel {
    void abastecer(Automovel automovel, double quantidadeLitros);
    void calcularCusto(double quantidadeLitros);
    void ajustarPreco(double novoPreco);
}
