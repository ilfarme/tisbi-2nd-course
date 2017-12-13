import java.util.Arrays;
import java.util.Scanner;

public class Main {

    public static final int StackSize = 4; // Размерность стека

    public static void main(String[] args) {
        int myStack[]=null;
        myStack = new int[StackSize];
        int i=0;
        boolean notExit=true;

        Scanner in = new Scanner(System.in);

        while(notExit) {
            System.out.println();
            System.out.println("1. Добавить элемент на врершину стека");
            System.out.println("2. Удалить элемент с вершины стека");
            System.out.println("3. Вывод стека на экран");
            System.out.println("4. Выход из программы");
            System.out.print("Введите значение: ");

            int input = in.nextInt();

            switch (input) {
                case 1: if (i != StackSize) {
                    System.out.print("Введите значение добавляемого элемента: ");
                int push_value = in.nextInt();
                myStack[i] = push_value;
                i++;
                } else System.out.println("Стек заполнен. Удалите элементы.");

                continue;

                case 2: if (i != 0) {
                    i--;
                    myStack[i] = 0;
                } else System.out.println("Стек пуст.");
                    continue;

                case 3: System.out.println();
                String myStackString = Arrays.toString(myStack);
                System.out.print("ДНО ");
                System.out.print(myStackString);
                System.out.println(" ВЕРШИНА");
                    continue;

                case 4: notExit = false;
                break;

                default: System.out.println("Необходимо было выбрать пункт меню. Попробуйте ещё раз.");
                    continue;
            }
        }
    }
}
