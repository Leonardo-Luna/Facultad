class LinkedList<T>
{

    private Nodo<T> first = null;
    private Nodo<T> last = null;


    public LinkedList() {}

    public void AgregarAdelante(T data)
    {

        Nodo<T> aux = new Nodo<T>(data);
        aux.Proximo = first;
        first = aux;

        //Si la lista está vacía pongo last en first, si no esta vacia no es necesario porque pierdo el ultimo
        if(last == null) {last = first;}

    }

    public void AgregarAtras(T data)
    {

        Nodo<T> aux = new Nodo<T>(data);
        aux.Proximo = null;

        if(this.first == null)
        {
            first = new Nodo<T>(data);
        }
        else
        {
            last.Proximo = aux;
        }
        last = aux;

    }

    public IEnumerator<T> GetEnumerator()
    {

        Nodo<T>? aux = first;

        while(aux != null)
        {

            yield return aux.Valor;
            aux = aux.Proximo;

        }

    }

}