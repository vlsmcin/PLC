public enum Ticket {
    ADULTO(0),
    CRIANCA(1);

    private int codTicket;

    private Ticket(int codigo) {
        codTicket = codigo;
    }
}