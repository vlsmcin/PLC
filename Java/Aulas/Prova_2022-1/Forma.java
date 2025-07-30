public abstract class Forma {
    public double PosicaoX, posicaoY;

    public abstract double area();

    public void move(double deltaX, double deltaY) {
        PosicaoX += deltaX;
        posicaoY += deltaY;
    }
}
