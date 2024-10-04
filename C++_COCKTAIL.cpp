#include <iostream>

using namespace std;

void CocktailSort(int V[], int T){
    int Inicio = 0, Fim = T - 1;
    for(int i = 0; i < (T/2) + 1; i++){
        for(int j = Inicio + 1; j <= Fim; j++){
            if(V[j-1] > V[j]){
                swap(V[j-1], V[j]);
            }
        }
        for(int j = Fim - 1; j >= Inicio; j--){
            if(V[j+1] < V[j]){
                swap(V[j+1], V[j]);
            }
        }
        Inicio ++;
        Fim --;
    }
}

int main(){
    int V[100] = {0};
    int N; 
    int j = 0;
    while (cin >> N && N != 0){
        V[j] = N;
        j++;
    }

    cout << "Pre Oredenacao:" << endl;
    for(int i = 0; i < j; i++){
        cout << V[i] << " ";
    }
    cout << endl;

    CocktailSort(V, j);

    cout << endl << "Pos Ordenacao:" << endl;
    for(int i = 0; i < j; i++){
        cout << V[i] << " ";
    }
    cout << endl;

    return 0;
    
}