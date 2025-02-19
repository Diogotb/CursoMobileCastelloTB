public class App {
    public static void main(String[] args) throws Exception {
        OlaMundo olaAna = new OlaMundo("Ana");
        OlaMundo olaJose = new OlaMundo("José");
        olaAna.printText();
        olaAna.boasVindas();
        olaJose.boasVindas();
    }
}
