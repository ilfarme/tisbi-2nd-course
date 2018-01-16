#include <iostream>
using namespace std;

int main()
{
    bool isExit = false;
    int i=0;
    int myStack[5];

    for (int i=0; i<5; i++) {
        myStack[i]=0;
    }

    do {
        cout << "1. Добавить элемент на вершину стека" << endl;
        cout << "2. Удалить элемент из вершины стека" << endl;
        cout << "3. Вывести содержимое стека на экран" << endl;
        cout << "4. Выход" << endl;
        cout << "Введите значение: ";
        int menu;
        cin >> menu;

        switch (menu) {
            case 1: {
                cout << "Значение добавляемого элемента: ";
                int element;
                cin >> element;
                myStack[i]=element;
                i++;
                cout << "Элемент добавлен." << endl;
                cout << endl;
                continue;
            }
            case 2: {
                if (i !=0) {
                    i--;
                    myStack[i] = 0;
                    cout << "Элемент удалён" << endl;
                } else cout << "Стек пуст" << endl;
                cout << endl;
            }
            case 3: {
                cout << "Ваш стэк: " << endl;
                for (int i = 0; i < 5; ++i) {
                    cout << myStack[i] << " ";
                }
                cout << "<-- Вершина." << endl;
                cout << endl;
            }
        }

    } while (isExit = true);
}