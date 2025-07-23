public class Automovel {
    private double CombustivelAtual;
    private double capacidadeMaximaTanque;
    private TipoMotor motor;

    public Automovel(double capacidadeMaximaTanque, TipoMotor motor) {
        this.capacidadeMaximaTanque = capacidadeMaximaTanque;
        this.CombustivelAtual = 0;
        this.motor = motor;
    }

    public double getCapacidadeMaximaTanque() {
        return capacidadeMaximaTanque;
    }

    public double getCombustivelAtual() {
        return CombustivelAtual;
    }

    public void setCombustivelAtual(double combustivelAtual) {
        CombustivelAtual = combustivelAtual;
    }
}
