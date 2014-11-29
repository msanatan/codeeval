public class Main {

    public static String multiplicationTable(int N) {

        String message = "";
        String currentNum;
        for (int i = 1; i <= N; i++) {
            for (int j = 1; j <= N; j++) {
                currentNum = String.valueOf(j * i);
                if (j != 1) {
                    for (int k = 1; k <= 4 - currentNum.length(); k++) {
                        message += " ";
                    }
                }

                message += currentNum;
            }
            message += "\n";
        }

        return message;
    }

    public static void main(String[] args) {

        System.out.print(multiplicationTable(12));
    }
}
