class Persona {

    private string nombre {get;}
    private int edad {get;}
    private int DNI {get;}

    public Persona(string nombre, int edad, int DNI) {

        this.nombre = nombre;
        this.edad = edad;
        this.DNI = DNI;

    }

    public string texto() {

        return $"{this.nombre}      {this.edad}       {this.DNI}";

    }

    public bool esMayorQue(Persona p) {

        return this.edad > p.edad;

    }

}